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

# Use a fluid Bootstrap layout
shinyUI(fluidPage(    

  # Give the page a title
  titlePanel("Tamsui's PM 2.5 Level Prediction at 1PM"),
                    
  # Generate a row with a sidebar
  sidebarLayout(      
    # Define the sidebar with required inputs
    sidebarPanel(
      numericInput("SO2_input",
                  "Enter Sulfur Dioxide for Prediction:",
                  min = 0.00,
                  max = 10.00,
                  value = 1.70),
      numericInput("O3_input",
                  "Enter Ozone for Prediction:",
                  min = 5.00,
                  max = 150.00,
                  value = 42.20),
      numericInput("CO_input",
                  "Enter Carbon Monoxide for Prediction:",
                  min = 0.00,
                  max = 2.00,
                  value = 0.21),
    helpText("Data were obtained from EPA in Taiwan's Executive Yuan."),
    helpText(" "),
    helpText("All data were collected exactly at 1PM on each day of 2020")),
    
    # Create a spot for prediction plots
    mainPanel(
      tabsetPanel(type = "tabs", 
                  tabPanel("SO2", 
                  h3("Predicted PM2.5 level with SO2 concentration:"),
                  plotlyOutput("SO2_Plot",height = "300px", width = "100%")),
                  tabPanel("OZone", 
                  h3("Predicted PM2.5 level with O3 concentration:"),
                  plotlyOutput("O3_Plot",height = "300px", width = "100%")),
                  tabPanel("CO", 
                  h3("Predicted PM2.5 level with CO concentration:"),
                  plotlyOutput("CO_Plot",height = "300px", width = "100%"))
        )
      )
    )
  )
)
