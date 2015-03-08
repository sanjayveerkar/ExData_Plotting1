#Pull in data
energy_data <- read.table(file="household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?" )
energy_data$Date <- as.Date(energy_data$Date, format='%d/%m/%Y')
energy_data$dateTime <- as.POSIXct(paste(energy_data$Date, energy_data$Time), format="%Y-%m-%d %H:%M:%S")
energy_data<- subset(energy_data, Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))

#Plot 2
png(file = "plot2.png", bg = "white", width=480, height=480)
plot(energy_data$dateTime, energy_data$Global_active_power, col="black", type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()