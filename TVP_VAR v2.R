library(xlsx)
RAW = read.xlsx("./data1.xlsx", 1)
#View(RAW)
date=as.Date(RAW$date,origin="1899-12-30")
df=RAW[,-1]
#View(df)
library(zoo)
date=as.Date(RAW$date,origin="1899-12-30")
zoodata=zoo(df,order.by=date)
myzoo=na.omit(zoodata)
library(ConnectednessApproach)

dyc=ConnectednessApproach(myzoo, nlag=1, nfore=10, window.size =200, model="TVP-VAR", connectedness = "Time")
dyc$TABLE
dyc$TCI
write.csv(dyc$TABLE, "dca.csv")
ConnectednessApproach::PlotNetwork(dyc)
ConnectednessApproach::PlotFROM(dyc)
ConnectednessApproach::PlotTO(dyc)
ConnectednessApprocah::PlotTCI(dyc)
ConnectednessApproach::PlotNPDC(dyc)
ConnectednessApproach::PlotNET(dyc)

