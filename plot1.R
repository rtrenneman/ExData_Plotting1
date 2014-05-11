# This code produces the historgram for Global
# Active Power for the dates 02/01/2007 and 02/02/2007

# Read the data
data <- read.table("household_power_consumption.txt",
                   head = TRUE, sep = ";",
                   colClasses = "character")

# Convert the first column to Date format
data[, 1] <- as.Date(data[, 1], "%d/%m/%Y")

# Subset data for the dates 02/01/2007 and 02/02/2007
data <- data[data$Date %in% as.Date(c("2007-02-01", "2007-02-02")), ]

# Convert Global_active_power column to numeric
data[, 3] <- as.numeric(data[, 3])

# Create plot
png("plot1.png", width = 480, height = 480)
hist(data[, 3], col = "red",
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency")
dev.off()
