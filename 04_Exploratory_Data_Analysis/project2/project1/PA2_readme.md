# Exploratory Data Analysis 2nd Project

Author: Hsin Chih (Colin) Chen </br>

The purpose of to analyze the EPI National Emissions Invetory's historical data for tracking the emissions of this pollutant into the atmosphere. 

For each year and for each type of PM source, the NEI records how many tons of PM2.5 were emitted from that source over the course of the entire year. The data that you will use for this assignment are for 1999, 2002, 2005, and 2008. Please refer to the reference datalink [from here](https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip) </br>

## Step Wise Implementation

This section will summarize how each plots have been setup accordingly with generic anaology, detailed R code will be placed below to demonstrate shown plot accordingly </br>

- 1. Load the `data.table` and `ggplot` packages to execute while download & unzip the dataset from source by using `download.file` and `unzip` command for exporting the data file into the working directory. </br>
- 2. Use `data.table`'s `as.data.table` function to read the datafile  as a data table while using `readRDS` to extract the downloaded rds file format. </br>
- 3. Use `str` to examine the current variable's characteristics, and notice the emissions are labeled as `char` instead of `num`. </br>
- 4. Use `as.numeric` to prevent scientific notation when plotting required value </br>
- 5. Add up the data by using `lapply` for the 1st 2 plots for the desired emission summary, while the other plots use required function such as filtering (via `which` to filter the fips address or `grepl` to find the designated strings which matches the column. </br>
- 6. Once data are summarized, set up the plot dimension with respect to the file name. </br>
- 7. Plot either via `barplot` or `ggplot` while labelling the axis correctly and classify individual category. </br>
</br>

## Plot 1 Setup
```R
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
```
</br>

![](https://github.com/hsc251/RLearn/blob/master/04_Exploratory_Data_Analysis/project1/plot1.png)

## Plot 2 Setup
```R
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

# Use Lapply to summarize the Y-values of emission by years while filter the place in fips as Baltimore City, MD
totalNEI <- NEI[fips == "24510", lapply(.SD, sum, na.rm = TRUE), 
                .SDcols = c("Emissions")
                , by = year]

# Setup plot dimension format
png("PA2_plot2.png", width=960, height=960)

# Setup Plot 2
barplot(totalNEI$Emissions
        , names = totalNEI$year
        , xlab = "years", ylab = "Emissions"
        , main = "Emissions over the Years"
        , col = "Green")

dev.off()
```
</br>

![](https://github.com/hsc251/RLearn/blob/master/04_Exploratory_Data_Analysis/project1/plot2.png)


## Plot 3 Setup
```R
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
```
</br>

![](https://github.com/hsc251/RLearn/blob/master/04_Exploratory_Data_Analysis/project1/plot3.png)

## Plot 4 Setup
```R
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
```
</br>

![](https://github.com/hsc251/RLearn/blob/master/04_Exploratory_Data_Analysis/project1/plot4.png)

## Plot 5 Setup
```R
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
```
</br>

![](https://github.com/hsc251/RLearn/blob/master/04_Exploratory_Data_Analysis/project1/plot4.png)

## Plot 6 Setup
```R
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

# Filter with fips as both Baltimore & Los Angeles in Cities and add city names respectively.
BALvehNEI <- vehNEI[fips == "24510", ]
BALvehNEI[, city := c("Baltimore City")]
LAvehNEI <- vehNEI[fips == "06037", ]
LAvehNEI[, city := c("Los Angeles")]

# Bundle both data sets together
togNEI <- rbind(BALvehNEI, LAvehNEI)

# Setup plot dimension format
png("PA2_plot6.png", width=960, height=960)

# Setup Plot 6
ggplot(togNEI, aes(x = factor(year),y = Emissions, fill=city)) +
  geom_bar (aes(fill = year), stat = "identity") +
  facet_grid(scales="free", space="free", .~city) +
  labs(x = "year", y = expression("Total PM "[2.5]*" Emission (Kilo-Tons)")) + 
  labs(title=expression("PM "[2.5]*" Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008"))

dev.off()
```
</br>

![](https://github.com/hsc251/RLearn/blob/master/04_Exploratory_Data_Analysis/project1/plot4.png)
