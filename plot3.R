## EDA Project 1
## Load Electric Power Consumption data from current directory - household_power_consumption.txt file
## 2+ million rows that require about 133MB in memory space
epc_data <- read.csv("household_power_consumption.txt", header = T, sep = ";", colClasses = c(rep("character", 9)))

## Convert column "Date" to Date class
## Select rows where dates are 01/02/2007 or 02/02/2007 and store in epc_data1
epc_data$Date <- as.Date(epc_data$Date, format = "%d/%m/%Y")
epc_data1 <- epc_data[(epc_data$Date == "2007-02-01" | epc_data$Date == "2007-02-02"), ]

## PLOT 3 - Sub Metering 1, 2 and 3 by Weekdays graphic
## Merge 'Date' and 'Time' columns to determine the x-axis distribution in plot
epc_data1$Time <- paste(epc_data1$Date, " ", epc_data1$Time)

## Openning .png file to save the histogram, file 'plot3.png' at 480 x 480 pixel resolution
## Plotting Sub Metering 1, 2 and 3 x Weekdays
png(filename = "plot3.png", width = 480, height = 480, units = "px")
plot(strptime(epc_data1$Time, format = "%Y-%m-%d %H:%M:%S"), epc_data1$Sub_metering_1, 
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")
lines(strptime(epc_data1$Time, format = "%Y-%m-%d %H:%M:%S"), epc_data1$Sub_metering_2, col = "red")
lines(strptime(epc_data1$Time, format = "%Y-%m-%d %H:%M:%S"), epc_data1$Sub_metering_3, col = "blue")
legend("topright", c("Sub metering 1", "Sub metering 2", "Sub metering 3"), 
       lty = c(1, 1, 1), 
       lwd = c(2, 2, 2),
       col = c("black", "red", "blue"))
dev.off()

