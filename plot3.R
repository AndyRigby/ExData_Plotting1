#read in data and subset to relevant dates
Data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
DataSubset<-Data[Data$Date=="1/2/2007" | Data$Date=="2/2/2007",]

#open png device (default size is 480*480)
png(filename="plot3.png")

#create blank plot without x axis
plot(DataSubset$Sub_metering_1,type="n",xaxt='n',xlab="",ylab="Energy sub metering")

#add in lines
lines(DataSubset$Sub_metering_1,col="black")
lines(DataSubset$Sub_metering_2,col="red")
lines(DataSubset$Sub_metering_3,col="blue")

#add in missing x axis and legend
axis(1,at=c(1,1441,2881),labels=c("Thu","Fri","Sat"))
legend("topright",lty=c(1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#close png device
dev.off()
