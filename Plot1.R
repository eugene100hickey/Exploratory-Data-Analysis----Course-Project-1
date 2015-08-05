#August 5th 2015
#reads on data file
#df1 <- read.csv("./data/household_power_consumption.txt", sep = ";")

#dummy file to make stuff work faster 
df1 <- read.csv("./data/household_short.txt", sep = ";")

#picks out the two correct days
df1 <- subset(df1, Date =="1/2/2007" | Date =="2/2/2007")

#reformats Global_active_power as a numeric
df1$Global_active_power <- as.numeric(as.character(df1$Global_active_power))

x_axis <- "Global Active Power (kilowatts)"

gtitle <- "Global Active Power"

#png("plot1.png", width = 480, height = 480, units = "px")
hist(df1[,3], col = "red", main  = gtitle, xlab = x_axis)
#dev.off()
