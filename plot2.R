library(lubridate)
powerConsume <- read.table("data/household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = FALSE)
powerConsume<-subset(powerConsume, Date=='1/2/2007' | Date=='2/2/2007')
datetime <- strptime(paste(powerConsume$Date, powerConsume$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
Global_active_power <- as.numeric(powerConsume$Global_active_power)


## Plot second chart
png("plot2.png", width=480, height=480)
plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
