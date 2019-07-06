# reading in libraries
library(dplyr)
library(lubridate)
# reading in the data file
power <- read.csv2("household_power_consumption.txt")
# making the dataset easier to work with
power <- mutate(power, Date2=dmy(Date))
power <- mutate(power, Time2 = hms(Time))
power <- mutate(power, GAP=as.numeric(as.character(Global_active_power)))
power <- mutate(power, GRP=as.numeric(as.character(Global_reactive_power)))
power <- mutate(power, VOL=as.numeric(as.character(Voltage)))
power <- mutate(power, SM1=as.numeric(as.character(Sub_metering_1)))
power <- mutate(power, SM2=as.numeric(as.character(Sub_metering_2)))
power <- mutate(power, SM3=as.numeric(as.character(Sub_metering_3)))
power <- mutate(power, DT = make_datetime(year = year(Date2), month=month(Date2), day = day(Date2), hour = hour(Time2), min = minute(Time2), sec = second(Time2)))
# filtering out all but the days of interest
power <- filter(power,((Date2 >= "2007-02-01") & (Date2 <= "2007-02-02")))

# creating the plot
png("plot4.png")
par(mfcol=c(2,2), cex=0.7)
with(power,plot(DT,GAP, type = "l", xlab = "", ylab = "Global Active Power"))
with(power,plot(DT,SM1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(power,points(DT,SM2, col = "red", type = "l"))
with(power,points(DT,SM3, col = "blue", type = "l"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1,col=c("black","red","blue"),bty="n")
with(power,plot(DT,VOL, type = "l", xlab = "datetime", ylab = "Voltage"))
with(power,plot(DT,GRP, type = "l", xlab = "datetime", ylab = "Global_relative_power"))
#closing the device
dev.off()
