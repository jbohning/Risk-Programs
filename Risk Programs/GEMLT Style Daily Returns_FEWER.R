#This Program takes raw, daily returns from Barra and cumulates them. 

#You can chose which styles to plot by entering in style names into 
#styles_to_graph, but the colors will not line up properly if they aren't
#entered in the following order:

#Beta, Book_to_Price,Dividend_Yield,Earnings_Quality,Earnings_Variability,
#Earnings_Yield,Growth,Leverage,Liquidity,Long_Term_Reversal,Mid_Capitalization,
#Momentum,Profitability,Residual_Volatility,Size,Investment_Quality

#setwd("S://Data//Scout//Bohning//Data Science//Risk Programs")

library(ggplot2)
library(reshape)

#Which columns do you want?
styles_to_graph<-c("Beta","Growth","Mid.Capitalization","Size")

#Get data and set date class
rawdailyreturns<-read.csv("GEMLT_Style_Daily_Returns.csv")
rawdailyreturns$Dates<-as.Date(rawdailyreturns$Dates,"%m/%d/%Y")

#Eliminate Rows you don't want
rawdailyreturns<-data.frame(rawdailyreturns[,1],rawdailyreturns[,names(rawdailyreturns)%in%styles_to_graph])
names(rawdailyreturns)<-c("Dates",styles_to_graph)

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


#Pull in colors data and keep only names that are being called
source("S://Data//Scout//Bohning//Data Science//Risk Programs//Colors//RiskDiligence Color Pallete 161129.R")
color_data<-GEMLT_ALL_STYLES[GEMLT_ALL_STYLES_NAMES %in% names(cumulated_returns)]

#Graph
ggplot(melted_cuml_returns,aes(x=Dates,y=value,color=variable))+
        geom_line()+
        scale_color_manual(values=color_data)+
        theme(legend.title=element_blank())+
        xlab(NULL)+ylab("Cumulative Returns (%)")+
        labs(title="GEMLT Cumulative Returns")+
        geom_hline(yintercept = 0)

#Add line code example
ggplot(melted_cuml_returns,aes(x=Dates,y=value,color=variable))+
        geom_line()+
        scale_color_manual(values=color_data)+
        xlab(NULL)+ylab("Cumulative Returns (%)")+
        labs(title="GEMLT Cumulative Returns")+
        theme(legend.title=element_blank())+
        geom_vline(xintercept=as.numeric(as.Date("2016-01-01")))+
        geom_vline(xintercept=as.numeric(as.Date("2016-12-31")))+
        geom_hline(yintercept = 0)+
        geom_text(aes(x=as.Date("2016-07-01"), 
                      y=(max(melted_cuml_returns$value)-2), 
                      label="2016"), color="black",size=3, parse=T)


#Zoom in on certain dates (manually eyeball the y-axis)
minx<-as.Date("2016-01-01")
maxx<-as.Date("2016-12-31")
ggplot(melted_cuml_returns,aes(x=Dates,y=value,color=variable))+
        geom_line()+
        scale_color_manual(values=color_data)+
        xlab(NULL)+ylab("Cumulative Returns (%)")+
        labs(title="GEMLT Cumulative Returns")+
        theme(legend.title=element_blank())+
        xlim(minx,maxx)+
        ylim(-5,25)
