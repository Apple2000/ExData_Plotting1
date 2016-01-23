# Load data
input_data <- read.csv("household_power_consumption.txt",header = TRUE,sep = ";")
# Change Date column to Date
input_data$Date<-as.Date(input_data$Date,format="%d/%m/%Y")
# Get a subset of data
date_from <- as.Date("2007-02-01", format="%Y-%m-%d")
date_to <- as.Date("2007-02-02", format="%Y-%m-%d")
used_data <- subset(input_data, Date %in% range(date_from, date_to))
# Get all data
datetime <- as.POSIXct(paste(used_data$Date, used_data$Time),format="%Y-%m-%d %H:%M:%S")
global_active_power <- as.numeric(as.character(used_data$Global_active_power))
voltage <- as.numeric(as.character(used_data$Voltage))
sub_1 <- as.numeric(as.character(used_data$Sub_metering_1))
sub_2 <- as.numeric(as.character(used_data$Sub_metering_2))
sub_3 <- as.numeric(as.character(used_data$Sub_metering_3))
global_reactive_power <- as.numeric(as.character(used_data$Global_reactive_power))
# Plot data and save to png
curr_mar <- par("mar")
curr_cex <- par("cex")
par(mfrow = c(2,2))
par(mar = c(4,4,2,4))
par(cex = 0.6)
plot(x = datetime, y = global_active_power,type="l",
     ylab="Global Active Power",
     xlab = "")
plot(x = datetime, y = voltage, type="l",
     xlab = "datetime", ylab="Voltage")
plot(datetime,sub_1,type = "n", ylab="Energy sub metering", xlab="")
lines(datetime,sub_1,col="black")
lines(datetime,sub_2,col="red")
lines(datetime,sub_3,col="blue")
legend("topright", lty = c(1,1,1), col=c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       cex=0.6)
plot(x = datetime, y = global_reactive_power,type="l",
     xlab = "datetime",
     ylab="Global_reactive_power")
dev.copy(png, "plot4.png")
dev.off()

