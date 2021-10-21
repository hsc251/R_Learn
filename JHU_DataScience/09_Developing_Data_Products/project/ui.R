library(shiny)

## Filter Data for complete cases and verify structure agian
TS_Clean <- TS_Raw[complete.cases(TS_Raw),]
str(TS_Clean)

# Use a fluid Bootstrap layout
shinyUI(fluidPage(    

  # Give the page a title
  titlePanel("Tamsui Air Quality Prediction"),
                    
  # Generate a row with a sidebar
  sidebarLayout(      
    # Define the sidebar with one input
    sidebarPanel(
      sliderInput("SO2_input",
                  "Drag the Sulfur Dioxide Value:",
                  min = 0.00,
                  max = 10.00,
                  value = 1.70),
      sliderInput("O3_input",
                  "Drag the Ozone Value:",
                  min = 5.00,
                  max = 150.00,
                  value = 42.20),
      sliderInput("CO_input",
                  "Drag the Carbon Monoxide Value:",
                  min = 0.00,
                  max = 2.00,
                  value = 0.21)),
    
    # Create a spot for prediction plots
    mainPanel(
      tabsetPanel(type = "tabs", 
                  tabPanel("Sulfur Dioxide", plotlyOutput("SO2_Plot")),
                  tabPanel("Ozone", plotOutput("O3_Plot")),
                  tabPanel("Carbon Monoxide", plotOutput("CO_Plot")))
      )
    )
  )
)
