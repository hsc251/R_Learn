library(shiny)
library(tidyverse)
library(plotly)
library(DT)
library(shinythemes)

## Import Data

URL <- "https://www.dropbox.com/s/uhfstf6g36ghxwp/cces_sample_coursera.csv?raw=1"
download.file(URL, destfile = "cces_sample.csv")
dat <- read.csv("cces_sample.csv",header = TRUE, sep = ",")
dat<- dat %>% select(c("pid7","ideo5","newsint","gender","educ","CC18_308a","region"))
dat <- drop_na(dat)

## Make your app

ui <- navbarPage(theme = shinytheme("lumen"),
        "Hsin Chih's Application",
        tabPanel("Page 1",
            sidebarLayout(
                sidebarPanel(
                    sliderInput(inputId = "ideo",
                                label = "Select Five Point Ideology (1 = Very Liberal, 5 = Very Conservative)",
                                min = 1,
                                max = 5,
                                value = 3)
                            ),
                mainPanel(
                    tabsetPanel(type = "tabs",
                                tabPanel("Tab1", plotOutput("pidplot")),
                                tabPanel("Tab2", plotOutput("trumpplot")))
                )
            )), 
        tabPanel("Page 2",
                 sidebarLayout(
                     sidebarPanel(
                         checkboxGroupInput(inputId = "sex",
                                            label = "Select Gender:",
                                            choices = c(1,2),
                                            selected = "sex")
                     ),
                 mainPanel(
                     plotlyOutput("eduplot")
                 )
            )),
        tabPanel("Page 3",
                 sidebarLayout(
                     sidebarPanel(
                         varSelectInput(inputId = "region",
                                        label = "Select Region",
                                        data = "dat",
                                        selected = "region",
                                        multiple = TRUE,
                                        selectize = TRUE)
                    ),
                 mainPanel(
                     dataTableOutput(outputId = "dat_table", height = 500)
                    )
                 ))
)

    
server<-function(input,output){
    
    output$pidplot <- renderPlot({
        ggplot(
            filter(dat, ideo5 == input$ideo), 
            aes(x = pid7)) +
            geom_bar(stat = 'count') +
            xlab("7 Point Party ID, 1 = Very D, 7 = Very R") +
            ylab("Count") +
            xlim(0,8) +
            scale_y_continuous(name = "Count", limits = c(0,125), n.breaks = 5)
    })
    
    output$trumpplot <- renderPlot({
        ggplot(
            filter(dat, ideo5 == input$ideo), 
            aes(x = CC18_308a)) +
            geom_bar(stat = 'count') +
            xlab("Trump Support") +
            ylab("Count") +
            xlim(0,5) +
            scale_y_continuous(name = "Count", limits = c(0,170), n.breaks = 10)
    })
        
    output$eduplot <- renderPlotly({
    
        dat2 <- dat %>% 
            filter(gender %in% input$sex)
        
        p2 <- ggplot(dat2, aes(x = educ, y = pid7)) + geom_jitter()
        p2 <- p2 + geom_smooth(method = "lm")
        p2 <- p2 + labs(x = "educ", y = "pid7")
        
        ggplotly(p2)        
    })
    
    #####Hint: when you make the data table on page 3, you may need to adjust the height argument in the dataTableOutput function. Try a value of height=500
        
} 

shinyApp(ui,server)
