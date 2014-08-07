prepare.data <- function() {
  power.data <- read.table("household_power_consumption.txt",sep=";",header=T,na.strings="?")
  power.data$Date <- strptime(power.data$Date,"%d/%m/%Y")
  start <- strptime("2007-02-01","%Y-%m-%d")
  end <- strptime("2007-02-02","%Y-%m-%d")
  subset(power.data, Date >= start & Date <= end)
}

power.data <- prepare.data()
png("plot1.png",width = 480,height = 480)
hist(power.data$Global_active_power, col="red",xlab="Global active power(kilowatts)",ylab="Frequency",main="Global Active Power")
dev.off()
