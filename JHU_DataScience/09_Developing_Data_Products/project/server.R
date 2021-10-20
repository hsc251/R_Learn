# Load respective libraries for the application
library(shiny)
library(plotly)

# Execute Data Cleaning and Transformation

## Read filtered csv file
TS_Air <- read.csv("Tamsui_2020.csv", na.strings = c("NA"), header = TRUE)
TS_Air$Time <- as.Date(TS_Air$Time)
TS_Air$PM2.5 <- as.numeric(TS_Air$PM2.5)
TS_Air$PM10 <- as.numeric(TS_Air$PM10)

## Verify the Structure of the Update Air Quality Data Frame
str(TS_Air)


