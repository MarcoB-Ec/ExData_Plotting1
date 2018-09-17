library(readr)
library(dplyr)
library(lubridate)
df <- read.table("household_power_consumption.txt", header = TRUE, skip = 66636, 
                 nrows = 2880, sep = ";", col.names = c("Date", "Time", "Global_active_power", 
                                                        "Global_reactive_power", "Voltage",
                                                        "Global_intensity", "Sub_metering_1",
                                                        "Sub_metering_2", "Sub_metering_3"))

#Put Date and Time info as character vectors
df$Date <-as.character(df$Date)

df$Time <- as.character(df$Time) 

#placing both Date and Time info in ONE column as a new variable
df$DaTime <- paste(df$Date, df$Time, sep = " ")

#Changing new variable to fit date and time format
df$DaTime <- strptime(df$DaTime, format = "%d/%m/%Y %H:%M:%S")


#Trnsforming given Date and Time in specific formats
df$Date <-as.Date(as.character(df$Date), format = "%d/%m/%Y")

df$Time <- strptime(df$Time, format = "%H:%M:%S")

#Energy sub metering by days as PNG
png('plot3.png')

with(df, plot(DaTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
lines (df$DaTime, df$Sub_metering_2, type = "l", col = "red")
lines(df$DaTime, df$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"),pch = "_")

dev.off()

