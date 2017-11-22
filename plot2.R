library(readr)
library(dplyr)
library(lubridate)

consum <- read_delim("household_power_consumption.txt", 
                     ";", escape_double = FALSE, trim_ws = TRUE)
consum2 <- consum %>% filter(Date == "1/2/2007" | Date == "2/2/2007")

consum2$DateTime <- as.POSIXct(paste(consum2$Date, consum2$Time), format = "%d/%m/%Y %H:%M:%S")

plot(consum2$DateTime, consum2$Global_active_power, type = "l", lty = 1, xlab = "", ylab = "Gloabl Active Power (kilowatts)")

dev.copy(png, file = "plot2.png")
dev.off()
