# read data
filenameR <- "readdata.R"
if (!filenameR %in% list.files()) {
  stop("The R file with function to read data '", filenameR, "' is not in working directory", call. = FALSE)
}
source('readdata.R')
data <- readdata()
# open file
png(filename = "plot4.png", 
    width = 480, height = 480,
    units = "px", bg = "transparent")
# create frame for graphs
par(mfrow = c(2, 2))
# Top left
plot(data$DateTime, data$Global_active_power, 
     type = "l",
     xlab = "datetime", ylab = "Global Active Power")
# Top right
plot(data$DateTime, data$Voltage,
     type = "l",
     xlab = "datetime", ylab = "Voltage")
# Bottom left
plot(data$DateTime, data$Sub_metering_1, 
     type = "l",
     col = "black",
     xlab = "datetime", ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
# Remove the border of legend here.
legend("topright", 
       bty = "n",
       col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1)
# Bottom right
plot(data$DateTime, data$Global_reactive_power, 
     type = "l",
     col = "black",
     xlab = "datetime", ylab = "Global_reactive_power")
     
# close file
dev.off()