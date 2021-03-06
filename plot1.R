library(readr)
library(dplyr)
library(lubridate)

df <- read.table("household_power_consumption.txt", header = TRUE, skip = 66636, 
                 nrows = 2880, sep = ";", col.names = c("Date", "Time", "Global_active_power", 
                                                        "Global_reactive_power", "Voltage",
                                                        "Global_intensity", "Sub_metering_1",
                                                        "Sub_metering_2", "Sub_metering_3"))



 
df$Date <-as.character(df$Date)
 
df$Time <- as.character(df$Time) 

df$DaTime <- paste(df$Date, df$Time, sep = " ")

df$DaTime <- strptime(df$DaTime, format = "%d/%m/%Y %H:%M:%S")

df$Date <-as.Date(as.character(df$Date), format = "%d/%m/%Y")

df$Time <- strptime(df$Time, format = "%H:%M:%S")
#GLobal Active Power

png("plot1.png")

with(df, hist(Global_active_power, col = "red", 
              main = "Global Active Power", 
              xlab = "Global Active Power (kilowats)"))

dev.off()



