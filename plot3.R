## First step consists of downloading the dataset and saving it to the working directory

library(dplyr)

filename <- "Coursera_ProjectWeek1_Course4"

if(!file.exists(filename)){
        fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(fileURL, filename, method = "curl")
}

if (!file.exists("exdata_data_household_power_consumption")){
        unzip(filename)
}

## Reading the dataset

dataset <- "household_power_consumption.txt"
data <- read.table(dataset, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

## Subsetting the data for the required dates (2007-02-01 until 2007-02-02)

Data_TwoDays <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

## Plotting the Data, these steps are different for every plot.

library(lubridate)
datetime <- strptime(paste(Data_TwoDays$Date, Data_TwoDays$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(Data_TwoDays$Global_active_power)
Sub_metering_1 <- as.numeric(Data_TwoDays$Sub_metering_1)
Sub_metering_2 <- as.numeric(Data_TwoDays$Sub_metering_2)
Sub_metering_3 <- as.numeric(Data_TwoDays$Sub_metering_3)       
png("plot3.png")
plot(datetime, Sub_metering_1, type="l", xlab="", ylab="Energy Submetering")
lines(datetime, Sub_metering_2, type="l", col="red")
lines(datetime, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

## Turning off the Graphic Device

dev.off()