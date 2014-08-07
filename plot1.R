
prepare.data <- function() {
  power.data <- read.table("household_power_consumption.txt",sep=";",
                           col.names=c("Date", "Time", "Global_active_power", "Global_reactive_power", 
"Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", 
"Sub_metering_3"),header=F,na.strings="?",skip=66637,nrows=2880)
  date.time <- paste(power.data$Date,power.data$Time)
  power.data$date.time <- strptime(date.time,"%d/%m/%Y %H:%M:%S")
  power.data
}



power.data <- prepare.data()
png("plot1.png",width = 480,height = 480)
hist(power.data$Global_active_power, col="red",xlab="Global active power(kilowatts)",ylab="Frequency",main="Global Active Power")
dev.off()
