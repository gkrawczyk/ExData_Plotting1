
library(dplyr)

data <- data <- read.table("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, header = TRUE, dec = ".")

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
sub <- filter(data, Date >= "2007-02-01" & Date <= "2007-02-02")

png(filename = "plot2.png", width = 504, height = 504)

date_time <- strptime(paste(sub$Date, sub$Time, sep = " "), "%Y-%m-%d %H:%M:%S")
global_active_power <- as.numeric(sub$Global_active_power)

plot(date_time, global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()