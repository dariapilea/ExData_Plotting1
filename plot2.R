table <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings = "?", stringsAsFactors=FALSE)
dataset <- table [table$Date %in% c("1/2/2007","2/2/2007") ,]
png("plot2.png", width=480, height=480)
#d <- as.Date(dataset$Date, format="%d/%m/%Y")
datetime <- as.POSIXct(paste(dataset$Date, dataset$Time), format="%d/%m/%Y %H:%M:%S")
plot(datetime,as.numeric(dataset$Global_active_power),xlab="",ylab="Global Active Power(kilowatts)", type="l")
dev.off()