# note that the default white background was used for the plot, to match the color seen on the course project web page
# this also could have been transparent, to match the images already in the git repository

# read semicolon delimited file
# this assumes that the input file is in the same directory as this script
energy_all = read.table("household_power_consumption.txt", sep=";", na.strings = c("?"), stringsAsFactors = FALSE, header = TRUE)
energy = subset(energy_all, Date == "1/2/2007" | Date == "2/2/2007")

# open png device
png(filename = "plot1.png")

# display histogram with title, x axis label, and color specified
hist(energy$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

# close device, write to file
dev.off()