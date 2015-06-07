download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "household.zip")
unzip("household.zip")
house <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
str(house)
house$Date <- strptime(house$Date, "%d/%m/%Y")
housepower <- subset(house, Date == "2007-02-01" | Date == "2007-02-02")
housepower$Global_active_power <- as.numeric(housepower$Global_active_power)
plot(housepower$Global_active_power, ylab="Global Active Power (kilowatts)", xaxt="n", xlab="", type="l")



axis(1, at=c(1,1441,2880), labels=c("Thu","Fri","Sat"))
dev.copy(png,filename="plot3.png")
dev.off ()
