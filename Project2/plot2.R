##Question 2
#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
#Use the base plotting system to make a plot answering this question

getwd()
setwd("C:/Users/cberthillon/018.Coursera/004.Exploratory Data Analysis/040.CourseProject2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
View(SCC)
View(NEI)
#Sum of all emissions group by individual years for Baltimore City
df2<-subset(NEI, subset=(fips=="24510"))
View(df2)
df3<-with (df2,aggregate(df2[,'Emissions'],by=list(year), sum, na.rm=TRUE))
df4 <- data.frame(
        year = df3[,1],
        total.emission = df3[,2],
        stringsAsFactors=FALSE
)
View(df4)

#Create the graph
png(filename='plot2.png', width=480, height=480, units='px')
plot(df4)+lines(df4, col = "green")
dev.off()
