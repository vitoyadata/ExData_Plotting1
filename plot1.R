datapc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

datapc$Date <- strptime(datapc$Date, "%d/%m/%Y")

datapc$Date <- as.Date(datapc$Date, "%d/%m/%Y")

datapc2 <- subset(datapc, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
png(filename="plot1.png", width=480, height=480, units="px")
hist(datapc2$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()