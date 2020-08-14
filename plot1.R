file <- read.csv("household_power_consumption.txt", sep = ";")
dates = c("1/2/2007","2/2/2007")
file <- file[which (file$Date %in% dates), ]
file$Global_active_power <- as.numeric(file$Global_active_power)
x <- file$Global_active_power
png('plot1.png', width = 480, height = 480)
plot1 <- hist(x, 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", 
     col="red"
)
dev.off()
