# This code produces four plots for:
# Global Active Power vs DateTime
# Voltage vs DateTime
# Energy sub metering vs DateTime
# Global Reactive Power vs DateTime

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

# Convert columns to numeric
data[, 3] <- as.numeric(data[, 3])
data[, 4] <- as.numeric(data[, 4])
data[, 5] <- as.numeric(data[, 5])
data[, 6] <- as.numeric(data[, 6])
data[, 7] <- as.numeric(data[, 7])
data[, 8] <- as.numeric(data[, 8])
data[, 9] <- as.numeric(data[, 9])

# Create plot
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
with(data, {
  plot(DateTime, Global_active_power, type = "l",
       xlab = " ", ylab = "Global Active Power")
  plot(DateTime, Voltage, type = "l", xlab = "datetime", 
       ylab = "Voltage")

  plot(DateTime, Sub_metering_1, type = "l", 
       ylab = "Energy sub metering")
  points(DateTime, Sub_metering_2, type = "l", 
         col = "red")
  points(DateTime, Sub_metering_3, type = "l", 
         col = "blue")
  legend("topright", col = c("black", "red", "blue"), 
         legend = c("Sub_metering_1", "Sub_metering_2", 
                    "Sub_metering_3"), lwd = 1, 
         cex = 0.95, bty = "n")
  plot(DateTime, Global_reactive_power, type = "l", 
       xlab = "datetime", ylab = "Global_reactive_power")
})
dev.off()
