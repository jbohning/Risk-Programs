#USSLOW Color Pallete

Beta<-rgb(55,96,146,max=255)
Dividend_Yield<-rgb(218,208,0,max=255)
Earnings_Quality<-rgb(255,128,0,max=255)
Earnings_Yield<-rgb(96,74,123,max=255)
Growth<-rgb(0,128,0,max=255)
Leverage<-rgb(203,120,51,max=255)
Liquidity<-rgb(0,176,240,max=255)
Long_Term_Reversal<-rgb(255,179,179,max=255)
Management_Quality<-rgb(150,25,153,max=255)
Mid_Capitalization<-rgb(148,138,84,max=255)
Momentum<-rgb(255,0,0,max=255)
Profitability<-rgb(255,101,255,max=255)
Prospect<-rgb(128,128,128,max=255)
Residual_Volatility<-rgb(119,147,60,max=255)
Size<-rgb(179,162,199,max=255)
Value<-rgb(157,61,58,max=255)

USSLOW_ALL_STYLES<-c(Beta, Dividend_Yield,Earnings_Quality,Earnings_Yield,
                     Growth,Leverage,Liquidity,Long_Term_Reversal,
                     Management_Quality,Mid_Capitalization,Momentum,
                     Profitability,Prospect,Residual_Volatility,Size,Value)

USSLOW_ALL_STYLES_NAMES<-c("Beta", "Dividend.Yield","Earnings.Quality",
                           "Earnings.Yield","Growth","Leverage","Liquidity",
                           "Long.Term.Reversal","Management.Quality",
                           "Mid.Capitalization","Momentum","Profitability",
                           "Prospect","Residual.Volatility","Size","Value")

USSLOW_ELEVEN_STYLES<-c(Beta,Value,Dividend_Yield,Earnings_Quality,
                        Earnings_Yield,Growth,Liquidity,Long_Term_Reversal,
                        Mid_Capitalization,Prospect,Size)

#Check Color:
#barplot(1,col=Beta)

#GEMLT Colors (just the ones that USSLOW doesn't use)
Book_to_Price<-rgb(157,61,58,max=255)
Earnings_Variability<- rgb(71,55,55,max=255)
Investment_Quality<-rgb(150,25,153,max=255)

GEMLT_ALL_STYLES<-c(Beta, Book_to_Price,Dividend_Yield,Earnings_Quality,
                    Earnings_Variability,Earnings_Yield,
                    Growth,Leverage,Liquidity,
                    Long_Term_Reversal,Mid_Capitalization,Momentum,
                    Profitability,Residual_Volatility,Size,Investment_Quality)

GEMLT_ALL_STYLES_NAMES<-c("Beta", "Book.to.Price","Dividend.Yield",
                          "Earnings.Quality","Earnings.Variability",
                          "Earnings.Yield","Growth","Leverage","Liquidity",
                          "Long.Term.Reversal","Mid.Capitalization","Momentum",
                          "Profitability","Residual.Volatility","Size",
                          "Investment.Quality")

#Checking colors:
#barplot(c(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),col=GEMLT_ALL_STYLES)



#EMM1 Colors (just the ones that GEMLT and USSLOW don't use)

Short_Term_Reversal<-rgb(255,255,125,max=255)
Seasonality<-rgb(66,0,33,max=255)
Industry_Momentum<-rgb(183,195,218,max=255)
Oil_Sensitivity<-rgb(150,25,153,max=255)
Developed_Markets_Sensitivity<-rgb(255,179,179,max=255)
Non_Linear_Size<-rgb(148,138,84,max=255)
Downside_Beta<-rgb(128,128,128,max=255)

EMM1_ALL_STYLES<-c(Beta, Book_to_Price,Dividend_Yield,Earnings_Yield,
                   Growth,Leverage,Liquidity,Momentum,Residual_Volatility,Size,
                   Non_Linear_Size,Developed_Markets_Sensitivity,Downside_Beta,
                   Earnings_Quality,Industry_Momentum,Oil_Sensitivity,
                   Seasonality,Short_Term_Reversal)
#Checking colors barplot(c(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),col=EMM1_ALL_STYLES)

