dt <- read.table("C:/Users/Mohsin Ali/Desktop/Work/Data Sciecne/NoteBooks/R/Datasets/household_power_consumption.txt", header = TRUE, sep = ";", dec = ".")

subdt <- dt[dt$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(subdt$Date, subdt$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

globalActivePower <- as.numeric(subdt$Global_active_power)

png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
