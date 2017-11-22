library(readr)
library(dplyr)
library(lubridate)

consum <- read_delim("household_power_consumption.txt", 
                     ";", escape_double = FALSE, trim_ws = TRUE)
consum2 <- consum %>% filter(Date == "1/2/2007" | Date == "2/2/2007")

consum2$DateTime <- as.POSIXct(paste(consum2$Date, consum2$Time), format = "%d/%m/%Y %H:%M:%S")

plot(consum2$DateTime, consum2$Sub_metering_1, type = "l", lty = 1, xlab = "", ylab = "Energy sub metering")

lines(consum2$DateTime, consum2$Sub_metering_2, type = "l", lty = 1, col = "red")
lines(consum2$DateTime, consum2$Sub_metering_3, type = "l", lty = 1, col = "blue")
legend("topright", lty = 1, col = c("black", "blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.75, y.intersp = 0.5)

dev.copy(png, file = "plot2.png")
dev.off()
