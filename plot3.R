# subsetting power consumption data
setwd("C:/Users/user/Documents/COURSERA/data")

powcomp <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?",                       nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
subpow <- subset(powcomp, Date %in% c("1/2/2007","2/2/2007"))

#Transforming the Date and Time vars 
subpow$Date <- as.Date(subpow$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(subpow$Date), subpow$Time)
subpow$Datetime <- as.POSIXct(datetime)

#plotting
with(subpow, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#export to PNG
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()