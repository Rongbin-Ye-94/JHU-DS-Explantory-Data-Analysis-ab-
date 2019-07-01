#Project 1 - Graph 1

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