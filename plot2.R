# Load data
input_data <- read.csv("household_power_consumption.txt",header = TRUE,sep = ";")
# Change Date column to Date
input_data$Date<-as.Date(input_data$Date,format="%d/%m/%Y")
# Get a subset of data
date_from <- as.Date("2007-02-01", format="%Y-%m-%d")
date_to <- as.Date("2007-02-02", format="%Y-%m-%d")
used_data <- subset(input_data, Date %in% range(date_from, date_to))
# Get Global Active Power and turn to numeric for plotting
global_active_power <- as.numeric(as.character(used_data$Global_active_power))
# Plot and save to png
datetime <- as.POSIXct(paste(used_data$Date, used_data$Time),format="%Y-%m-%d %H:%M:%S")
plot(x = datetime, y = global_active_power,type="l",
     ylab="Global Active Power (kilowatts)")
png(width = 480, height = 480)
dev.copy(png, "plot2.png")
dev.off()

