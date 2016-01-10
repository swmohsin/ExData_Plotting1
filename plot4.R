power <- read.csv("household_power_consumption.txt", sep=";")
s <- subset(power, power$Date == '2/1/2007' | power$Date == '2/2/2007')
dates <- as.character(s$Date)
times <- as.character(s$Time)
datetimes <- paste(dates, times)
dt <- strptime(datetimes,format='%m/%d/%Y %H:%M:%S')
voltage = as.numeric(as.character(s$Voltage))
gap <- as.numeric(as.character(s$Global_active_power))
sm1 <- as.numeric(as.character(s$Sub_metering_1))
sm2 <- as.numeric(as.character(s$Sub_metering_2))
sm3 <- as.numeric(as.character(s$Sub_metering_3))
grp = as.numeric(as.character(s$Global_reactive_power))
# global parameters to configure 4 plots
par(mfrow=c(2,2))
# output file name
#png(filename="plot4.png",width=480,height=480)
# top left plot
plot(dt, gap, type='l', xlab='', ylab='Global Active Power')
# top right plot
plot(dt, voltage, type='l', xlab='datetime', ylab='Voltage')
# bottom left plots
plot(dt, sm1, col='black', type='l', ylab="Energy sub metering", ylim=c(0, 35))
lines(dt, sm2, col="red", type='l')
lines(dt, sm3, col="blue", ylab="Energy sub metering", type='l')
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), lwd=c(2.5, 2.5, 2.5), col=c("black", "red", "blue"))
# bottom right plot
plot(dt, grp, type='l', ylab='Global_reactive_power', xlab="datetime")
