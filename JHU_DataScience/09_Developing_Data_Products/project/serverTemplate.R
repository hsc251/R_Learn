# Load respective libraries for the application
library(shiny)
library(plotly)

# Define the calculation for displacement
disp_quant <- function(i_velocity, acceleration, t_time){
  dist_travel <- (i_velocity*t_time) + (0.5*acceleration*t_time^2)
}

# Evaluate the travelled displacement level
disp_level <- function(i_velocity, acceleration, t_time){
  disp_quant <- (i_velocity*t_time) + (0.5*acceleration*t_time^2)
  if(disp_quant < 500) "Short Distance"
  else if(disp_quant >= 500 & disp_quant < 3000) "Medium Distance"
  else if(disp_quant >= 3000 & disp_quant < 5000) "Long Distance"
  else "Extreme Distance"
}

# Setup Shiny Server for the setup 
shinyServer(
  function(input, output){
    output$dist_travel <- renderText({disp_quant(input$i_velocity, input$acceleration, input$t_time)})
    output$disp_length <- renderText({disp_level(input$i_velocity, input$acceleration, input$t_time)})
  }
)
