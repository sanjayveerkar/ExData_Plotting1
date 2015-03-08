#Pull in data
energy_data <- read.table(file="household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?" )
energy_data$Date <- as.Date(energy_data$Date, format='%d/%m/%Y')
energy_data$dateTime <- as.POSIXct(paste(energy_data$Date, energy_data$Time), format="%Y-%m-%d %H:%M:%S")
energy_data<- subset(energy_data, Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))

#Plot 3
png(file = "plot3.png", bg = "white", width=480, height=480)
g_range<- range(energy_data$Sub_metering_1, energy_data$Sub_metering_2, energy_data$Sub_metering_3)
plot(energy_data$dateTime, energy_data$Sub_metering_1, col="black", type="l", xlab="", ylab="Energy sub metering", ylim=g_range)
lines(energy_data$dateTime, energy_data$Sub_metering_2, col="red", type="l")
lines(energy_data$dateTime, energy_data$Sub_metering_3, col="blue", type="l")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()