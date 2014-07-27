##Question 5
#How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

getwd()
setwd("C:/Users/cberthillon/018.Coursera/004.Exploratory Data Analysis/040.CourseProject2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
View(SCC)
View(NEI)
df26 <- unique(grep("Vehicles", SCC$EI.Sector, ignore.case = TRUE,value = TRUE))
#Filter the Vehicle sources from SCC
df27 <- SCC[SCC$EI.Sector %in% df26, ][SCC]
#if df27 <- SCC[SCC$EI.Sector %in% df26, ][SCC], THEN only column SCC appears

#Merging both sets of data (df20 and NEI) based on column "SCC"
#merging datatables with  package "data.table"
df28<-merge(df27,NEI, by="SCC")
df29<-subset(df28, subset=(fips=="24510"))
View(df29)

#define the changes of emissions from motor vehicle sources from 1999-2008
df30<-with (df29,aggregate(df29[,'Emissions'],by=list(year), sum, na.rm=TRUE))
df31 <- data.frame(
        year = df30[,1],
        total.emission.from.motor.vehicle.sources = df30[,2],
        stringsAsFactors=FALSE
)
View(df31)
#draw plots
png("plot5.png", width=480, height=480, units="px")
plot(df31)+lines(df31, col = "purple")
dev.off()