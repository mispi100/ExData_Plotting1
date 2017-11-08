#setwd("./exploratory")

epc <- read.csv("household_power_consumption.txt", sep=";")
epc$Date <- as.Date(epc$Date, format = "%d/%m/%Y")

# take out subset
epc_small <- epc[epc$Date == as.Date("2007-02-01") | epc$Date == as.Date("2007-02-02"),]
rm(epc)

# change factor to numeric
epc_small$Global_active_power <- as.numeric(epc_small$Global_active_power)

# save complete date and time together
library(lubridate)
epc_small$Date_Time <- ymd_hms(paste(epc_small$Date, epc_small$Time))

epc_small$Sub_metering_1 <- as.numeric(epc_small$Sub_metering_1)
epc_small$Sub_metering_2 <- as.numeric(epc_small$Sub_metering_2)
epc_small$Sub_metering_3 <- as.numeric(epc_small$Sub_metering_3)


# make plot
png("plot3.png", width=480, height=480)
with(epc_small, (plot(Date_Time, Sub_metering_1, ylab="Energy sub metering", xlab = "", type = "l")))
with(epc_small, lines(Date_Time, Sub_metering_2, type = "l", col =2))
with(epc_small, lines(Date_Time, Sub_metering_3, type = "l", col =4))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c(1,2,4))
dev.off()