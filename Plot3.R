#Set Working Directory
setwd("C:/RStudio/Coursera/Exploratory Data Analysis/Data Files")

#Read File
hhpower <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?",
                      check.names = FALSE, stringsAsFactors = FALSE, comment.char = "", quote = '\"')

#Create Data Subset and DateTime Column
hhfeb <- subset(hhpower, Date %in% c("1/2/2007", "2/2/2007"))
hhfeb$Date <- as.Date(hhfeb$Date, format = "%d/%m/%y")
DateTime <-paste(as.Date(hhfeb$Date),hhfeb$Time)
hhfeb$DateTime <- as.POSIXct(DateTime)

#Plot 3
with(hhfeb, {
      plot(Sub_metering_1~DateTime, type = "l",
           ylab = "Energy sub metering", xlab = "")
      lines(Sub_metering_2~DateTime, col="Red")
      lines(Sub_metering_3~DateTime, col="Blue")
            
})
legend("topright", col = c("black","red","blue"), lty = 1, lwd = 2, xjust = 1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Plot into a png file
dev.copy(png, file = "plot3.png",height = 480, width = 480)
dev.off()