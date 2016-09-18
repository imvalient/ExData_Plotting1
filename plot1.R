# Loaded csv content into the data variable.
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Fetched data between "01-02-2007" and "02-02-2007"
validData <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')

# PNG flush open.
png(file = "plot1.png", bg = "transparent")

# Histogram representing "Global active power" data frequency. 
hist(validData$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# Closed PNG flush
dev.off()
