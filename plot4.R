#dataframe
table <- read.table("./household_power_consumption.txt", header=T, sep=";", na.strings = "?", stringsAsFactors=FALSE)
dataset <- table [table$Date %in% c("1/2/2007","2/2/2007"),]

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
datetime <- as.POSIXct(paste(dataset$Date, dataset$Time), format="%d/%m/%Y %H:%M:%S")

# Global Active Power plot
plot(datetime,as.numeric(dataset$Global_active_power),xlab="",ylab="Global Active Power", type="l")

# Voltage
plot(datetime, as.numeric(dataset$Voltage), type="l", xlab="datetime", ylab="Voltage")

# Energy sub metering plot
plot(datetime, as.numeric(dataset$Sub_metering_1), type="l", ylab="Energy sub metering", xlab="")
lines(datetime, as.numeric(dataset$Sub_metering_2), type="l", col="red")
lines(datetime, as.numeric(dataset$Sub_metering_3), type="l", col="blue")
legend ('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=c(1,1,1),lwd=c(2.5,2.5,2.5))

#Global_reactive_power
plot(datetime, as.numeric(dataset$Global_reactive_power), type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()