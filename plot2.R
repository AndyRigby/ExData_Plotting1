#read in data and subset to relevant dates
Data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
DataSubset<-Data[Data$Date=="1/2/2007" | Data$Date=="2/2/2007",]


#open png device (default size is 480*480), create plot and close device
png(filename="plot2.png")
plot(DataSubset$Global_active_power,type="n",xaxt='n',xlab="",ylab="Global Active Power (kilowatts)")
lines(DataSubset$Global_active_power)
axis(1,at=c(1,1441,2881),labels=c("Thu","Fri","Sat"))
dev.off()