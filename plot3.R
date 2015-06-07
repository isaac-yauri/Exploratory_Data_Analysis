# Download ZIP File from UC Irvine Machine Learning Repository
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "household.zip")
unzip("household.zip")
house <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)

# Changing Date format
house$Date <- strptime(house$Date, "%d/%m/%Y")
housepower <- subset(house, Date == "2007-02-01" | Date == "2007-02-02")
housepower$Global_active_power <- as.numeric(housepower$Global_active_power)

# Open a PNG file
png(filename="plot3.png", width=480, height=480, units="px", pointsize=12, bg="white")

# Plot picture 3
plot(housepower$Sub_metering_1, ylab="Energy sub metering", xaxt="n", xlab="", type="l")
lines(housepower$Sub_metering_2, col="red" )
lines(housepower$Sub_metering_3, col="blue")
legend("topright", legend=names(housepower[7:9]), lty= 1,col=c('black','red','blue'))
axis(1, at=c(1,1441,2880), labels=c("Thu","Fri","Sat"))

# Closing a PNG file
dev.off ()

