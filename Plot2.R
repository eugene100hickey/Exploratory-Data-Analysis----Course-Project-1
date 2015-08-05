df1 <- read.csv("./data/household_power_consumption.txt", sep = ";")
#df1 <- read.csv("./data/household_short.txt", sep = ";")

df1 <- subset(df1, Date =="1/2/2007" | Date =="2/2/2007")

df1$Global_active_power <- as.numeric(as.character(df1$Global_active_power))

df1$newdate <- as.Date(strptime(df1$Date, "%d/%m/%Y"))

df1 <- within(df1, { timeline=format(as.POSIXct(paste(newdate, Time)), "%Y-%m-%d %H:%M:%S") })

png("plot2.png", width = 480, height = 480, units = "px")
plot(as.POSIXct(df1$timeline), df1$Global_active_power, xlab = "", ylab = "Global Active Power(kilowatts)", type = "l")
dev.off()