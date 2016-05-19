epc_data <- read.delim("./data/exdata_data_household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";");

epc_data$Date <- as.Date(epc_data$Date, "%d/%m/%Y")
epc_data$Global_active_power <- as.numeric(levels(epc_data$Global_active_power))[epc_data$Global_active_power]

png(filename = "Plot1.png", width = 480, height = 480, units = "px")
hist(subset(epc_data, epc_data$Date %in% as.Date(c("2007-02-01","2007-02-02")), Global_active_power)$Global_active_power, col = "red", main = " Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", yaxt = 'n')
axis(2, at = seq(0, 1200, by = 200), las=1)
dev.off()
