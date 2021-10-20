# This is the UI definition for the displacement calculation
# Shiny web app.

library(shiny)

shinyUI(fluidPage(
  headerPanel("Calculate Motion Displacement with Setup"),
  sidebarPanel(
    h5("Displacement is calculated via acceleration, velocity and given time travelled"),
    numericInput("i_velocity", "Enter your initial velocity (m/s)", value = 6.9),
    numericInput("acceleration", "Enter your acceleration (m/s2)", value = 9.8),
    numericInput("t_time", "Enter your time (s)", value = 120),
    submitButton("Calculate"),
  ),
  mainPanel(
    h3("Results:"),
    p("Calculated Displacement in meters are:"),
    verbatimTextOutput("dist_travel"),
    p("This is considered:"),
    verbatimTextOutput("disp_length")
  )
))
