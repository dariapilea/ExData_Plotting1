# get current working directory
# getwd() 
# set working directory (in my case it is "data")
# setwd("../data")
# library(data.table)
table <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings = "?", stringsAsFactors=FALSE)
dataset <- table [table$Date %in% c("1/2/2007","2/2/2007") ,]
png("plot1.png", width=480, height=480)
hist(as.numeric(dataset$Global_active_power), main="Global Active Power", xlab="Global Active Power(kilowatts)", col = "red")
dev.off()


