# Download ZIP File from UC Irvine Machine Learning Repository
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "household.zip")
unzip("household.zip")
house <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)

# Changing Date format
house$Date <- strptime(house$Date, "%d/%m/%Y")
housepower <- subset(house, Date == "2007-02-01" | Date == "2007-02-02")
housepower$Global_active_power <- as.numeric(housepower$Global_active_power)

# Open a PNG file
png(filename="plot1.png", width=480, height=480, units="px", pointsize=12, bg="white")

# Picture 1
hist(housepower$Global_active_power, col="red", main = "Global Active Power", xlab="Global Active Power (kilowatts)")

# Closing a PNG file
dev.off ()

