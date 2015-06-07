
##Set working directory and load the data
setwd("C:/Users/bharanikumar/Documents/GitHub/Exploratory Data Science")
filedata<-read.csv("household_power_consumption.txt",sep=";",stringsAsFactors = FALSE)

##data conversion to different format
data<-filedata$Date

## conversion and subsetting of data
filedata$Global_active_power<-suppressWarnings(as.numeric(as.character(filedata$Global_active_power)))
subsetdata<-data.frame()

#Time and date concatenation
filedata$unixTime = strptime(paste(filedata$Date, filedata$Time), "%d/%m/%Y %H:%M:%S")

subsetdata<-filedata[filedata$Date=="1/2/2007" | filedata$Date=="2/2/2007",]
##plotting of data
png(file="plot2.png",width=480,height=480)
plot(subsetdata$unixTime,subsetdata$Global_active_power,type="l",ylab = "Global Active Power (kilowatts)", xlab="")
dev.off()