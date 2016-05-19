epc_data <- read.delim("./data/exdata_data_household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";");

epc_data$Date <- as.Date(epc_data$Date, "%d/%m/%Y")

epc_data$Sub_metering_1 <- as.numeric(levels(epc_data$Sub_metering_1))[epc_data$Sub_metering_1]
epc_data$Sub_metering_2 <- as.numeric(levels(epc_data$Sub_metering_2))[epc_data$Sub_metering_2]

epc_data_subset <- subset(epc_data, epc_data$Date %in% as.Date(c("2007-02-01","2007-02-02")))


time <- as.character(paste(epc_data_subset$Date, epc_data_subset$Time, sep = " "))
time_format <- strptime(time, "%Y-%m-%d %H:%M:%S")

png(filename = "Plot3.png", width = 480, height = 480, units = "px")
plot(time_format,epc_data_subset$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(time_format,epc_data_subset$Sub_metering_1, col = "black")
lines(time_format,epc_data_subset$Sub_metering_2, col = "red")
lines(time_format,epc_data_subset$Sub_metering_3, col = "blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1,1,1))
dev.off()

