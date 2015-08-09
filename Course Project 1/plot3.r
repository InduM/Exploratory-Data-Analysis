par(mar=c(1,1,1,1))

tableA <- read.table("household_power_consumption.txt", header = T,na.string="?",sep=";")

# joining thr date and time columns 
C = paste(tableA$Date, tableA$Time, sep=" ")
tableA$Date<-as.Date(strptime(C,"%d/%m/%Y %H:%M:%S"))
#subsetting the required rows
su<-subset(tableA,tableA$Date==as.Date("2007-02-01")| tableA$Date==as.Date("2007-02-02"))
datetime <-as.POSIXct(paste(as.Date(su$Date), su$Time))

plot(datetime, su$Sub_metering_1  ,type="l",
     ylab="Energy Sub Metering", xlab="",col="black")
lines(datetime, su$Sub_metering_3,col="red")
lines(datetime, su$Sub_metering_2 ,col="blue")
		 
legend("topright",
	 c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
	 lty=c(l,l,l),									#symbol for the legend(lines=1)
	 col=c("black","blue","red")) 

