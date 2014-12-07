# plots the first plot for hw assignment
mydata = read.table("household_power_consumption.txt", header = TRUE, sep = ";")
str(mydata)


mydata$Date <- as.Date(mydata$Date, "%d/%m/%y")
mydata2 <- subset(mydata, mydata$Date == as.Date("2020-02-01") | mydata$Date == as.Date("2020-02-02"))
mydata2$Global_active_power <- as.numeric(mydata2$Global_active_power)
quartz()
with(mydata2, hist(Global_active_power/1000, main = "Global Active Power", xlab = "Global Active Power (kilowatts)"), col = "Red")

