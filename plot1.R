#Pull in data
energy_data <- read.table(file="household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?" )
energy_data$Date <- as.Date(energy_data$Date, format='%d/%m/%Y')
energy_data$dateTime <- as.POSIXct(paste(energy_data$Date, energy_data$Time), format="%Y-%m-%d %H:%M:%S")
energy_data<- subset(energy_data, Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))

#Plot 1
png(file = "plot1.png", bg = "white", width=480, height=480)
hist(energy_data$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")
dev.off()