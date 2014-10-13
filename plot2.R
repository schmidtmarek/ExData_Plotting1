
setwd("c:/Users/Marek/Desktop/R/")
md <- read.csv("household_power_consumption.txt", sep=";")
md$Date <- as.Date(strptime(md$Date,"%d/%m/%Y"))
md$Global_active_power <- as.numeric(as.character(md$Global_active_power))
md1 <- md[md$Date == as.Date(strptime("2007-02-01", "%Y-%m-%d")) | 
                  md$Date == as.Date(strptime("2007-02-02", "%Y-%m-%d")),]

md1$Date <- strptime(paste(md1$Date, md1$Time, sep = " "),"%Y-%m-%d %H:%M:%S")

#plot(md1$Date, md1$Global_active_power, "l", ylab="Global Active Power (kilowatts)", xlab="")

mf <- png(filename="plot2.png", width = 480, height = 480)
with (mf, plot(md1$Date, md1$Global_active_power, "l", ylab="Global Active Power (kilowatts)", xlab=""))
dev.off()
