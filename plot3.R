table <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings = "?", stringsAsFactors=FALSE)
dataset <- table [table$Date %in% c("1/2/2007","2/2/2007"),]
png("plot3.png", width=480, height=480)
datetime <- as.POSIXct(paste(dataset$Date, dataset$Time), format="%d/%m/%Y %H:%M:%S")
plot(datetime, as.numeric(dataset$Sub_metering_1), type="l", ylab="Energy sub metering", xlab="")
lines(datetime, as.numeric(dataset$Sub_metering_2), type="l", col="red")
lines(datetime, as.numeric(dataset$Sub_metering_3), type="l", col="blue")
legend ('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=c(1,1,1),lwd=c(2.5,2.5,2.5))
dev.off()