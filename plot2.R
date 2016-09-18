# Loaded csv content into the data variable.
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Fetched data between "01-02-2007" and "02-02-2007"
validData <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')

# Concatenation of all data and time values per row.
dataTime <- paste(as.character(validData$Date) , as.character(validData$Time))
# Conversion of date and time strings to time values.
validData$RealDate <- strptime(dataTime, "%d/%m/%Y %H:%M:%S")

# PNG flush open.
png(file = "plot2.png", bg = "transparent")

# Plotted "Global active power" data in  relation with it date.
plot(validData$RealDate, validData$Global_active_power, type = "l", ylab = "Global Active Power (Kilowatts)", xlab=" ")

# Closed PNG flush.
dev.off()
