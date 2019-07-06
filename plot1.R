# reading in libraries
library(dplyr)
library(lubridate)
# reading in the data file
power <- read.csv2("household_power_consumption.txt")
# making the dataset easier to work with
power <- mutate(power,Date2=dmy(Date))
power <- mutate(power,GAP=as.numeric(as.character(Global_active_power)))
# filtering out all but the days of interest
power <- filter(power,((Date2 >= "2007-02-01") & (Date2 <= "2007-02-02")))

# creating the plot
png("plot1.png")
hist(p2$GAP, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
#closing the device
dev.off()
