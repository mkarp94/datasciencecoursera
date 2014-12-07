# plots the first plot for hw assignment
mydata = read.table("household_power_consumption.txt", header = TRUE, sep = ";")
str(mydata)


mydata$Date <- as.Date(mydata$Date, "%d/%m/%y")
mydata2 <- subset(mydata, mydata$Date == as.Date("2020-02-01") | mydata$Date == as.Date("2020-02-02"))
mydata2$Global_active_power <- as.numeric(mydata2$Global_active_power)
library(chron)
mydata2$Time <- chron(times=mydata2$Time)

quartz()
with(mydata2, lines(y = Global_active_power/1000, x = Time, ylab = "Global Active Power (kilowatts)"))




