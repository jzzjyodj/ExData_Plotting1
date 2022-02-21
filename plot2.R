library(data.table)

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data

#subset data
dateData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#plot graph

dateTime <- strptime(paste(dateData$Date, dateData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalAP <- as.numeric(dateData$Global_active_power)

png("plot2.png", width=480, height=480)
plot(dateTime, globalAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")


dev.off()
