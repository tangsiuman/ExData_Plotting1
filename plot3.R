library(lubridate)
powerConsume <- read.table("data/household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = FALSE)
powerConsume<-subset(powerConsume, Date=='1/2/2007' | Date=='2/2/2007')
datetime <- strptime(paste(powerConsume$Date, powerConsume$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
Sub_Metering_1 <- as.numeric(powerConsume$Sub_metering_1)
Sub_Metering_2 <- as.numeric(powerConsume$Sub_metering_2)
Sub_Metering_3 <- as.numeric(powerConsume$Sub_metering_3)



## Plot third chart
png("plot3.png", width=480, height=480)
plot(datetime, Sub_Metering_1, type="l", xlab="", ylab="Energy Submetering")
lines(datetime, Sub_Metering_2, type="l", col="red")
lines(datetime, Sub_Metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
