# note that the default white background was used for the plot, to match the color seen on the course project web page
# this also could have been transparent, to match the images already in the git repository

# read semicolon delimited file
# this assumes that the input file is in the same directory as this script
energy_all = read.table("household_power_consumption.txt", sep=";", na.strings = c("?"), stringsAsFactors = FALSE, header = TRUE)
energy = subset(energy_all, Date == "1/2/2007" | Date == "2/2/2007")

# create new POSIX date field named Date_time to represent the date/time, using the Date and Time fields
energy$Date_time = dmy_hms(paste(energy$Date, energy$Time, sep = ":"))

# open png device
png(filename = "plot4.png")

par(mfrow = c(2, 2))
with(energy, {
  # top left graph, smaller version of plot2, with the y label modified
  plot(energy$Date_time, energy$Global_active_power, type = "l", xlab = "", ylab = "Global active power")

  # top right graph displays Date_time vs Voltage, and has an x axis label of "datetime"
  plot(energy$Date_time, energy$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

  # bottom left graph, smaller version of plot3, with no legend border
  plot(energy$Date_time, energy$Sub_metering_1, main = "", type = "l", xlab = "", ylab = "Energy sub metering")
  lines(energy$Date_time, energy$Sub_metering_2, col = "red")
  lines(energy$Date_time, energy$Sub_metering_3, col = "blue")
  legend("topright", lty = c(1, 1, 1), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"),
         bty = "n")

  # bottom right graph displays Date_time vs Global_reactive_power and has an x axis label of "datetime"
  plot(energy$Date_time, energy$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
})

# close device, write to file
dev.off()