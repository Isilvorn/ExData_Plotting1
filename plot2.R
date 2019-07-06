# reading in libraries
library(dplyr)
library(lubridate)
# reading in the data file
power <- read.csv2("household_power_consumption.txt")
# making the dataset easier to work with
power <- mutate(power, Date2=dmy(Date))
power <- mutate(power, Time2 = hms(Time))
power <- mutate(power, GAP=as.numeric(as.character(Global_active_power)))
power <- mutate(power, DT = make_datetime(year = year(Date2), month=month(Date2), day = day(Date2), hour = hour(Time2), min = minute(Time2), sec = second(Time2)))
# filtering out all but the days of interest
power <- filter(power,((Date2 >= "2007-02-01") & (Date2 <= "2007-02-02")))

# creating the plot
png("plot2.png")
with(power,plot(DT,GAP, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
#closing the device
dev.off()
