#Plot2
setwd("C:/Users/cberthillon/018.Coursera/004.Exploratory Data Analysis/010.CourseProject1/exdata-data-household_power_consumption")
dataset<-"C:/Users/cberthillon/018.Coursera/004.Exploratory Data Analysis/010.CourseProject1/exdata-data-household_power_consumption/household_power_consumption.txt"
mydata <- read.csv(dataset, ,header=T,sep=";")

#data filtering
mydata <- read.csv(dataset, ,header=T,sep=";",stringsAsFactors=FALSE, na.strings="?")
mydata2 <-subset(mydata, subset=(Date=="1/2/2007" | Date=="2/2/2007"))

png("plot2.png", width=480, height=480)

plot(mydata2$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l",xaxt='n')
axis(1, at=c(1,nrow(mydata2)/2,nrow(mydata2)),labels=c("Thu","Fri","Sat"))
dev.off()