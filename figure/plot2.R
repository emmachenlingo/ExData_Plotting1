houseconsum<-read.table("./household_power_consumption.txt",sep=";",header=TRUE,na.strings = "?")
subdata<-subset(houseconsum,Date=="1/2/2007"|Date=="2/2/2007")
subdata$Date <- as.Date(subdata$Date, format = "%d/%m/%Y")
subdata$datetime <- as.POSIXct(paste(subdata$Date, subdata$Time))
subdata$Global_active_power<-as.numeric(subdata$Global_active_power)
# plot figure
png("plot2.png",height=480,width = 480,units = "px")
with(subdata,plot(datetime,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))
# close device
dev.off()


