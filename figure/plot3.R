houseconsum<-read.table("./household_power_consumption.txt",sep=";",header=TRUE,na.strings = "?")
subdata<-subset(houseconsum,Date=="1/2/2007"|Date=="2/2/2007")
subdata$Date <- as.Date(subdata$Date, format = "%d/%m/%Y")
subdata$datetime <- as.POSIXct(paste(subdata$Date, subdata$Time))
subdata$Global_active_power<-as.numeric(subdata$Global_active_power)
# plot figure
png("plot3.png",height=480,width = 480,units = "px")
with(subdata,plot(datetime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering)"))
with(subdata,lines(datetime,Sub_metering_2,col="red"))
with(subdata,lines(datetime,Sub_metering_3,col="blue"))
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=1)
# close device
dev.off()
