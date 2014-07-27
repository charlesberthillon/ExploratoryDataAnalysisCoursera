##Question 4
#Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?.

getwd()
setwd("C:/Users/cberthillon/018.Coursera/004.Exploratory Data Analysis/040.CourseProject2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
View(SCC)
View(NEI)

#Filter the coal combustion-related sources from SCC
#column =EI.Sector:splitting with stringr package
df19<- str_sub(SCC$EI.Sector, -4, -1)
df20<-cbind(df19,SCC)
df21<-subset(df20, subset=(df19=="Coal"))


#Merging both sets of data (df20 and NEI) based on column "SCC"
#merging datatables with  package "data.table"
df22<-merge(df21,NEI, by="SCC")
df23<-subset(df22, subset=(df19=="Coal"))

#define the changes of emissions from coal combustion-related sources from 1999-2008
df24<-with (df23,aggregate(df23[,'Emissions'],by=list(year), sum, na.rm=TRUE))
df25 <- data.frame(
        year = df24[,1],
        total.emission.from.coal.combustion.related.sources = df24[,2],
        stringsAsFactors=FALSE
)
View(df25)
#draw plots
png("plot4.png", width=480, height=480, units="px")
plot(df25)+lines(df25, col = "blue")
dev.off()
