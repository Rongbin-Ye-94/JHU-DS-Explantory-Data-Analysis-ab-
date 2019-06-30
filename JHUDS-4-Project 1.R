#Course Project 1

FileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
Dest_1 <- "Elec_UCI.zip"

if(!file.exists(Dest_1)){download.file(FileUrl,destfile = Dest_1, method = "curl")}
if(file.exists(Dest_1)){unzip(Dest_1)}
library(grDevices)

#loading data

data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_1 <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))

#plot 1
data_1$Date <- as.Date(data_1$Date, format="%d/%m/%Y")

hist(data_1$Global_active_power, col = "red", breaks = 50, main = "Global Active Power(kilowatts)", ylim = c(0,1200))
dev.copy(png, file="plot1.png", height=480, width=480)

dev.off()

#plot 2
datetime <- paste(as.Date(data_1$Date), data_1$Time)
data_1$Datetime <- as.POSIXct(datetime)

plot(data_1$Datetime, data_1$Global_active_power, xlab = "date", ylab = "Global Active Power(kilowatts)", type = "l")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

#plot 3]
with(data_1, 
     {plot(data_1$Datetime, data_1$Sub_metering_1, col = "black", xlab = "", ylab = "Energy Sub Metering)", type = "l")
     lines(Sub_metering_2~Datetime, col ="red") 
     lines(Sub_metering_3~Datetime, col = "blue")
     legend("topright", col = c("black","red","blue"), lty = 1, lwd = 2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
     })
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

#plot 4
par(mfcol = c(2,2))
"Subgraph1"
plot(data_1$Datetime, data_1$Global_active_power, xlab = "date", ylab = "Global Active Power(kilowatts)", type = "l")
"Subgraph2"
with(data_1, 
     {plot(data_1$Sub_metering_1~data_1$Datetime, col = "black", xlab = "", ylab = "Energy Sub Metering", type = "l")
       lines(Sub_metering_2~Datetime, col ="red") 
       lines(Sub_metering_3~Datetime, col = "blue")
       legend("topright", col = c("black","red","blue"), lty = 1, lwd = 2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
     })
"Subgraph3"
plot(data_1$Voltage~data_1$Datetime, type = "l", xlab = "datetime", ylab = "Voltage")
"Subgraph4"
plot(data_1$Global_reactive_power~data_1$Datetime, type = "l", xlab = "datetime", ylab = "Global Reactive Power")
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()