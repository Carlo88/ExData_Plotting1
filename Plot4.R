Plot4<- function (){
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
    
  #Fourth Plot: Plot4.png
  png(file="plot4.png",width=480,height=480,units="px")
  par(mfrow=c(2,2))
  plot(p,Data$Global_active_power,type="l",main=" ",xlab=" " , ylab="Global Active Power")
  plot(p,Data$Voltage,type="l",xlab="datetime",ylab="Voltage")
  
  plot(p,Sub$Sub_metering_1,type="l",col="black",ylab="Energy sub metering",xlab="")
  lines(p,Sub$Sub_metering_2,type="l",col="red")
  lines(p,Sub$Sub_metering_3,type="l",col="blue")
  legend("topright",names(Sub),col=c('black','red','blue'),lty=1,bty="n",y.intersp=0.7)
  plot(p,Data$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")  
  dev.off()
  
}