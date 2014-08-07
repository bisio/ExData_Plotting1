prepare.data <- function() {
  power.data <- read.table("household_power_consumption.txt",sep=";",
                           col.names=c("Date", "Time", "Global_active_power", "Global_reactive_power", 
                                       "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", 
                                       "Sub_metering_3"),header=F,na.strings="?",skip=66637,nrows=2880)
  date.time <- paste(power.data$Date,power.data$Time)
  power.data$date.time <- strptime(date.time,"%d/%m/%Y %H:%M:%S")
  power.data
}

Sys.setlocale("LC_TIME", "English")
power.data <- prepare.data()

png("plot4.png")
par(mfrow=c(2,2))
plot(power.data$date.time,power.data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

plot(power.data$date.time,power.data$Voltage,type="l",xlab="datetime",ylab="Voltage")

plot(power.data$date.time,power.data$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(power.data$date.time,power.data$Sub_metering_1,col="black")
lines(power.data$date.time,power.data$Sub_metering_2,col="red")
lines(power.data$date.time,power.data$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,bty="n")

plot(power.data$date.time, power.data$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l")

dev.off()
