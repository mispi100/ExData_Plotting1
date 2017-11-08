#setwd("./exploratory")

epc <- read.csv("household_power_consumption.txt", sep=";")
epc$Date <- as.Date(epc$Date, format = "%d/%m/%Y")

# take out subset
epc_small <- epc[epc$Date == as.Date("2007-02-01") | epc$Date == as.Date("2007-02-02"),]
rm(epc)

## change factor to numeric
epc_small$Global_active_power <- as.numeric(epc_small$Global_active_power)

# save complete date and time together
library(lubridate)
epc_small$Date_Time <- ymd_hms(paste(epc_small$Date, epc_small$Time))

# make plot
png("plot2.png", width=480, height=480)
with(epc_small, plot(Date_Time, Global_active_power,  type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()