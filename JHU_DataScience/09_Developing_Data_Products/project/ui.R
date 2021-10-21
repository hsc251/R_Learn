library(shiny)

# Use a fluid Bootstrap layout
shinyUI(fluidPage(    

  # Give the page a title
  titlePanel("Tamsui Air Quality Prediction"),
                    
  # Generate a row with a sidebar
  sidebarLayout(      
    # Define the sidebar with one input
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
                  value = 0.21)),
    
    # Create a spot for prediction plots
    mainPanel(
      tabsetPanel(type = "tabs", 
                  tabPanel("SO2", 
                  h3("Predicted PM2.5 with predictor SO2:"),
                  plotlyOutput("SO2",height = "300px", width = "100%")),
                  tabPanel("OZone", 
                  h3("Predicted PM2.5 with predictor O3:"),
                  plotlyOutput("O3",height = "300px", width = "100%")),
                  tabPanel("CO", 
                  h3("Predicted PM2.5 with predictor CO:"),
                  plotlyOutput("CO",height = "300px", width = "100%"))
        )
      )
    )
  )
)
