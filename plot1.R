data <- read.csv2("household_power_consumption.txt")

data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

data2 <- data[which(data$DateTime>='2007-02-01' & data$DateTime<'2007-02-03'),]
#data2 <- data2$Global_active_power[which(data2$Global_active_power=='?')]
#class(data2$Global_active_power)
data2$Global_active_power <- as.numeric(data2$Global_active_power)
png("plot1.png", width=480, height=480)
hist(data2$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", col = "red")
dev.off()
