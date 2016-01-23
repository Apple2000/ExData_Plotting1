# Load data
input_data <- read.csv("household_power_consumption.txt",header = TRUE,sep = ";")
# Change Date column to Date
input_data$Date<-as.Date(input_data$Date,format="%d/%m/%Y")
# Get a subset of data
date_from <- as.Date("2007-02-01", format="%Y-%m-%d")
date_to <- as.Date("2007-02-02", format="%Y-%m-%d")
used_data <- subset(input_data, Date %in% range(date_from, date_to))
# Get Sub_metering_1/2/3
sub_1 <- as.numeric(as.character(used_data$Sub_metering_1))
sub_2 <- as.numeric(as.character(used_data$Sub_metering_2))
sub_3 <- as.numeric(as.character(used_data$Sub_metering_3))
# Plot and save to png
datetime <- as.POSIXct(paste(used_data$Date, used_data$Time),format="%Y-%m-%d %H:%M:%S")
plot(datetime,sub_1,type = "n", ylab="Energy sub metering")
lines(datetime,sub_1,col="black")
lines(datetime,sub_2,col="red")
lines(datetime,sub_3,col="blue")
legend("topright", lty = c(1,1,1), col=c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       cex=0.6)
dev.copy(png, "plot3.png")
dev.off()

