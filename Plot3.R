FileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
Dest_1 <- "Elec_UCI.zip"

if(!file.exists(Dest_1)){download.file(FileUrl,destfile = Dest_1, method = "curl")}
if(file.exists(Dest_1)){unzip(Dest_1)}
library(grDevices)

#loading data

data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_1 <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))
data_1$Date <- as.Date(data_1$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data_1$Date), data_1$Time)
data_1$Datetime <- as.POSIXct(datetime)

#plot 3
png("plot 3.png", width=480, height=480)
with(data_1, 
     {plot(data_1$Datetime, data_1$Sub_metering_1, col = "black", xlab = "", ylab = "Energy Sub Metering)", type = "l")
       lines(Sub_metering_2~Datetime, col ="red") 
       lines(Sub_metering_3~Datetime, col = "blue")
       legend("topright", col = c("black","red","blue"), lty = 1, lwd = 2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
     })
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()