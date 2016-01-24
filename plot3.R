
library(dplyr)

data <- data <- read.table("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, header = TRUE, dec = ".")

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
sub <- filter(data, Date >= "2007-02-01" & Date <= "2007-02-02")

png(filename = "plot3.png", width = 504, height = 504)

date_time <- strptime(paste(sub$Date, sub$Time, sep = " "), "%Y-%m-%d %H:%M:%S")
sub_metering_1 <- as.numeric(sub$Sub_metering_1)
sub_metering_2 <- as.numeric(sub$Sub_metering_2)
sub_metering_3 <- as.numeric(sub$Sub_metering_3)

plot(date_time, sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(date_time, sub_metering_2, col = "red")
lines(date_time, sub_metering_3, col = "blue")
legend("topright", names(sub)[7:9], col = c("black", "red", "blue"), lwd = 2)

dev.off()