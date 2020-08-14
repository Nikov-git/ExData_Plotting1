file <- read.csv("household_power_consumption.txt", sep = ";")
dates = c("1/2/2007","2/2/2007")
file <- file[which (file$Date %in% dates), ]

data <- data.frame(Date = file$Date, Time = file$Time)
data$datetime <- paste(data$Date,data$Time)
data2 <- strptime(data$datetime, format = "%d/%m/%Y %H:%M:%S")

y1 <-file$Sub_metering_1
y2 <- file$Sub_metering_2
y3 <- file$Sub_metering_3

x <- data2
png('plot3.png', width = 480, height = 480)
plot(x,y1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(x,y2, col = "Red")
lines(x,y3, col = "Blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("Black", "Red", "Blue"), lty = 1:1)

dev.off()