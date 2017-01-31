#Test Return Data/Exploration

library(PerformanceAnalytics)
library(zoo)

#Fake Data/
testreturns<-c(.25,.5,.25,-.5,.5,.25,.25,-.5,.25,-.25)
a<-c(as.Date("2015/1/2"),as.Date("2015/1/3"),as.Date("2015/1/4"),
     as.Date("2015/1/5"),as.Date("2015/1/6"),as.Date("2015/1/7"),
     as.Date("2015/1/8"),as.Date("2015/1/9"),as.Date("2015/1/10"),
     as.Date("2015/1/11"))
testreturns<-data.frame(a,testreturns)
names(testreturns)<-c("Dates","Daily_Returns")

dfx=xts(testreturns$Daily_Returns,order.by = as.Date(testreturns$Dates))

chart.CumReturns(dfx,main="test")



#Others
cumlreturns<-Return.cumulative(rawdailyreturns[2,17],geometric = TRUE)

dfx<-xts(rawdailyreturns$Beta,order.by = as.Date(rawdailyreturns$Dates))
par(mar=c(4,2,4,6))
chart.CumReturns(dfx,main="Cumualtive Beta Returns",
                 colorset = rgb(0,128,0,max=255))
abline(h=0.2)
abline(v=1999-04-29)