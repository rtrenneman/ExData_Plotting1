# This code produces the plot for Global Active
# Power vs DateTime

# Read the data
data <- read.table("household_power_consumption.txt",
                   head = TRUE, sep = ";",
                   colClasses = "character")

# Convert the first column to Date format
data[, 1] <- as.Date(data[, 1], "%d/%m/%Y")

# Subset data for the dates 02/01/2007 and 02/02/2007
data <- data[data$Date %in% as.Date(c("2007-02-01", "2007-02-02")), ]

# Add column for DateTime
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), 
                             format = "%Y-%m-%d %H:%M:%S")

# Convert Global_active_power column to numeric
data[, 3] <- as.numeric(data[, 3])

# Create plot
png("plot2.png", width = 480, height = 480)
plot(data$DateTime, data[, 3], type = "l", xlab = " ",
     ylab = "Global Active Power (kilowatts)")
dev.off()
