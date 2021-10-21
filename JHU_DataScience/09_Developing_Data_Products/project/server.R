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

## Covert the date as official date
TS_Raw$Time <- as.Date(TS_Raw$Time)

## Filter Data for complete cases and verify structure agian
TS_Clean <- TS_Raw[complete.cases(TS_Raw),]
str(TS_Clean)

# Setup Shiny Server for the setup 
shinyServer(
  function(input, output){
    
    # Generate the prediction model for each individual contributions
    fit1 <- lm(PM2.5 ~ SO2, data = TS_Clean)
    fit2 <- lm(PM2.5 ~ O3, data = TS_Clean)
    fit3 <- lm(PM2.5 ~ CO, data = TS_Clean)
    
    # Establish the prediction Model & Plotting for SO2
    
    ## Generate the prediction value based on the given input of ozone
    fit1_pred <- reactive({
      SO2_input <- input$SO2_input
      predict(fit1, newdata = data.frame(SO2 = SO2_input))
    })
    
    ## Generate the output plots based on the given information
    output$SO2_Plot <- renderPlotly({
      ## Define input for ozone from existing data and limits
      SO2_input <- input$SO2_input
      x2min = min(TS_Clean$SO2) - 0.5
      x2max = max(TS_Clean$SO2) + 0.5
      y2min = min(TS_Clean$PM2.5) + 0.5
      y2max = max(TS_Clean$PM2.5) + 0.5
      
      ## Generate the model based on existed data points 
      p1 <- ggplot(TS_Clean, aes(x = SO2, y = PM2.5, 
                                 ylab = "PM 2.5", xlab = "SO2"), 
                   bty = "n", 
                   pch = 16,
                   xlim = c(x2min, y2min), 
                   ylim = c(y2min, y2max)) + 
        geom_point()
      
      p1 <- p1 + stat_smooth(method = 'lm', color = "#FFED5F", lwd = 2)
      p1 <- p1 + ggtitle("Tamsui PM 2.5 vs SO2 Level Prediction")
      
      ## Add the prediction point in the existing model plot
      p1 <- p1 + geom_point(x = SO2_input, y = fit1_pred(), col = "#BB0000", pch = 16, cex = 6)
      
      ggplotly(p1) 
    })
    
    # Establish the prediction Model & Plotting for O3
    
    ## Generate the prediction value based on the given input of ozone
    fit2_pred <- reactive({
      O3_input <- input$O3_input
      predict(fit2, newdata = data.frame(O3 = O3_input))
    })
    
    ## Generate the output plots based on the given information
    output$O3_Plot <- renderPlotly({
      ## Define input for ozone from existing data and limits
      O3_input <- input$O3_input
      x2min = min(TS_Clean$O3) - 0.5
      x2max = max(TS_Clean$O3) + 0.5
      y2min = min(TS_Clean$PM2.5) + 0.5
      y2max = max(TS_Clean$PM2.5) + 0.5

      ## Generate the model based on existed data points 
      p2 <- ggplot(TS_Clean, aes(x = O3, y = PM2.5, 
                                 ylab = "PM 2.5", xlab = "O3"), 
                   bty = "n", 
                   pch = 16,
                   xlim = c(x2min, y2min), 
                   ylim = c(y2min, y2max)) + 
                   geom_point()
      
      p2 <- p2 + stat_smooth(method = 'lm', color = "#50B9FF", lwd = 2)
      p2 <- p2+ ggtitle("Tamsui PM 2.5 vs Ozone Level Prediction")
      
      ## Add the prediction point in the existing model plot
      p2 <- p2 + geom_point(x = O3_input, y = fit2_pred(), col = "#A4FDE2", pch = 16, cex = 6)
      
      ggplotly(p2) 
    })

    # Establish the prediction Model & Plotting for CO
    
    ## Generate the prediction value based on the given input of carbon dioxide
    fit3_pred <- reactive({
      CO_input <- input$CO_input
      predict(fit3, newdata = data.frame(CO = CO_input))
    })
    
    ## Generate the output plots based on the given information
    output$CO_Plot <- renderPlotly({
      ## Define input for carbon dioxide from existing data and limits
      CO_input <- input$CO_input
      x3min = min(TS_Clean$CO) - 0.05
      x3max = max(TS_Clean$CO) + 0.05
      y3min = min(TS_Clean$PM2.5) + 0.5
      y3max = max(TS_Clean$PM2.5) + 0.5
      
      ## Generate the model based on existed data points
      p3 <- ggplot(TS_Clean, aes(x = CO, y = PM2.5, 
                                 ylab = "PM 2.5", xlab = "CO"), 
                   bty = "n", 
                   pch = 16,
                   xlim = c(x3min, y3min), 
                   ylim = c(y3min, y3max)) + geom_point()
      
   
      p3 <- p3 + stat_smooth(method = 'lm', color = "#F0389F", lwd = 2)
      p3 <- p3 + ggtitle("Tamsui PM 2.5 vs Carbon Monoxide Level Prediction")
      
      ## Add the prediction point in the existing model plot
      p3 <- p3 + geom_point(x = CO_input, y = fit3_pred(), col = "#64047D", pch = 16, cex = 6)
      
      ggplotly(p3) 
    })
  }
)
