# Plot 4 Setup

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