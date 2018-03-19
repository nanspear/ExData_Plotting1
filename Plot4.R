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
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))

with(hhfeb, {
      plot(Global_active_power~DateTime, type = "l",
                  xlab = "", ylab = "Global Active Power", lty = 1, lwd = 2)
})

with(hhfeb, {
      plot(Voltage~DateTime, type = "l",
           xlab = "datetime", ylab = "Voltage", lty = 1, lwd = 2)
})

with(hhfeb, {
      plot(Sub_metering_1~DateTime, type = "l",
           ylab = "Energy sub metering", xlab = "")
      lines(Sub_metering_2~DateTime, col="Red")
      lines(Sub_metering_3~DateTime, col="Blue")
      
})
legend("topright", col = c("black","red","blue"), lty = 1, lwd = 2, bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(hhfeb, {
      plot(Global_reactive_power~DateTime, type = "l",
                  xlab = "datetime", ylab = "Global_reactive_power", lty = 1, lwd = 1)
})

#Plot into a png file
dev.copy(png, file = "plot4.png",height = 480, width = 480)
dev.off()
