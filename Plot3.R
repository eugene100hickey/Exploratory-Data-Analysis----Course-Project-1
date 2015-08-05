df1 <- read.csv("./data/household_power_consumption.txt", sep = ";")
#df1 <- read.csv("./data/household_short.txt", sep = ";")

df1 <- subset(df1, Date =="1/2/2007" | Date =="2/2/2007")

df1$Global_active_power <- as.numeric(as.character(df1$Global_active_power))

df1$Sub_metering_1 <- as.numeric(as.character(df1$Sub_metering_1))
df1$Sub_metering_2 <- as.numeric(as.character(df1$Sub_metering_2))
df1$Sub_metering_3 <- as.numeric(as.character(df1$Sub_metering_3))


df1$newdate <- as.Date(strptime(df1$Date, "%d/%m/%Y"))

df1 <- within(df1, { timeline=format(as.POSIXct(paste(newdate, Time)), "%Y-%m-%d %H:%M:%S") })

png("plot3.png", width = 480, height = 480, units = "px")

plot( as.POSIXct(df1$timeline), df1$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n")

points(as.POSIXct(df1$timeline), df1$Sub_metering_1, type = "l", col = "black")
points(as.POSIXct(df1$timeline), df1$Sub_metering_2, type = "l", col = "red")
points(as.POSIXct(df1$timeline), df1$Sub_metering_3, type = "l", col = "blue")

graph_legend<- c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3")
legend_colour <- c("black", "red", "blue")
legend("topright", legend = graph_legend, cex = 0.5, lty = c(1, 1, 1), col = legend_colour)

dev.off()