## This function creates a line plot of Global Active Power over time

##Import data
data <- read.table("~/Documents/Learning/R/edaproj1/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

##Correct date and time
data$Date <- paste(data$Date,data$Time)
data$Date <- strptime(data$Date,"%d/%m/%Y %H:%M:%S")

##Subset based on dates 
data <- subset(data, as.Date(Date)>="2007-02-01" & as.Date(Date)<="2007-02-02")

##Open plot file
png("plot3.png",width=480,height=480)

##Plot line graph
with(data, plot(data$Date,data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
lines(data$Date,data$Sub_metering_2, type="l", col="red")
lines(data$Date,data$Sub_metering_3, type="l", col="blue")
legend("topright",col=c("black","blue","red"),lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

##Close plot file
dev.off()