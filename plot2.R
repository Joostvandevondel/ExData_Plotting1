# read data
filenameR <- "readdata.R"
if (!filenameR %in% list.files()) {
  stop("The R file with function to read data '", filenameR, "' is not in working directory", call. = FALSE)
}
source('readdata.R')
data <- readdata()
# open file
png(filename = "plot2.png", 
    width = 480, height = 480,
    units = "px", bg = "transparent")
# create graph
plot(data$DateTime, data$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
#close file
dev.off()