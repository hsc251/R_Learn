# Plot 3 Setup

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