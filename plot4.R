## EDA Project 1
## Load Electric Power Consumption data from current directory - household_power_consumption.txt file
## 2+ million rows that require about 133MB in memory space
epc_data <- read.csv("household_power_consumption.txt", header = T, sep = ";", colClasses = c(rep("character", 9)))

## Convert column "Date" to Date class
## Select rows where dates are 01/02/2007 or 02/02/2007 and store in epc_data1
epc_data$Date <- as.Date(epc_data$Date, format = "%d/%m/%Y")
epc_data1 <- epc_data[(epc_data$Date == "2007-02-01" | epc_data$Date == "2007-02-02"), ]

## PLOT 4 - Show 4 plots at the same canvas
## Histogram generated at Plot 1 - Global Active Power (1st line, 1st column)
## Voltage x DateTime (not done in previous plots) (1st line, 2nd column)
## Graphic generated at Plot 3 - Sub Metering 1, 2 and 3 by Weekdays (2nd line, 1st column)
## Global Reactive Power x DateTime (not done in previous plots) (2nd line, 2nd column)

## Merge 'Date' and 'Time' columns to determine the x-axis distribution in plot
epc_data1$Time <- paste(epc_data1$Date, " ", epc_data1$Time)

## Openning .png file to save the histogram, file 'plot4.png' at 480 x 480 pixel resolution
## Plotting 4 graphics as described above
png(filename = "plot4.png", width = 480, height = 480, units = "px")

## Set the canvas to show 4 graphics in 2 rows and 2 columns
par(mfrow = c(2,2))

## Graphic 1
plot(strptime(epc_data1$Time, format = "%Y-%m-%d %H:%M:%S"), epc_data1$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power")

## Graphic 2
plot(strptime(epc_data1$Time, format = "%Y-%m-%d %H:%M:%S"), epc_data1$Voltage, 
     type = "l",
     xlab = "DateTime",
     ylab = "Voltage")

## Graphic 3
plot(strptime(epc_data1$Time, format = "%Y-%m-%d %H:%M:%S"), epc_data1$Sub_metering_1, 
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")
lines(strptime(epc_data1$Time, format = "%Y-%m-%d %H:%M:%S"), epc_data1$Sub_metering_2, col = "red")
lines(strptime(epc_data1$Time, format = "%Y-%m-%d %H:%M:%S"), epc_data1$Sub_metering_3, col = "blue")
legend("topright", c("Sub metering 1", "Sub metering 2", "Sub metering 3"), 
       lty = c(1, 1, 1), 
       lwd = c(2, 2, 2),
       col = c("black", "red", "blue"),
       bty = "n")

## Graphic 4
plot(strptime(epc_data1$Time, format = "%Y-%m-%d %H:%M:%S"), epc_data1$Global_reactive_power, 
     type = "l",
     xlab = "DateTime",
     ylab = "Global reactive power")

## Close output file
dev.off()
