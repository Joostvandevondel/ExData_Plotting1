readdata <- function() {
  filename <- "household_power_consumption.txt"
  if (!filename %in% list.files()) {
    stop("The data file '", filename, "' is not in working directory", call. = FALSE)
  }
dataclasses <- c('character', 'character',
                 'numeric', 'numeric', 'numeric', 'numeric',
                 'numeric', 'numeric', 'numeric')
rawdata <- read.table(filename, 
                      header = TRUE, 
                      sep = ";",
                      colClasses = dataclasses,
                      na.strings = "?")

data <- subset(rawdata, Date == '1/2/2007' | Date == '2/2/2007')

data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")

data

}