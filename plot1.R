
setwd("c:/Users/Marek/Desktop/R/")
md <- read.csv("household_power_consumption.txt", sep=";")
md$Date <- as.Date(strptime(md$Date,"%d/%m/%Y"))
md$Global_active_power <- as.numeric(as.character(md$Global_active_power))
md1 <- md[md$Date == as.Date(strptime("2007-02-01", "%Y-%m-%d")) | 
                  md$Date == as.Date(strptime("2007-02-02", "%Y-%m-%d")),]

hist(md1$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", 
     main="Global Active Power")

mf <- png(filename="plot1.png", width = 480, height = 480)
with (mf, hist(md1$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", 
        main="Global Active Power"))
dev.off()
