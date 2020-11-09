datapc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
Sys.setlocale("LC_TIME", "English")
datapc$DateTime <- strptime(paste(datapc$Date, datapc$Time), "%d/%m/%Y %H:%M:%S")

datapc$Date <- as.Date(datapc$Date, "%d/%m/%Y")

datapc2 <- subset(datapc, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
png(filename="plot3.png", width=480, height=480, units="px")

plot(datapc2$DateTime, datapc2$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(datapc2$DateTime, datapc2$Sub_metering_2, col="red")
lines(datapc2$DateTime, datapc2$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()