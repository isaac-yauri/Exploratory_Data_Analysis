download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "household.zip")
unzip("household.zip")
house <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
str(house)
house$Date <- strptime(house$Date, "%d/%m/%Y")
housepower <- subset(house, Date == "2007-02-01" | Date == "2007-02-02")
housepower$Global_active_power <- as.numeric(housepower$Global_active_power)
housepower$Date
hist(housepower$Global_active_power, col="red", main = "Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png,filename="plot1.png");
dev.off ();
