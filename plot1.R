# read data
filenameR <- "readdata.R"
if (!filenameR %in% list.files()) {
  stop("The R file with function to read data '", filenameR, "' is not in working directory", call. = FALSE)
}
source('readdata.R')
data <- readdata()
# open file
png(filename = "plot1.png", 
    width = 480, height = 480, 
    units = "px", bg = "transparent")
# create graph
hist(data$Global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     breaks = 12, ylim = c(0, 1200))
# close file
dev.off()