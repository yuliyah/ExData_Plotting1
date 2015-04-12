setwd("/Users/yuliya/Desktop")
install.packages('lubridate')
library(lubridate)

powerdata<-read.table("household_power_consumption.txt", sep=";", header=T, na.strings="?")
powerdata1<-powerdata
powerdata1$Date<-as.Date(powerdata1$Date, guess_formats(powerdata1$Date, "dmY"))

powerdata2<-subset(powerdata1, Date>="2007-02-01" &Date<"2007-02-03")

powerdata2$Global_active_power<-as.numeric(powerdata2$Global_active_power)

powerdata2$DateTime = paste(powerdata2$Date, powerdata2$Time)
powerdata2$DateTimeProper = as.POSIXct(powerdata2$DateTime, format="%Y-%m-%d %H:%M:%S")

par(mfrow=c(2,2))
with(powerdata2, plot(Global_active_power~DateTimeProper,type='l', xlab = "", ylab = "Global Active Power (kilowatts)") )

with(powerdata2, plot(Voltage~DateTimeProper, type="l", xlab="datetime"))

with(powerdata2, plot(Sub_metering_1~DateTimeProper, type="l", col="black", xlab = "", ylab = "Energy sub metering"))
with(powerdata2, lines(DateTimeProper,Sub_metering_2, col="red"))
with(powerdata2, lines(DateTimeProper,Sub_metering_3, col="blue"))
legend("topright", pch = "_", col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.3)

with(powerdata2, plot(Global_reactive_power~DateTimeProper, type="l", xlab="datetime"))


png(
  "Plot4.png",
  width     = 480,
  height    = 480
  
)
dev.copy(png, 
         'Plot4.png')
dev.off()

