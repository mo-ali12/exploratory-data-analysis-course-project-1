dt <- read.table("C:/Users/Mohsin Ali/Desktop/Work/Data Sciecne/NoteBooks/R/Datasets/household_power_consumption.txt", header = TRUE, sep = ";", dec = ".")

#Subsetting

subdt <- dt[dt$Date %in% c("1/2/2007","2/2/2007") ,]

#type conversions

sub_metering1 <- as.numeric(subdt$Sub_metering_1)
sub_metering2 <- as.numeric(subdt$Sub_metering_2)
sub_metering3 <- as.numeric(subdt$Sub_metering_3)
datetime <- strptime(paste(subdt$Date, subdt$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(subdt$Global_active_power)
globalReactivePower <- as.numeric(subdt$Global_reactive_power)

#creating 2 by 2 panel and saving file.

png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))

#plot on 1,1
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#plot on 1,2
plot(datetime, subdt$Voltage, type="l", xlab="datetime", ylab="Voltage")

#plot on 2,1
plot(datetime, sub_metering1, type="l", xlab = "", ylab="Energy Submetering")
lines(datetime, sub_metering2, type="l", col = "red")
lines(datetime, sub_metering3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 2.5, col = c("black", "red", "blue"))

#plot on 2,2
plot(datetime, globalReactivePower,  type="l", xlab="datetime", ylab="Global_reactive_power" )


dev.off()

