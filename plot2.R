#Set working directory to preferred location
setwd("C:/Users/jmetca1/Desktop/Ad Hoc/Data Science Certification/Exploratory Analysis/Week1_Project")

#Download data from the internet
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
              destfile="./exdata_data_household_power_consumption.zip")

#Unzip the data from the downloaded zip file
unzip("exdata_data_household_power_consumption.zip")

#Read the data (reading all lines)
epc<-read.table("household_power_consumption.txt", header =TRUE, sep=";", stringsAsFactors=FALSE)

#Create the subset of data actually needed for the assignment
epc_subset<-subset(epc, Date == "1/2/2007" | Date=="2/2/2007")

#Load lubridate package so I can use it to build usable date/time fields
library(lubridate)
epc_subset$Date_Time<-with(epc_subset, dmy(Date) + hms(Time))

#Set global parameter for number of plots per row, column.  Setting equal to 1
par(mfrow=c(1,1))

# plot 2
png(filename="Plot_2.png", width = 480, height =480)
plot((epc_subset$Date_Time),as.numeric(epc_subset$Global_active_power), type="l", ylab ="Global Active Power (kilowatts)", xlab="")
dev.off()