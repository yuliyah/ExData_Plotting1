setwd("/Users/yuliya/Desktop")
install.packages('lubridate')
library(lubridate)

powerdata<-read.table("household_power_consumption.txt", sep=";", header=T)
powerdata1<-powerdata
powerdata1$Date<-as.Date(powerdata1$Date, guess_formats(powerdata1$Date, "dmY"))

powerdata2<-subset(powerdata1, Date>="2007-02-01" &Date<"2007-02-03")

powerdata2$Global_active_power<-as.numeric(powerdata2$Global_active_power)

powerdata2$DateTime = paste(powerdata2$Date, powerdata2$Time)
powerdata2$DateTimeProper = as.POSIXct(powerdata2$DateTime, format="%Y-%m-%d %H:%M:%S")



with(powerdata2, plot(Global_active_power~DateTimeProper,type='l', xlab = "", ylab = "Global Active Power (kilowatts)") )
png(
  "Plot2.png",
  width     = 480,
  height    = 480
  
)
dev.copy(png,'Plot2.png')
dev.off()
