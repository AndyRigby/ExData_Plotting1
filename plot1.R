#read in data and subset to relevant dates
Data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
DataSubset<-Data[Data$Date=="1/2/2007" | Data$Date=="2/2/2007",]

#open png device (default size is 480*480), create histogram and close device
png(filename="plot1.png")
hist(DataSubset$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()