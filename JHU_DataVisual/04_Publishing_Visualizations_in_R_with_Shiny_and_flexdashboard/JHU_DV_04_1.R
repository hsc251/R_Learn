library(shiny)
library(tidyverse)

# Read required Data
URL <- "https://www.dropbox.com/s/uhfstf6g36ghxwp/cces_sample_coursera.csv?raw=1"
download.file(URL, destfile = "cces_sample.csv")
dat <- read.csv("cces_sample.csv",header = TRUE, sep = ",")
dat <- dat %>% select(c("pid7","ideo5"))
dat<-drop_na(dat)


# Define UI for application 
ui <- fluidPage(
  # Place all the words, slider and plot into main panel
  mainPanel(
    # Establish text with bold and paragraph characters
    strong(p("Select Five Point Ideology (1 = Very Liberal,")),
    strong(p("5 = Very Conservative)")),
    
    # generate slider input section
    sliderInput(inputId = "ideo",
                label = NULL,
                min = 1,
                max = 5,
                value = 3)),
  
  # Plot the actual graph
  plotOutput("pidplot")
)

# Define server logic to draw the distribution
server <- function(input, output) {
  
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
}

# Run the application 
shinyApp(ui = ui, server = server)
