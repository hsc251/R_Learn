# Exploratory Data Analysis 1st Project

Author: Hsin Chih (Colin) Chen </br>

The purpose of this assignment is to use UC Irvine's Machine Learning Respository's data to validate the household electric power consumptions, please refer to this particular [electrical power consumption data link](https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip) </br>

## Step Wise Implementation

- 1. Load the `data.table` package to execute while download & unzip the dataset from UCI repo by using `download.file` and `unzip` command for exporting the data file into the working directory. </br>
- 2. Use `data.table`'s `fread` function to read the datafile while identify the na.strings (in this case as ? mark for the NA values) to import into the desired data table format. </br>
- 3. Use `str` to examine the current variable's characteristics, and notice the date and time are separated as `char`. </br>
- 4. Re-arrange the data column's format to desired format by either using `as.Date` or `as.POSIXct` to transform the data to ensure the data format is within the designated part. </br>
- 5. Filter the necessary time frame so the data is with in "2007-02-01" to "2007-02-02" </br>
- 6. Setup the respective plot dimension and layout before implementing the plotting command for designated pictures. </br>
- 7. Plot respective plot by either using single command to reach required parts or use multiple lines. </br>
</br>

## Plot 1 Setup
```R
# Load the data.table package for the function execution
library(data.table)

# Define URL to download and unzip the text file.
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,"PA01.zip")
unzip('PA01.zip')

# Export data table for power consumption from extract file.
PDB <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
)

# Check the current structure of the exported data table to identify the variable characteristics
str(PDB)

# Convert the active power as a numeric value to prevent scientific notation.
PDB[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# Change Date Column from char to date data type.
PDB[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

# Filter Dates for 2007-02-01 and 2007-02-02
PDB_F1 <- PDB[(Date >= "2007-02-01") & (Date <= "2007-02-02")]


# Setup plot dimension format
png("plot1.png", width=480, height=480)

# Plot 1
hist(PDB_F1[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency",col="Red")

dev.off()
```
</br>

## Plot 2 Setup
```R
# Load the data.table package for the function execution
library(data.table)

# Define URL to download and unzip the text file.
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,"PA01.zip")
unzip('PA01.zip')

# Export data table for power consumption from extract file.
PDB <- data.table::fread(input = "household_power_consumption.txt"
                         , na.strings="?"
)

# Check the current structure of the exported data table to identify the variable characteristics
str(PDB)

# Convert the active power as a numeric value
PDB[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# Add the time with date as a POSIXct object for timeline filtering
PDB[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Filter Dates for 2007-02-01 and 2007-02-02
PDB_F2 <- PDB[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]


# Setup plot dimension format
png("plot2.png", width=480, height=480)

# Plot 2
plot(x = PDB_F2[,dateTime], y = PDB_F2[,Global_active_power], type = "l"
        ,xlab="",ylab="Global Active Power (kilowatts)")

dev.off()
```
</br>

## Plot 3 Setup
```R
# Load the data.table package for the function execution
library(data.table)

# Define URL to download and unzip the text file.
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,"PA01.zip")
unzip('PA01.zip')

# Export data table for power consumption from extract file.
PDB <- data.table::fread(input = "household_power_consumption.txt"
                         , na.strings="?"
)

# Check the current structure of the exported data table to identify the variable characteristics
str(PDB)

# Convert the active power as a numeric value
PDB[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# Add the time with date as a POSIXct object for timeline filtering
PDB[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Filter Dates for 2007-02-01 and 2007-02-02
PDB_F3 <- PDB[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]


# Setup plot dimension format
png("plot3.png", width=480, height=480)

# Plot 3's core structure of 1st sub metering
plot(x = PDB_F3[,dateTime], y = PDB_F3[,Sub_metering_1], type = "l"
     ,xlab="",ylab="Energy sub metering")

# Use Lines command to add the remaining sub meters
lines(x = PDB_F3[,dateTime], y = PDB_F3[,Sub_metering_2],col="red")
lines(x = PDB_F3[,dateTime], y = PDB_F3[,Sub_metering_3],col="blue")
legend("topright", col = c("black","red","blue")
       ,c("Sub_metering_1 ","Sub_metering_2 ","Sub_metering_3 ")
       , lty = c(1,1), lwd=c(1,1))

dev.off()
```
</br>

## Plot 4 Setup
```R
# Load the data.table package for the function execution
library(data.table)

# Define URL to download and unzip the text file.
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,"PA01.zip")
unzip('PA01.zip')

# Export data table for power consumption from extract file.
PDB <- data.table::fread(input = "household_power_consumption.txt"
                         , na.strings="?"
)

# Check the current structure of the exported data table to identify the variable characteristics
str(PDB)

# Convert the active power as a numeric value
PDB[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# Add the time with date as a POSIXct object for timeline filtering
PDB[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Filter Dates for 2007-02-01 and 2007-02-02
PDB_F4 <- PDB[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]


# Setup plot dimension format
png("plot4.png", width=480, height=480)

# Setup the 2x2 matrix form for the plog grid
par(mfrow = c(2,2))

# 1st plot (coming from plot 2)
plot(x = PDB_F4[,dateTime], y = PDB_F4[,Global_active_power], type = "l"
     ,xlab="",ylab="Global Active Power (kilowatts)")

# 2nd plot 
plot(x = PDB_F4[,dateTime], y = PDB_F4[,Voltage], type = "l"
     ,xlab="datetime",ylab="Voltage")

# 3rd plot (coming from plot 3)
plot(x = PDB_F4[,dateTime], y = PDB_F4[,Sub_metering_1], type = "l"
     ,xlab="",ylab="Energy sub metering")
lines(x = PDB_F4[,dateTime], y = PDB_F4[,Sub_metering_2],col="red")
lines(x = PDB_F4[,dateTime], y = PDB_F4[,Sub_metering_3],col="blue")
legend("topright", col = c("black","red","blue")
       ,c("Sub_metering_1 ","Sub_metering_2 ","Sub_metering_3 ")
       , lty = c(1,1), bty="n", cex = .5)

# 4th plot
plot(x = PDB_F4[,dateTime], y = PDB_F4[,Global_reactive_power], type = "l"
     ,xlab="datetime",ylab="Global_reactive_power")

dev.off()
```
