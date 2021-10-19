# Plot 3 Setup

# Load the data.table and ggplot2 package for the function execution
library(data.table)
library(ggplot2)

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

# Subsetting the Baltimore NEI data according
BALNEI <- NEI[which(NEI$fips =="24510"), ]


# Setup plot dimension format
png("PA2_plot3.png", width=960, height=960)

# Setup Plot 3
ggplot(BALNEI, aes(factor(year), Emissions, fill = type)) +
        geom_bar (stat = "identity") +
        theme_bw() + guides(fill = "none") +
        facet_grid(.~type, scales = "free", space = "free") +
        labs(x = "year", y = expression("Total PM"[2.5]*" Emission (Tons)")) +
        labs(title = expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))

dev.off()
