df <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
df <- df[df$Date %in% c("1/2/2007", "2/2/2007"),]
df$Time <- paste(df$Date, df$Time, sep = " ")
df$Time <- strptime(df$Time, format = "%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")

for (i in c(3:8)){
    df[,i] <- as.numeric(df[,i])
}
remove(i)

png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2, 2))

plot(df$Time, df$Global_active_power, col = "black", type = "l", xlab = "",
     ylab = "Global Active Power")

plot(df$Time, df$Voltage, col = "black", type = "l",
     xlab = "datetime", ylab = "Voltage")

plot(df$Time, df$Sub_metering_1, col = "black", type = "l", xlab = "",
     ylab = "Energy sub metering")
lines(df$Time, df$Sub_metering_2, col = "red", type = "l")
lines(df$Time, df$Sub_metering_3, col = "blue",type = "l")
legend("topright", lty = 1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black","red", "blue"))

plot(df$Time, df$Global_reactive_power,
     col = "black", type = "l", xlab = "datetime",
     ylab = "Global_reactive_power")

dev.off()

