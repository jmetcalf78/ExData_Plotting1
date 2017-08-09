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

# plot 4
png(filename="Plot_4.png", width = 480, height =480)
par(mfrow=c(2,2))
#1 
plot((epc_subset$Date_Time),as.numeric(epc_subset$Global_active_power), type="l", ylab ="Global Active Power (kilowatts)", xlab="")
#2
plot((epc_subset$Date_Time),as.numeric(epc_subset$Voltage), type="l", ylab ="Voltage", xlab="datetime")
#3
plot((epc_subset$Date_Time),as.numeric(epc_subset$Sub_metering_1), type="n", ylab ="Energy sub metering", xlab="")
lines((epc_subset$Date_Time),as.numeric(epc_subset$Sub_metering_1), type = "l",col = "black")
lines((epc_subset$Date_Time),as.numeric(epc_subset$Sub_metering_2), type = "l",col = "red")
lines((epc_subset$Date_Time),as.numeric(epc_subset$Sub_metering_3), type = "l",col = "blue")
legend("topright", col=c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, bty="n")
#4
plot((epc_subset$Date_Time),as.numeric(epc_subset$Global_reactive_power), type="l", ylab="Global_reactive_power",xlab="datetime")
dev.off()
