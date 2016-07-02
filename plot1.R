library(lubridate)
powerConsume <- read.table("data/household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = FALSE)
powerConsume$Date <- as.Date(powerConsume$Date, "%d/%m/%Y")
powerConsume<-subset(powerConsume, Date=='2007-02-01' | Date=='2007-02-02')
powerConsume$Global_active_power <- as.numeric(powerConsume$Global_active_power)


## Plot first chart
png("plot1.png", width=480, height=480)
hist(powerConsume$Global_active_power, col='red', main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

## Plot second chart
##plot(powerConsume$Date, powerConsume$Global_active_power)