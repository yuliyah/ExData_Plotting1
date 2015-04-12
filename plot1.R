
setwd("/Users/yuliya/Desktop")
install.packages('lubridate')
library(lubridate)

powerdata<-read.table("household_power_consumption.txt", sep=";", header=T)
head(powerdata)
names(powerdata)
class(powerdata$Date)
powerdata1<-powerdata
powerdata1$Date<-as.Date(powerdata1$Date, guess_formats(powerdata1$Date, "dmY"))

powerdata2<-subset(powerdata1, Date>="2007-02-01" &Date<"2007-02-03")

powerdata2$Global_active_power<-as.numeric(powerdata2$Global_active_power)
hist(powerdata2$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
png(
  "Plot1.png",
  width     = 480,
  height    = 480
  
)
dev.copy(png,'Plot1.png')
dev.off()
