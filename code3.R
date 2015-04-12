getwd()
setwd("/Users/yuliya/Desktop")
#install.packages("rJava")
#install.packages("stringr", dependencies=TRUE)
install.packages('rattle')
install.packages('rpart')
install.packages('rpart.plot')
install.packages('RColorBrewer')
install.packages('fastcluster')
install.packages('graphics')
install.packages('lubridate')
install.packages('plyr')
install.packages('data.table')


library(rattle)
library(rpart)
library(rpart.plot)
library(RColorBrewer)
library(fastcluster)
library(lubridate)
library(plyr)
library(data.table)


##require(stringr)
#library(rJava)
#library(xlsx)
nrow(mydata)

mydata<-read.table("Veem4.csv", sep=",", fill=T, header=T)
mydata1<-mydata
mydata1[is.na(mydata1)]<-0
##head(mydata1)


usdata<-subset(mydata1, COUNTRY=='United States')
usvalp<-subset(usdata,OPPORTUNITYSTAGENAME %in% c("Propose", "Validate Solution"))
rpart_model <- rpart(OPPORTUNITYSTAGENAME ~ CAMPAIGNDEPARTMENT + CAMPAIGNSUBTYPEC, data=usvalp, method="class",control=rpart.control(minsplit=20, cp=0))
fancyRpartPlot(rpart_model, uniform=TRUE, main="Classification Tree for Optionsnapshot")
text(rpart_model, use.n=TRUE, all=TRUE, cex=.8)


#usdata1<-usdata[1:10000,]
#head(usdata1)

install.packages('fastcluster')
install.packages('graphics')
install.packages('lubridate')
install.packages('plyr')
install.packages('data.table')
install.packages("qdapTools")


library(rattle)
library(rpart)
library(rpart.plot)
library(RColorBrewer)
library(fastcluster)
library(lubridate)
library(plyr)
library(data.table)
library(qdapTools)


mydata<-read.csv("Veem4.csv", sep=",", fill=T, header=T)
mydata1<-mydata
mydata1[is.na(mydata1)]<-0
head(mydata1)

#unique(mydata1$OPPORTUNITYSTAGENAME)

usdata<-subset(mydata1, COUNTRY=='United States')
nrow(usdata)
uswon<-subset(usdata, won==1)
uslost<-subset(usdata, OPPORTUNITYSTAGENAME=="Closed Lost")
#nrow(usval)
usother<-subset(usdata, OPPORTUNITYSTAGENAME=="Closed Other")
usident<-subset(usdata, OPPORTUNITYSTAGENAME=="Identify" )
usprop<-subset(usdata, OPPORTUNITYSTAGENAME=="Propose" )
usq<-subset(usdata, OPPORTUNITYSTAGENAME=="Qualify" )
usemp<-subset(usdata, OPPORTUNITYSTAGENAME=="" )
usval<-subset(usdata, OPPORTUNITYSTAGENAME=="Validate Solution" )


