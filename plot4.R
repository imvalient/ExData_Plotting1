# Loaded csv content into the data variable.
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Fetched data between "01-02-2007" and "02-02-2007"
validData <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')

# Concatenation of all data and time values per row.
dataTime <- paste(as.character(validData$Date) , as.character(validData$Time))
# Conversion of date and time strings to time values.
validData$RealDate <- strptime(dataTime, "%d/%m/%Y %H:%M:%S")


# PNG flush open.
png(file = "plot4.png", bg = "transparent")

# Prepared the window for a 2 x 2 visualization matrix.
par(mfrow = c(2, 2))

# Plotted data from "Global_active_power" related with it time.
plot(validData$RealDate, validData$Global_active_power, type = "l", ylab = "Global Active Power", xlab=" ")

# Plotted data from "Voltage" related with it time.
plot(validData$RealDate, validData$Voltage, type = "l", ylab = "Voltage", xlab = "datetime", col = "black")

# Plotted "Sub_metering_1" data in relation with it time.
plot(validData$RealDate, validData$Sub_metering_1, type = "l", col = "black", ylab = "Energy sub metering", xlab=" ")
# Added "Sub_metering_2" data in relation with it time to the plot.
lines(validData$RealDate, validData$Sub_metering_2, type = "l", col= "red")
# Added "Sub_metering_3" data in relation with it time to the plot.
lines(validData$RealDate, validData$Sub_metering_3, type = "l", col= "blue")

# Created legend for representing each of the lines in the plot.
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1), col = c("black", "red", "blue"))

# Plotted data from "Global_reactive_power" related with it time.
plot(validData$RealDate, validData$Global_reactive_power, type = "l", xlab = "datetime", col = "black")

# Closed PNG flush
dev.off()