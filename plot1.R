#setwd("./exploratory")

epc <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors = FALSE)
epc$Date <- as.Date(epc$Date, format = "%d/%m/%Y")

# take out subset
epc_small <- epc[epc$Date == as.Date("2007-02-01") | epc$Date == as.Date("2007-02-02"),]
rm(epc)

# change factor to numeric
epc_small$Global_active_power <- as.numeric(epc_small$Global_active_power)

# make plot
png("plot1.png", width=480, height=480)
hist(epc_small$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()