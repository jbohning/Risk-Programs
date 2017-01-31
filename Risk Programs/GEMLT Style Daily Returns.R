#This Program takes raw, daily returns from Barra and cumulates them

#setwd("S://Data//Scout//Bohning//Data Science//Risk Programs")

library(ggplot2)
library(reshape)

#Get data and set date class
rawdailyreturns<-read.csv("GEMLT_Style_Daily_Returns.csv")
rawdailyreturns$Dates<-as.Date(rawdailyreturns$Dates,"%m/%d/%Y")

#Cumulate All Returns. FYI this for loop takes about 0.27 sec per 50 rows of
#data (for 16 columns and the date). 5,600 rows take about 30 sec
numbcolumns<-ncol(rawdailyreturns)
cumulated_returns<-rawdailyreturns[1,]
for (i in 1:(length(rawdailyreturns[,2])-1)){
        cumulated_returns[i+1,1]<-rawdailyreturns[i+1,1]
        cumulated_returns[i+1,2:numbcolumns]<-(rawdailyreturns[i+1,2:numbcolumns]+1)*(cumulated_returns[i,2:numbcolumns]+1)-1
}

#Set the first column's name to "Dates" to ensure that melting works properly
#in the next step
colnames<-names(cumulated_returns)
colnames[1]<-"Dates"
names(cumulated_returns)<-colnames

#Melt the data frame for graphing purposes
melted_cuml_returns<-melt(cumulated_returns,id=colnames[1])
melted_cuml_returns<-cbind(melted_cuml_returns[,1:2],melted_cuml_returns[,3]*100)
names(melted_cuml_returns)<-c("Dates","variable","value")


#Pull in colors data
source("S://Data//Scout//Bohning//Data Science//Risk Programs//Colors//RiskDiligence Color Pallete 161129.R")

#Graph
ggplot(melted_cuml_returns,aes(x=Dates,y=value,color=variable))+
        geom_line()+
        scale_color_manual(values=GEMLT_ALL_STYLES)+
        xlab(NULL)+ylab("Cumulative Returns (%)")+
        theme(legend.title=element_blank())+
        labs(title="GEMLT Cumulative Returns")+
        geom_hline(yintercept = 0)

