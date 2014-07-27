setwd("C:/Users/cberthillon/018.Coursera/004.Exploratory Data Analysis/010.CourseProject1)


myurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
setInternet2(use = TRUE)
download.file(url=myurl, destfile="household_power_consumption.zip") #name of the file is created while downloading the link
mydata <- read.table(unz("household_power_consumption.zip", "household_power_consumption.txt"),header=T, sep=";")

mydata3 <-subset(mydata, subset=(Date=="1/2/2007" | Date=="2/2/2007"))
mydata3$DateTime = paste(mydata3$Date, mydata3$Time) # new column concatenate Date and Time columns
mydata3$DateTime <- strptime(mydata3$DateTime, "%d/%m/%Y %H:%M:%S")# foramting date and time

png("plot3.png", width=480, height=480, units="px")

#creation of the graph
plot(mydata3$DateTime, as.numeric(as.character(Sub_metering_1)), type="l", xlab="", ylab="Energy sub metering", ylim=c(0,40))
lines(mydata3$DateTime, as.numeric(as.character(Sub_metering_2)), col="red")
lines(mydata3$DateTime, as.numeric(as.character(Sub_metering_3)), col="blue")
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ))
dev.off()
