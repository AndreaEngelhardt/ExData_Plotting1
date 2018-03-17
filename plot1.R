# read data from current folder
epcdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?",
                      colClasses = c("character", "character", "numeric", "numeric", "numeric",
                                     "numeric", "numeric", "numeric", "numeric"))

# select all rows for dates 2007-02-01, 2007-02-02
epcsubdata <- subset(epcdata, Date == "1/2/2007" | Date == "2/2/2007")

# open png device
png(filename = "plot1.png", width =480, height = 480)

# plot histogramm
hist(epcsubdata$Global_active_power, main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", col = "red", ylim = c(0,1200))

# close device
dev.off()