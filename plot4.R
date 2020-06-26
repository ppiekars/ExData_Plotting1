data <- read.csv2("household_power_consumption.txt")

data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

data2 <- data[which(data$DateTime>='2007-02-01' & data$DateTime<'2007-02-03'),]
#data2$Voltage[which(data2$Voltage=='?')]
#class(data2$Voltage)
data2$Voltage <- as.numeric(data2$Voltage)
data2$Global_active_power <- as.numeric(data2$Global_active_power)
data2$Global_reactive_power <- as.numeric(data2$Global_reactive_power)
png("plot4.png", width=480, height=480)

par(mfrow= c(2,2))
with(data2, {
  plot(DateTime, Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")
  plot(DateTime, Voltage, type = "l")
  plot(data2$DateTime, data2$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l")
  lines(data2$DateTime, data2$Sub_metering_2, col = "red")
  lines(data2$DateTime, data2$Sub_metering_3, col = "blue")
  legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
  plot(DateTime, Global_reactive_power, type = "l")
})

dev.off()
