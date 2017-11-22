library(readr)
library(dplyr)
library(lubridate)

consum <- read_delim("household_power_consumption.txt", 
                     ";", escape_double = FALSE, trim_ws = TRUE)
consum2 <- consum %>% filter(Date == "1/2/2007" | Date == "2/2/2007")

consum2$DateTime <- as.POSIXct(paste(consum2$Date, consum2$Time), format = "%d/%m/%Y %H:%M:%S")

par(mfrow = c(2, 2))
mar = c(1, 1, 1, 1)

plot(consum2$DateTime, consum2$Global_active_power, type = "l", lty = 1, xlab = "", ylab = "Gloabl Active Power (kilowatts)")

plot(consum2$DateTime, consum2$Voltage, type = "l", lty = 1, xlab = "datetime" ,ylab = "Voltage")

plot(consum2$DateTime, consum2$Sub_metering_1, type = "l", lty = 1, xlab = "", ylab = "Energy sub metering")
lines(consum2$DateTime, consum2$Sub_metering_2, type = "l", lty = 1, col = "red")
lines(consum2$DateTime, consum2$Sub_metering_3, type = "l", lty = 1, col = "blue")
legend("topright", lty = 1, col = c("black", "blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.75, y.intersp = 0.5)

plot(consum2$DateTime, consum2$Global_reactive_power, type = "l", lty = 1, xlab = "datetime" ,ylab = "Global_reactive_power")

dev.copy(png, file = "plot4.png")
dev.off()
