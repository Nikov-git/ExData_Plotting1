file <- read.csv("household_power_consumption.txt", sep = ";")
dates = c("1/2/2007","2/2/2007")
file <- file[which (file$Date %in% dates), ]
file$Global_active_power <- as.numeric(file$Global_active_power)

data <- data.frame(Date = file$Date, Time = file$Time)
data$datetime <- paste(data$Date,data$Time)
data2 <- strptime(data$datetime, format = "%d/%m/%Y %H:%M:%S")


y <- file$Global_active_power
x <- data2
png('plot2.png', width = 480, height = 480)
plot(x,y,type = "l", ylab="Global Active Power (kilowatts)", xlab = "")
dev.off()