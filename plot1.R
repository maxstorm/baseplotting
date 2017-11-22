library(readr)
library(dplyr)
library(lubridate)

consum <- read_delim("household_power_consumption.txt", 
                                          ";", escape_double = FALSE, trim_ws = TRUE)
consum2 <- consum %>% filter(Date == "1/2/2007" | Date == "2/2/2007")
  
consum2$Date <- as.Date(consum2$Date, format="%m/%d/%Y")

consum2$Time <- hms(consum2$Time)

hist(consum2$Global_active_power, xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", col = "red", main = "Global Active Power" )

dev.copy(png, file = "plot1.png")
dev.off()
