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

GlobalActivePower <- as.numeric(Data_TwoDays$Global_active_power)
png("plot1.png")
hist(GlobalActivePower, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

## Turning off the Graphic Device

dev.off()