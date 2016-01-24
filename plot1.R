
library(dplyr)

data <- data <- read.table("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, header = TRUE, dec = ".")

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
sub <- filter(data, Date >= "2007-02-01" & Date <= "2007-02-02")

png(filename = "plot1.png", width = 504, height = 504)

hist(as.numeric(sub$Global_active_power), main = "Global Active Power", xlab = "Global Active Power (kilowats)", col = "red")

dev.off()