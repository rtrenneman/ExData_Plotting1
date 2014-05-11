# This code produces the plot for Energy sub
# metering vs DateTime

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

# Convert Energy sub metering columns to numeric
data[, 7] <- as.numeric(data[, 7])
data[, 8] <- as.numeric(data[, 8])
data[, 9] <- as.numeric(data[, 9])

# Create plot
png("plot3.png", width = 480, height = 480)
plot(data$DateTime, data[, 3], type = "l", xlab = " ",
     ylab = "Global Active Power (kilowatts)")
with(data, plot(DateTime, Sub_metering_1, type = "l",
                ylab = "Energy sub metering"))
with(data, points(DateTime, Sub_metering_2, type = "l",
                  col = "red"))
with(data, points(DateTime, Sub_metering_3, type = "l",
                  col = "blue"))
legend("topright", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", 
                  "Sub_metering_3"), cex = 0.95, lwd = 1)
dev.off()
