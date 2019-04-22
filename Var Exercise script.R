library(ggplot2) # Data visualization
library(readr) # CSV file I/O, e.g. the read_csv function
library(PerformanceAnalytics)

library(RMySQL)
library(lubridate)
library(dplyr)
library(plotly)
library(mime)
library(ggplot2)
library(ggfortify)
library(forecast)


RBOB <- read.csv('~/Gasoline RBOB Futures Historical Data.csv')
RBOBreturns <- (RBOB$Price[1:(length(RBOB$Price)-1)]-RBOB$Price[2:length(RBOB$Price)])/RBOB$Price[2:length(RBOB$Price)]


RBOBVar99<-(VaR(RBOBreturns,p=0.99,method="historical")*100)#Value at Risk at 99% Confidence
RBOBVar95<-(VaR(RBOBreturns,p=0.95, method = "historical")*100) #Value at risk at 95% Confidence
RBOBvar90<-(VaR(RBOBreturns,p=0.90,method = "historical")*100) #value at risk at 90% confidence
RBOBvarmatrix<-cbind(RBOBvar90,RBOBVar95,RBOBVar99)
colnames(RBOBvarmatrix)<-c("RBOBVar90","RBOBVar95","RBOBVar99")#creating head
RBOBvarmatrix
#write.csv(varmatrix,file = "VAR of stock") #exporting
barplot(RBOBvarmatrix)

#RBOBVar90 RBOBVar95 RBOBVar99
#VaR -2.604451 -3.792386 -6.874903


hist(RBOBreturns)



HO <- read.csv('~/Heating Oil Futures Historical Data.csv')
HOreturns <- (HO$Price[1:(length(HO$Price)-1)]-HO$Price[2:length(HO$Price)])/HO$Price[2:length(HO$Price)]


HOVar99<-(VaR(HOreturns,p=0.99,method="historical")*100)#Value at Risk at 99% Confidence
HOVar95<-(VaR(HOreturns,p=0.95, method = "historical")*100) #Value at risk at 95% Confidence
HOvar90<-(VaR(HOreturns,p=0.90,method = "historical")*100) #value at risk at 90% confidence
HOvarmatrix<-cbind(HOvar90,HOVar95,HOVar99)
colnames(HOvarmatrix)<-c("HOVar90","HOVar95","HOVar99")#creating head
HOvarmatrix
#write.csv(varmatrix,file = "VAR of stock") #exporting
barplot(HOvarmatrix)


#HOVar90   HOVar95   HOVar99
#VaR -2.415023 -3.409521 -5.472751


hist(HOreturns)



CL <- read.csv('~/Crude Oil WTI Futures Historical Data.csv')
CLreturns <- (CL$Price[1:(length(CL$Price)-1)]-CL$Price[2:length(CL$Price)])/CL$Price[2:length(CL$Price)]


CLVar99<-(VaR(CLreturns,p=0.99,method="historical")*100)#Value at Risk at 99% Confidence
CLVar95<-(VaR(CLreturns,p=0.95, method = "historical")*100) #Value at risk at 95% Confidence
CLvar90<-(VaR(CLreturns,p=0.90,method = "historical")*100) #value at risk at 90% confidence
CLvarmatrix<-cbind(CLvar90,CLVar95,CLVar99)
colnames(CLvarmatrix)<-c("CLVar90","CLVar95","CLVar99")#creating head
CLvarmatrix
#write.csv(varmatrix,file = "VAR of stock") #exporting
barplot(CLvarmatrix)

#CLVar90   CLVar95   CLVar99
#VaR -2.627332 -3.696329 -6.010293

hist(CLreturns)