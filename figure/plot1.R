## read the file
houseconsum<-read.table("./household_power_consumption.txt",sep=";",header=TRUE,na.strings = "?")
## subset data
subdata<-subset(houseconsum,Date=="1/2/2007"|Date=="2/2/2007")
subdata$Global_active_power<-as.numeric(subdata$Global_active_power)
## open the graphic devices
png("plot1.png",height=480,width = 480,units = "px")
with(subdata,hist(Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)"))
dev.off()