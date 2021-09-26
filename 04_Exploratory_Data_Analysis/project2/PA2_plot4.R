# Plot 4 Setup

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

# Subsetting coal combustion related NEI data on each level columns in SCC
combRel <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coalRel <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE)
combSCC <- SCC[combRel & coalRel, SCC]

# Use the filtering condition to match NEI data with the same SCC case number
combNEI <- NEI[NEI[,SCC] %in% combSCC]

# Setup plot dimension format
png("PA2_plot4.png", width=960, height=960)

# Setup Plot 4
ggplot(combNEI, aes(x = factor(year),y = Emissions/10^5)) +
  geom_bar (stat = "identity", fill = "#BB0000", width = 0.69) +
  labs(x = "year", y = expression("Total PM"[2.5]*" Emission (10^5 Tons)")) +
  labs(title = expression("PM "[2.5]*" Coal Combustion Source Emissions Across US from 1999-2008"))

dev.off()
