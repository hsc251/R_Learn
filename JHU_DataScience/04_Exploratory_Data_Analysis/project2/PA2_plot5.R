# Plot 5 Setup

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

# Subsetting vehicle related NEI data on each level columns in SCC
vehRel <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehSCC <- SCC[vehRel, SCC]

# Use the filtering condition to match NEI data with the same SCC case number
vehNEI <- NEI[NEI[,SCC] %in% vehSCC]

# Filter with fips as Balitmore City.
BALvehNEI <- vehNEI[which(vehNEI$fips == "24510"),]

# Setup plot dimension format
png("PA2_plot5.png", width=960, height=960)

# Setup Plot 5
ggplot(BALvehNEI, aes(x = factor(year),y = Emissions)) +
  geom_bar (stat = "identity", fill = "#BB0000", width = 0.69) +
  labs(x = "year", y = expression("Total PM"[2.5]*" Emission")) +
  labs(title = expression("PM "[2.5]*" Motor Vehicle Source Emissions in Baltimore from 1999-2008"))

dev.off()
