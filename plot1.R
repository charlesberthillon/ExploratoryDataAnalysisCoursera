setwd("C:/Users/cberthillon/018.Coursera/004.Exploratory Data Analysis/010.CourseProject1)


myurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
setInternet2(use = TRUE)
download.file(url=myurl, destfile="household_power_consumption.zip") #name of the file is created while downloading the link
mydata <- read.table(unz("household_power_consumption.zip", "household_power_consumption.txt"),header=T, sep=";")

mydata1 <-subset(mydata, subset=(Date=="1/2/2007" | Date=="2/2/2007"))
png("plot1.png", width=480, height=480, units="px")
hist(as.numeric(as.character(Global_active_power)), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
