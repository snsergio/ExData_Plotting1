## EDA Project 1
## Load Electric Power Consumption data from current directory - household_power_consumption.txt file
## 2+ million rows that require about 133MB in memory space
epc_data <- read.csv("household_power_consumption.txt", header = T, sep = ";", colClasses = c(rep("character", 9)))

## Convert column "Date" to Date class
## Select rows where dates are 01/02/2007 or 02/02/2007 and store in epc_data1
epc_data$Date <- as.Date(epc_data$Date, format = "%d/%m/%Y")
epc_data1 <- epc_data[(epc_data$Date == "2007-02-01" | epc_data$Date == "2007-02-02"), ]

## PLOT 1 - Global Active Power
## Openning .png file to save the histogram, file 'plot1.png' at 480 x 480 pixel resolution
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(as.numeric(epc_data1$Global_active_power), breaks = 12,
     main = paste("Global Active Power"), 
     xlab = "Global Active Power (kilowatts)", 
     col = "red")
dev.off()
