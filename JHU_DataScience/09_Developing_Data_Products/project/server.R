# Load respective libraries for the application
library(shiny)
library(plotly)
library(ggplot2)


## Read filtered csv file and convert dates string
TS_Raw <- read.csv("TS2020.csv", na.strings = c("NA",0,"0"), header = TRUE)
str(TS_Raw)

## Convert the PM2.5 and PM10 indicator to numeric output
TS_Raw$PM2.5 <- as.numeric(TS_Raw$PM2.5)
TS_Raw$PM10 <- as.numeric(TS_Raw$PM10)

## Filter Data for complete cases and verify structure agian
TS_Clean <- TS_Raw[complete.cases(TS_Raw),]
str(TS_Clean)

# Setup Shiny Server for the setup 
shinyServer(
  function(input, output){
  
    fit1 <- lm(PM2.5 ~ SO2, data = TS_Clean)
    fit2 <- lm(PM2.5 ~ O3, data = TS_Clean)
    fit3 <- lm(PM2.5 ~ CO, data = TS_Clean)
    
    fit1_pred <- reactive({
      SO2_input <- input$SO2
      predict(fit1, newdata = data.frame(SO2 = SO2_input))
    })
    
    fit2_pred <- reactive({
      O3_input <- input$O3
      predict(fit2, newdata = data.frame(O3 = O3_input))
    })
    
    fit3_pred <- reactive({
      CO_input <- input$CO
      predict(fit3, newdata = data.frame(CO = CO_input))
    })
    
    output$fit1 <- renderText({
      fit1_pred()
    })
    
    output$fit2 <- renderText({
      fit2_pred()
    })
    
    output$fit3 <- renderText({
      fit3_pred()
    })

    output$SO2_Plot <- renderPlotly({
      SO2_input <- input$SO2_input
      x1min = min(TS_Clean$SO2)-0.5
      x1max = max(TS_Clean$SO2)+0.5
      y1min = min(TS_Clean$PM2.5)+0.5
      y1max = max(TS_Clean$PM2.5)+0.5
      
      a1 <- ggplot(TS_Clean, aes(x = SO2, y = PM2.5, 
                  ylab = "PM 2.5", xlab = "SO2"), 
                  bty = "n", 
                  pch = 16,
                  size = TS_Clean$PM2.5,
                  xlim = c(x1min, y1min), 
                  ylim = c(y1min, y1max)) + 
                  geom_point()
      
      a1 <- a1 + stat_smooth(method = 'lm', color = "#BB0000", lwd = 2)
      a1 <- a1+ ggtitle("Tamsui PM 2.5 vs Sulfur Dioxide Level Prediction")
      a1 <- a1 + geom_point(x = SO2_input, y = fit1_pred(), col = "#FBFFA2", pch = 16, cex = 6)
      
      ggplotly(a1) 
    })
    
    output$O3_Plot <- renderPlotly({
      O3_input <- input$O3_input
      x2min = min(TS_Clean$O3) - 0.5
      x2max = max(TS_Clean$O3) + 0.5
      y2min = min(TS_Clean$PM2.5) + 0.5
      y2max = max(TS_Clean$PM2.5) + 0.5
      
      a2 <- ggplot(TS_Clean, aes(x = O3, y = PM2.5, 
                                 ylab = "PM 2.5", xlab = "O3"), 
                   bty = "n", 
                   pch = 16,
                   size = TS_Clean$PM2.5,
                   xlim = c(x2min, y2min), 
                   ylim = c(y2min, y2max)) + 
        geom_point()
      
      a2 <- a2 + stat_smooth(method = 'lm', color = "#50B9FF", lwd = 2)
      a2 <- a2+ ggtitle("Tamsui PM 2.5 vs Ozone Level Prediction")
      a2 <- a2 + geom_point(x = O3_input, y = fit2_pred(), col = "#A4FDE2", pch = 16, cex = 6)
      
      ggplotly(a2) 
    })
    
    output$CO_Plot <- renderPlotly({
      CO_input <- input$CO_input
      x3min = min(TS_Clean$CO) - 0.05
      x3max = max(TS_Clean$CO) + 0.05
      y3min = min(TS_Clean$PM2.5) + 0.5
      y3max = max(TS_Clean$PM2.5) + 0.5
      
      a3 <- ggplot(TS_Clean, aes(x = CO, y = PM2.5, 
                                 ylab = "PM 2.5", xlab = "CO"), 
                   bty = "n", 
                   pch = 16,
                   size = TS_Clean$PM2.5,
                   xlim = c(x3min, y3min), 
                   ylim = c(y3min, y3max)) + 
      geom_point()
      
   
      a3 <- a3 + stat_smooth(method = 'lm', color = "#F0389F", lwd = 2)
      a3 <- a3+ ggtitle("Tamsui PM 2.5 vs Carbon Monoxide Level Prediction")
      a3 <- a3 + geom_point(x = CO_input, y = fit3_pred(), col = "#64047D", pch = 16, cex = 6)
      
      ggplotly(a3) 
    })
  }
)
