par(mar=c(1,1,1,1))
tableA <- read.table("household_power_consumption.txt", header = T,na.string="?",sep=";")

# joining thr date and time columns 
C = paste(tableA$Date, tableA$Time, sep=" ")
tableA$Date<-as.Date(strptime(C,"%Y-%m-%d %H:%M:%S"))

#subsetting the required rows
su<-subset(tableA,tableA$Date==as.Date("2007-02-01")| tableA$Date==as.Date("2007-02-02"))

hist(su$Global_active_power,col="red",main = "Global Active Power",xlab= "Global Active Power(kilowatts)",ylab = "Frequency")
  
 
 