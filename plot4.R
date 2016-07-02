library(lubridate)
powerConsume <- read.table("data/household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = FALSE)
powerConsume<-subset(powerConsume, Date=='1/2/2007' | Date=='2/2/2007')
datetime <- strptime(paste(powerConsume$Date, powerConsume$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
Global_active_power <- as.numeric(powerConsume$Global_active_power)
sub_Metering_1 <- as.numeric(powerConsume$Sub_metering_1)
sub_Metering_2 <- as.numeric(powerConsume$Sub_metering_2)
sub_Metering_3 <- as.numeric(powerConsume$Sub_metering_3)
Global_reactive_power <- as.numeric(powerConsume$Global_reactive_power)
Voltage <- as.numeric(powerConsume$Voltage)



## Plot fourth chart
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

## plot Global_active_power
plot(datetime,Global_active_power, type="l", xlab="", ylab="Global Active Power")

## Vlotage
plot(datetime,Voltage, type="l", xlab="datetime", ylab="Voltage")

## plot Energy sub metering
plot(datetime, sub_Metering_1, type="l", xlab="", ylab="Energy Submetering")
lines(datetime, sub_Metering_2, type="l", col="red")
lines(datetime, sub_Metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

## plot Global reactive power
plot(datetime,Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
