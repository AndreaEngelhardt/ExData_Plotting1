# read data from current folder
epcdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?",
                      colClasses = c("character", "character", "numeric", "numeric", "numeric",
                                     "numeric", "numeric", "numeric", "numeric"))

# select all rows for dates 2007-02-01, 2007-02-02
epcsubdata <- subset(epcdata, Date == "1/2/2007" | Date == "2/2/2007")

Sys.setlocale("LC_ALL", "English") # to  have the weekdays in english

# open png device
png(filename = "plot3.png", width =480, height = 480)

# values for x-Axis
xdatetime <-strptime(paste(epcsubdata$Date, epcsubdata$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

# start plotting with Sub_metering_1
plot(xdatetime, epcsubdata$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")

# add Sub_metering_2 to plot
points(xdatetime, epcsubdata$Sub_metering_2, type = "l", col = "red")

# add Sub_metering_3 to plot
points(xdatetime, epcsubdata$Sub_metering_3, type = "l", col = "blue")

# add legend to plot
legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# close device
dev.off()