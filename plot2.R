# read data from current folder
epcdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?",
                      colClasses = c("character", "character", "numeric", "numeric", "numeric",
                                     "numeric", "numeric", "numeric", "numeric"))

# select all rows for dates 2007-02-01, 2007-02-02
epcsubdata <- subset(epcdata, Date == "1/2/2007" | Date == "2/2/2007")

Sys.setlocale("LC_ALL", "English") # to  have the weekdays in english

# open png device
png(filename = "plot2.png", width =480, height = 480)

plot(strptime(paste(epcsubdata$Date, epcsubdata$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S"),
     epcsubdata$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

# close device
dev.off()