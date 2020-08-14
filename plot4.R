file <- read.csv("household_power_consumption.txt", sep = ";")
dates = c("1/2/2007","2/2/2007")
file <- file[which (file$Date %in% dates), ]

data <- data.frame(Date = file$Date, Time = file$Time)
data$datetime <- paste(data$Date,data$Time)
data2 <- strptime(data$datetime, format = "%d/%m/%Y %H:%M:%S")


y1 <- file$Global_active_power
x1 <- data2

y2 <- file$Voltage 

y3 <- file$Sub_metering_1
y4 <- file$Sub_metering_2
y5 <- file$Sub_metering_3

y6 <- file$Global_reactive_power

png('plot4.png', width = 480, height = 480)
par(mfrow = c(2,2))
plot(x1,y1,type = "l", ylab="Global Active Power (kilowatts)", xlab = "")
plot(x1,y2,type = "l", ylab="Voltage", xlab = "datetime")
plot(x1,y3, type = "l", ylab = "Energy sub metering", xlab = "")
lines(x,y4, col = "Red")
lines(x,y5, col = "Blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("Black", "Red", "Blue"), lty = 1:1)
plot(x1,y6, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
dev.off()