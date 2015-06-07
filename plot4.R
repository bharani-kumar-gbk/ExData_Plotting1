
##Set working directory and load the data
setwd("C:/Users/bharanikumar/Documents/GitHub/Exploratory Data Science")
filedata<-read.csv("household_power_consumption.txt",sep=";",stringsAsFactors = FALSE)
filedata$Sub_metering_1<-suppressWarnings(as.numeric(as.character(filedata$Sub_metering_1)))
##data conversion to different format
data<-filedata$Date


## conversion and subsetting of data
subsetdata<-data.frame()

#Time and date concatenation
filedata$Global_active_power<-suppressWarnings(as.numeric(as.character(filedata$Global_active_power)))
filedata$unixTime = strptime(paste(filedata$Date, filedata$Time), "%d/%m/%Y %H:%M:%S")
filedata$Date<-suppressWarnings(as.Date(filedata$Date,format="%d/%m/%Y"))
subsetdata<-filedata[filedata$Date=="2007-02-01" | filedata$Date=="2007-02-02",]

##plotting of data
png(file="plot3.png",width=480,height=480)
plot(c(subsetdata$unixTime,subsetdata$unixTime,subsetdata$unixTime),c(subsetdata$Sub_metering_1,subsetdata$Sub_metering_2,subsetdata$Sub_metering_3),type="l",ylab = "Energy sub metering", xlab="")
lines(subsetdata$unixTime, subsetdata$Sub_metering_1, col="black")
lines(subsetdata$unixTime, subsetdata$Sub_metering_2, col="red")
lines(subsetdata$unixTime, subsetdata$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col=c("black", "red", "blue"))

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

##plotting of data

plot(subsetdata$unixTime,subsetdata$Global_active_power,type="l",ylab = "Global Active Power (kilowatts)", xlab="")
plot(subsetdata$unixTime,subsetdata$Voltage,type="l",ylab = "Voltage", xlab="")
plot(c(subsetdata$unixTime,subsetdata$unixTime,subsetdata$unixTime),c(subsetdata$Sub_metering_1,subsetdata$Sub_metering_2,subsetdata$Sub_metering_3),type="l",ylab = "Energy sub metering", xlab="")
lines(subsetdata$unixTime, subsetdata$Sub_metering_1, col="black")
lines(subsetdata$unixTime, subsetdata$Sub_metering_2, col="red")
lines(subsetdata$unixTime, subsetdata$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col=c("black", "red", "blue"))

plot(subsetdata$unixTime,subsetdata$Global_reactive_power,type="l",ylab = "Global_reactive_power", xlab="")

dev.off()