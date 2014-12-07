# note that the default white background was used for the plot, to match the color seen on the course project web page
# this also could have been transparent, to match the images already in the git repository

# read semicolon delimited file
# this assumes that the input file is in the same directory as this script
energy_all = read.table("household_power_consumption.txt", sep=";", na.strings = c("?"), stringsAsFactors = FALSE, header = TRUE)
energy = subset(energy_all, Date == "1/2/2007" | Date == "2/2/2007")

# create new POSIX date field named "Date_time" to represent the date/time, using the "Date" and "Time" fields
energy$Date_time = dmy_hms(paste(energy$Date, energy$Time, sep = ":"))

# open png device
png(filename = "plot2.png")

# plot a line graph with the specified labels
plot(energy$Date_time, energy$Global_active_power, type = "l", xlab = "", ylab = "Global active power (kilowatts)")

# close device, write to file
dev.off()