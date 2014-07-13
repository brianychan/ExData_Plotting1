## This function creates a line plot of Global Active Power over time

##Import data
data <- read.table("~/Documents/Learning/R/edaproj1/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

##Correct date and time
data$Date <- paste(data$Date,data$Time)
data$Date <- strptime(data$Date,"%d/%m/%Y %H:%M:%S")

##Subset based on dates 
data <- subset(data, as.Date(Date)>="2007-02-01" & as.Date(Date)<="2007-02-02")

##Plot line graph
plot(data$Date,data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

##Save plot
dev.copy(png,"plot2.png",width=480,height=480)
dev.off()