#Set working directory
setwd("C:/RStudio/Coursera/Exploratory Data Analysis/Data Files")

#Read File
hhpower <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?",
                      check.names = FALSE, stringsAsFactors = FALSE, comment.char = "", quote = '\"')

#Create Data Subset and DateTime Column
hhfeb <- subset(hhpower, Date %in% c("1/2/2007", "2/2/2007"))
hhfeb$Date <- as.Date(hhfeb$Date, format = "%d/%m/%y")
DateTime <-paste(as.Date(hhfeb$Date),hhfeb$Time)
hhfeb$DateTime <- as.POSIXct(DateTime)

#Plot 2
with(hhfeb, {
      plot(Global_active_power~DateTime, type = "l",
           ylab = "Global Active Power (kilowatts", xlab = "")
})

#Plot into a png file
dev.copy(png, file = "plot2.png",height = 480, width = 480)
dev.off()
