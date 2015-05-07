# read data
filenameR <- "readdata.R"
if (!filenameR %in% list.files()) {
  stop("The R file with function to read data '", filenameR, "' is not in working directory", call. = FALSE)
}
source('readdata.R')
data <- readdata()
# open file
png(filename = "plot3.png", 
    width = 480, height = 480,
    units = "px", bg = "transparent")
# create graph
plot(data$DateTime, data$Sub_metering_1, 
     type = "l",
     col = "black",
     xlab = "", ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", 
       col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1)
# close file
dev.off()