#read in data and subset to relevant dates
Data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
DataSubset<-Data[Data$Date=="1/2/2007" | Data$Date=="2/2/2007",]

#open png device (default size is 480*480)
png(filename="plot4.png")

#set plot area to 2*2 grid and set margins
par(mfrow=c(2,2))
par(mar=c(4,4,2,2))

#first plot (top left)
plot(DataSubset$Global_active_power,type="n",xaxt='n',xlab="",ylab="Global Active Power")
lines(DataSubset$Global_active_power)
axis(1,at=c(1,1441,2881),labels=c("Thu","Fri","Sat"))

#second plot (top right)
plot(DataSubset$Voltage,type="n",xaxt='n',xlab="datetime",ylab="Voltage")
lines(DataSubset$Voltage)
axis(1,at=c(1,1441,2881),labels=c("Thu","Fri","Sat"))

#third plot (bottom left)
plot(DataSubset$Sub_metering_1,type="n",xaxt='n',xlab="",ylab="Energy sub metering")
lines(DataSubset$Sub_metering_1,col="black")
lines(DataSubset$Sub_metering_2,col="red")
lines(DataSubset$Sub_metering_3,col="blue")
axis(1,at=c(1,1441,2881),labels=c("Thu","Fri","Sat"))
#use bty=n to remove the box around the legend
legend("topright",bty="n",lty=c(1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#final plot (bottom right)
plot(DataSubset$Global_reactive_power,pch=".",xaxt='n',xlab="datetime",ylab="Global_reactive_power")
lines(DataSubset$Global_reactive_power)
axis(1,at=c(1,1441,2881),labels=c("Thu","Fri","Sat"))

#close png device
dev.off()
