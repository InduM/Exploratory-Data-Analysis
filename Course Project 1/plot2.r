par(mar=c(4,4,4,4))
tableA <- read.table("household_power_consumption.txt", header = T,na.string="?",sep=";")

# joining thr date and time columns 
C = paste(tableA$Date, tableA$Time, sep=" ")
tableA$Date<-as.Date(strptime(C,"%Y-%m-%d %H:%M:%S"))

#subsetting the required rows
su<-subset(tableA,tableA$Date==as.Date("2007-02-01")| tableA$Date==as.Date("2007-02-02"))

datetime <-as.POSIXct(paste(as.Date(su$Date), su$Time))
plot(datetime, su$Global_active_power,type="l",
     ylab="Global Active Power (kilowatts)", xlab="")