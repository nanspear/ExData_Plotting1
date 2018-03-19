#Set working directory
setwd("C:/RStudio/Coursera/Exploratory Data Analysis/Data Files")

#Read file
hhpower <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
head(hhpower)

#New DateTime Column
hhpower$DateTime <- paste(hhpower$Date,hhpower$Time)
strptime(hhpower$DateTime, "%d/%m/%y %H:%M:%S")
head(hhpower)

#Create Data Subset
hhfeb <- subset(hhpower, Date %in% c("1/2/2007", "2/2/2007"))

#Plot 1
hist(hhfeb$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)"
     ,ylab = "Frequency", col = "red")

#Plot into a png file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()