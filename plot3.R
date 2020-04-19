dt <- read.table("C:/Users/Mohsin Ali/Desktop/Work/Data Sciecne/NoteBooks/R/Datasets/household_power_consumption.txt", header = TRUE, sep = ";", dec = ".")

subdt <- dt[dt$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(subdt$Date, subdt$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

sub_metering1 <- as.numeric(subdt$Sub_metering_1)
sub_metering2 <- as.numeric(subdt$Sub_metering_2)
sub_metering3 <- as.numeric(subdt$Sub_metering_3)


png("plot3.png", width=480, height=480)
plot(datetime, sub_metering1, type="l", xlab = "", ylab="Energy Submetering")
lines(datetime, sub_metering2, type="l", col = "red")
lines(datetime, sub_metering3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 2.5, col = c("black", "red", "blue"))
dev.off()


