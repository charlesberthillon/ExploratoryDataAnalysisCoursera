##Question 3
#Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
#which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City?
#Which have seen increases in emissions from 1999-2008? 
#Use the ggplot2 plotting system to make a plot answer this question.

getwd()
setwd("C:/Users/cberthillon/018.Coursera/004.Exploratory Data Analysis/040.CourseProject2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
View(SCC)
View(NEI)
#Sum of all emissions group by individual years for Baltimore City, for each type (point, nonpoint, onroad, nonroad) variable
df5<-subset(NEI, subset=(fips=="24510"))

#Specific table for type = "POINT"
df6<-subset(df5, subset=(type=="POINT"))
df7<-with (df6,aggregate(df6[,'Emissions'],by=list(year), sum, na.rm=TRUE))

df8 <- data.frame(
        year = df7[,1],
        total.emission = df7[,2],
        stringsAsFactors=FALSE
)
View(df8)


#Specific table for type = "NONPOINT"
df9<-subset(df5, subset=(type=="NONPOINT"))
df10<-with (df9,aggregate(df9[,'Emissions'],by=list(year), sum, na.rm=TRUE))

df11 <- data.frame(
        year = df10[,1],
        total.emission = df10[,2],
        stringsAsFactors=FALSE
)
View(df11)

#Specific table for type = "ON-ROAD"
df12<-subset(df5, subset=(type=="ON-ROAD"))
df13<-with (df12,aggregate(df12[,'Emissions'],by=list(year), sum, na.rm=TRUE))

df14 <- data.frame(
        year = df13[,1],
        total.emission = df13[,2],
        stringsAsFactors=FALSE
)
View(df14)

#Specific table for type = "NON-ROAD"
df15<-subset(df5, subset=(type=="NON-ROAD"))
df16<-with (df15,aggregate(df15[,'Emissions'],by=list(year), sum, na.rm=TRUE))

df17 <- data.frame(
        year = df16[,1],
        total.emission = df16[,2],
        stringsAsFactors=FALSE
)
View(df17)

#Preparing table - check table
df18<-cbind(df8,df11[,2],df14[,2],df17[,2])
names(df18)<-c("Year","POINT","NONPOINT","ROAD","NON-ROAD")
View(df18)
#draw plots
png("plot3.png", width=480, height=480, units="px")
par(mfcol=c(1,4))
rng<-range(df8,df11,df14,df17)
plot(df8, ylim=rng)+lines(df8, col = "blue")
plot(df11, ylim=rng)+lines(df11, col = "orange")
plot(df14, ylim=rng)+lines(df14, col = "green")
plot(df17, ylim=rng)+lines(df17, col = "red")
dev.off()