# read off the data.table library
library("data.table")

# read in the CSV data and plot histogram
outcome <- read.csv("outcome-of-care-measures.csv",colClasses = "character")
hist(as.numeric(outcome[,11]), xlab = "Deaths"
                 , main = "Hospital 30-Day Death (Mortality) Rates from Heart Attack"
                 , col = "red")
