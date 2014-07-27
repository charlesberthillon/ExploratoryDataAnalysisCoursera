##Question 6
#Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources
#in Los Angeles County, California (fips == "06037"). 
#Which city has seen greater changes over time in motor vehicle emissions?

getwd()
setwd("C:/Users/cberthillon/018.Coursera/004.Exploratory Data Analysis/040.CourseProject2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
View(SCC)
View(NEI)
df32 <- unique(grep("Vehicles", SCC$EI.Sector, ignore.case = TRUE,value = TRUE))
#Filter the Vehicle sources from SCC
df33 <- SCC[SCC$EI.Sector %in% df32, ]

#Merging both sets of data (df20 and NEI) based on column "SCC"
#merging datatables with  package "data.table"
df34<-merge(df33,NEI, by="SCC")
df35<-subset(df34, subset=(fips=="24510"| fips=="06037"))

#define the changes of emissions from motor vehicle sources in LA from 1999-2008
df35<-subset(df34, subset=(fips=="06037"))
df36<-with (df35,aggregate(df35[,'Emissions'],by=list(year), sum, na.rm=TRUE))
df37 <- data.frame(
        year = df36[,1],
        total.emission.from.motor.vehicle.sources = df36[,2],
        stringsAsFactors=FALSE
)
View(df37)

#define the changes of emissions from motor vehicle sources in Baltimore from 1999-2008
df38<-subset(df34, subset=(fips=="24510"))
df39<-with (df38,aggregate(df38[,'Emissions'],by=list(year), sum, na.rm=TRUE))
df40 <- data.frame(
        year = df39[,1],
        total.emission.from.motor.vehicle.sources = df39[,2],
        stringsAsFactors=FALSE
)
View(df40)
#draw plots
png("plot6.png", width=480, height=480, units="px")
par(mfcol=c(1,2))
rng<-range(df37,df40)
plot(df37, ylim=rng)+lines(df37, col = "blue")+title(main = "Los Angeles")
plot(df40, ylim=rng)+lines(df40, col = "orange")+title(main = "Baltimore")
dev.off()