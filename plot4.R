library(dplyr)

data <- data <- read.table("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, header = TRUE, dec = ".")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
sub <- filter(data, Date >= "2007-02-01" & Date <= "2007-02-02")
png(filename = "plot4.png", width = 504, height = 504)

date_time <- strptime(paste(sub$Date, sub$Time, sep = " "), "%Y-%m-%d %H:%M:%S")
global_active_power <- as.numeric(sub$Global_active_power)
voltage <- as.numeric(sub$Voltage)
sub_metering_1 <- as.numeric(sub$Sub_metering_1)
sub_metering_2 <- as.numeric(sub$Sub_metering_2)
sub_metering_3 <- as.numeric(sub$Sub_metering_3)
global_reactive_power <- as.numeric(sub$Global_reactive_power)

par(mfrow = c(2,2))

plot(date_time, global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

plot(date_time, voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(date_time, sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(date_time, sub_metering_2, col = "red")
lines(date_time, sub_metering_3, col = "blue")
legend("topright", names(sub)[7:9], col = c("black", "red", "blue"), lwd = 2, bty = "n", cex = 0.75)

plot(date_time, global_reactive_power, xlab = "datetime", ylab = "Global reactive power", type = "l")

dev.off()

