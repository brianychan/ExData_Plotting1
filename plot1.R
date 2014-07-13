## This function creates a histogram of Global Active Power

##Import data
data <- read.table("~/Documents/Learning/R/edaproj1/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

##Correct date and time
data$Date <- as.Date(strptime(data$Date,"%d/%m/%Y"))
data$Time <- strptime(data$Time,"%H:%M:%S")

##Subset based on dates 
data <- subset(data, Date>="2007-02-01" & Date<="2007-02-02")

##Plot histogram
hist(data$Global_active_power,col="red",xlab="Global Active Power (kilowatts)", main="Global Active Power")

##Save plot
dev.copy(png,"plot1.png",width=480,height=480)
dev.off()