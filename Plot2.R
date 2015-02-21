Plot2<- function (){
  library(lubridate)
  library(data.table)
  library(dplyr)
  x<-fread("household_power_consumption.txt") #Much faster than read.table
  Start<-x[x$Date=="1/2/2007"]
  End<-x[x$Date=="2/2/2007"]
  Data<-rbind(Start,End)
  Data$Global_active_power<-as.numeric(Data$Global_active_power)
  p<-paste(as.Date(Data$Date,"%d/%m/%Y"),Data$Time)
  p<-strptime(p, "%Y-%m-%d %H:%M:%S")
  Sub<-select(Data,Sub_metering_1:Sub_metering_3)
  Sub<-lapply(Sub,as.numeric)
  par(mfrow=c(1,1))
  
  
  #Second Plot: Plot2.png
  png(file="plot2.png",width=480,height=480,units="px")
  plot(p,Data$Global_active_power,type="l",main=" ",xlab=" " , ylab="Global Active Power (kilowatts)")
  dev.off()
  
  
}