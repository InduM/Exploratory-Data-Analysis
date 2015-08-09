par(mar=c(4,4,2,1))
par(mfrow=c(2,2))

tableA <- read.table("household_power_consumption.txt", header = T,na.string="?",sep=";")

# joining thr date and time columns 
C = paste(tableA$Date, tableA$Time, sep=" ")
tableA$Date<-as.Date(strptime(C,"%d/%m/%Y %H:%M:%S"))

#subsetting the required rows
su<-subset(tableA,tableA$Date==as.Date("2007-02-01")| tableA$Date==as.Date("2007-02-02"))
datetime <-as.POSIXct(paste(as.Date(su$Date), su$Time))

#plot1
plot(datetime, su$Global_active_power,type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

#plot2
plot(datetime, su$Voltage,type="l",
     ylab="Voltage", xlab="datetime")

#plot3	 
plot(datetime, su$Sub_metering_1  ,type="l",
     ylab="Energy Sub Metering", xlab="",col="black")
lines(datetime, su$Sub_metering_3,col="red")
lines(datetime, su$Sub_metering_2 ,col="blue")
		 
legend("topright",												#legend for plot3
	 c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
	 lty=c(1,1,1),
	 col=c("black","blue","red")) 

#plot4
plot(datetime,su$Global_reactive_power, type="l",ylab="Global_reactive_power", xlab="datetime")
 