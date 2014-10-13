
setwd("c:/Users/Marek/Desktop/R/")
md <- read.csv("household_power_consumption.txt", sep=";")
md$Date <- as.Date(strptime(md$Date,"%d/%m/%Y"))
md$Global_active_power <- as.numeric(as.character(md$Global_active_power))
md1 <- md[md$Date == as.Date(strptime("2007-02-01", "%Y-%m-%d")) | 
                  md$Date == as.Date(strptime("2007-02-02", "%Y-%m-%d")),]

md1$Date <- strptime(paste(md1$Date, md1$Time, sep = " "),"%Y-%m-%d %H:%M:%S")



mf <- png(filename="plot4.png", width = 480, height = 480)
par(mfrow=c(2,2), mar=c(4,4,4,1))
with (mf, {

                plot(md1$Date, md1$Global_active_power, "l", ylab="Global Active Power", xlab="")                
                plot(md1$Date, as.numeric(as.character(md1$Voltage)), "l", ylab="Voltage", xlab="datetime")                
                
                plot(md1$Date, as.numeric(as.character(md1$Sub_metering_1)), "l", ylab="Energy sub metering", xlab="")
                lines(md1$Date, as.numeric(as.character(md1$Sub_metering_2)), "l", col="red")
                lines(md1$Date, as.numeric(as.character(md1$Sub_metering_3)), "l", col="blue")
                legend("topright", lty=c(1,1), col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )
                
                plot(md1$Date, as.numeric(as.character(md1$Global_reactive_power)), "l", ylab="Global_reactive_power", xlab="datetime") 
})        
dev.off()
