library(dplyr)
library(ggplot2)
library(scales)
dt <- read.table("C:/Users/Mohsin Ali/Desktop/Work/Data Sciecne/NoteBooks/R/Datasets/household_power_consumption.txt", header = TRUE, sep = ";")

dt2 <- dt%>%
  select(Date:Sub_metering_3)%>%
  filter(Date %in% c("1/2/2007", "2/2/2007"))

dt2$Date <- as.Date(dt2$Date)
dt2$Global_active_power <- as.numeric(dt2$Global_active_power)


plot1 <- ggplot(data = dt2, aes(x = Global_active_power))+
  geom_histogram(fill = "red")+
  xlab("Global Active Power (kilowatts)")+
  ylab("Frequency")+
  labs(title = "Global Active Power")+
  theme(plot.title = element_text(hjust = 0.5))+
  scale_y_continuous(limits = c(0, 1200))

plot1

png("plot1.png", width=480, height=480)
print(plot1)
dev.off()
