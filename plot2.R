## 08-20-2020
## Exploratory Data Analysis: Week 1: Course Project 1, Plot 2

## set the current working directory
setwd("G:\\ZZZ_New\\Coursera_DataScience_Specialization\\datasciencecoursera\\ExData_Plotting1")


## read the data file
dataName <- "household_power_consumption.zip"

#### If data file doesn't exist, download it. 
if(!file.exists(dataName)){
      dataURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
      download.file(dataURL, dataName, method = "curl")
      
} else {
      "Downloaded"
}

## check whether the unzipped file exists. If not, unzip the zipped data
if (!file.exists("household_power_consumption")) {
      unzip(dataName)
} else {
      print("Found")
}

## load the data file with header = TRUE, and separated with ";"
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
dim(data)
head(data)
names(data)
View(data)
str(data)

## get the subset of the required data
unique(data$Date)  ## see the unique values of Date
data_plot2 <- subset(data, data$Date=="1/2/2007"|data$Date=="2/2/2007" )
unique(data_plot2$Date) ## check the results

## plot: how household energy usage varies over a 2-day period in February, 2007
#### change character type to numeric type
data_plot2$Global_active_power <- as.numeric(data_plot2$Global_active_power) 
class(data_plot2$Global_active_power)

## convert date and time variables
data_plot2$date_time <- strptime(paste(data_plot2$Date, " ", data_plot2$Time), "%d/%m/%Y %H:%M:%S")
data_plot2$date_time <- as.POSIXct(data_plot2$date_time)

head(data_plot2)

plot(data_plot2$date_time, data_plot2$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

## save png
dev.copy(png, file = "plot2.png", width=480, height=480)

dev.off() ## close graphic device


