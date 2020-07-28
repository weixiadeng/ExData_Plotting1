df <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
df <- df[df$Date %in% c("1/2/2007", "2/2/2007"),]
df$Time <- paste(df$Date, df$Time, sep = " ")
df$Time <- strptime(df$Time, format = "%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")

for (i in c(3:8)){
    df[,i] <- as.numeric(df[,i])
}
remove(i)

png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(df$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red")
dev.off()