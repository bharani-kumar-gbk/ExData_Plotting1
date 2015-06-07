
##Set working directory and load the data
setwd("C:/Users/bharanikumar/Documents/GitHub/Exploratory Data Science")
filedata<-read.csv("household_power_consumption.txt",sep=";",stringsAsFactors = FALSE)

##data conversion to different format

filedata$Date<-suppressWarnings(as.Date(filedata$Date,format="%d/%m/%Y"))

## conversion and subsetting of data
filedata$Global_active_power<-suppressWarnings(as.numeric(as.character(filedata$Global_active_power)))
subsetdata<-data.frame()
subsetdata<-filedata[filedata$Date=="2007-02-01" | filedata$Date=="2007-02-02",]

##plotting of data

png(file="plot1.png",width=480,height=480)
hist(subsetdata$Global_active_power, col="red", main="Global Active Power",xlab="Global Active Power(kilowatts)",ylab="Frequency")
dev.off()