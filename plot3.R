# note that the default white background was used for the plot, to match the color seen on the course project web page
# this also could have been transparent, to match the images already in the git repository

# read semicolon delimited file
# this assumes that the input file is in the same directory as this script
energy_all = read.table("household_power_consumption.txt", sep=";", na.strings = c("?"), stringsAsFactors = FALSE, header = TRUE)
energy = subset(energy_all, Date == "1/2/2007" | Date == "2/2/2007")

# create new POSIX date field named Date_time to represent the date/time, using the Date and Time fields
energy$Date_time = dmy_hms(paste(energy$Date, energy$Time, sep = ":"))

# open png device
png(filename = "plot3.png")

# create plot of Date_time vs Sub_metering_1, then add lines for Sub_metering_2 in red and Sub_metering_3 in blue
with(energy, plot(energy$Date_time, energy$Sub_metering_1, main = "", type = "l", xlab = "", ylab = "Energy sub metering"))
with(energy, lines(energy$Date_time, energy$Sub_metering_2, col = "red"))
with(energy, lines(energy$Date_time, energy$Sub_metering_3, col = "blue"))

# add legend to plot
legend("topright", lty = c(1, 1, 1), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"))

# close device, write to file
dev.off()