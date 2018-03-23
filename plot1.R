# subsetting power consumption data
setwd("C:/Users/user/Documents/COURSERA/data")
powcomp <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
subpow <- subset(powcomp, Date %in% c("1/2/2007","2/2/2007"))

#Transforming the Date and Time vars 
subpow$Date <- as.Date(subpow$Date, format="%d/%m/%Y")

#plotting
hist(subpow$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

title(main="Global Active Power")

#export to PNG
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()