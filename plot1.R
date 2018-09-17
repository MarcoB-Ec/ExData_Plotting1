library(readr)
library(dplyr)
library(lubridate)
df <- read.table("household_power_consumption.txt", header = TRUE, skip = 66637, 
                 nrows = 2879, sep = ";", col.names = c("Date", "Time", "Global_active_power", 
                                                        "Global_reactive_power", "Voltage",
                                                        "Global_intensity", "Sub_metering_1",
                                                        "Sub_metering_2", "Sub_metering_3"))


 
df$Date <-strptime(as.character(df$Date), format = "%d/%m/%Y")

(as.character(df$Time))

df$Time <- format(strptime(as.character(df$Time), format = "%H:%M:%S"), format = "%H:%M:%S") 


