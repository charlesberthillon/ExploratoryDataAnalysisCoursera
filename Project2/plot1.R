##Question 1
#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
#Using the base plotting system, make a plot showing the total PM2.5 emission from 
#all sources for each of the years 1999, 2002, 2005, and 2008.


getwd()
setwd("C:/Users/cberthillon/018.Coursera/004.Exploratory Data Analysis/040.CourseProject2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
View(SCC)
View(NEI)
#Sum of all emissions group by individual years
df0<-with (NEI,aggregate(NEI[,'Emissions'],by=list(year), sum, na.rm=TRUE))
df1 <- data.frame(
        year = df0[,1],
        total.emission = df0[,2],
        stringsAsFactors=FALSE
)
View(df1)

#Open the graphic device to plot the data
png(filename='plot1.png', width=480, height=480, units='px')
plot(df1)
dev.off()
