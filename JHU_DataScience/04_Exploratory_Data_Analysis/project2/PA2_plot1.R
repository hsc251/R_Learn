# Plot 1 Setup

# Load the data.table package for the function execution
library(data.table)

# Define URL to download and unzip the text file.
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(url,"PA02.zip")
unzip('PA02.zip')

# Export data table both the emission classification and PM2.5 summary
SCC <- data.table::as.data.table(x = readRDS(file = "Source_Classification_Code.rds"))
NEI <- data.table::as.data.table(x = readRDS(file = "summarySCC_PM25.rds"))

# Check the current structure of the exported data table to identify the variable characteristics
str(SCC)
str(NEI)

# Convert the emission index as a numeric value to prevent scientific notation.
NEI[, Emissions := lapply(.SD, as.numeric), .SDcols = c("Emissions")]

# Use Lapply to summarize the Y-values of emission by years
totalNEI <- NEI[, lapply(.SD, sum, na.rm = TRUE)
                , .SDcols = c("Emissions")
                , by = year]

# Setup plot dimension format
png("PA2_plot1.png", width=960, height=960)

# Setup Plot 1
barplot(totalNEI$Emissions
        , names = totalNEI$year
        , xlab = "years", ylab = "Emissions"
        , main = "Emissions over the Years"
        , col = "Green")

dev.off()
