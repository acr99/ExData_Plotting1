epc_data <- read.delim("./data/exdata_data_household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";");

epc_data$Date <- as.Date(epc_data$Date, "%d/%m/%Y")
epc_data$Global_active_power <- as.numeric(levels(epc_data$Global_active_power))[epc_data$Global_active_power]

gap <- subset(epc_data, epc_data$Date %in% as.Date(c("2007-02-01","2007-02-02")), Global_active_power)$Global_active_power
time <- as.character(paste(subset(epc_data, epc_data$Date %in% as.Date(c("2007-02-01","2007-02-02")), Date)$Date, subset(epc_data, epc_data$Date %in% as.Date(c("2007-02-01","2007-02-02")), Time)$Time, sep = " "))
time_format <- strptime(time, "%Y-%m-%d %H:%M:%S")

png(filename = "Plot2.png", width = 480, height = 480, units = "px")
plot(time_format,gap, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(time_format,gap)
dev.off()