# For each plot you should
## - Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
## - Name each of the plot files as plot1.png, plot2.png, etc.
## - Create a separate R code file (plot1.R, plot2.R, etc.) that constructs the corresponding plot, i.e. code in plot1.R constructs the plot1.png plot. 
##   Your code file should include code for reading the data so that the plot can be fully reproduced. 
##   You must also include the code that creates the PNG file.
## - Add the PNG file and R code file to your git repository
# 

# decide where to run the script
# convention: data is in /data
# setwd("~/GitRepo/ExData_Plotting1/")

# clean data is available in /data folder
# convention: the /data folder is excluded from git using .gitignore
# moved code for generating clean data to separate routine to ensure identical data in all plots
# see: loading-data.R

load("./Data/data.RData")


png(file = "plot4.png")

par(mfrow = c(2, 2))

with(result, 
     plot(Global_active_power,
          type = "l",
          ylab = "Global Active Power (kilowatts)",
          xlab = NA,
          xaxt = "n")
)

with(result, 
     plot(Voltage,
          type = "l",
          ylab = "Voltage",
          xlab = "datetime",
          xaxt = "n")
)

with(result, 
     plot(Sub_metering_1,
          type = "n",
          ylab = "Energy Sub Metering",
          xlab = NA,
          xaxt = "n")
)
lines(result$Sub_metering_1, col = "black")
lines(result$Sub_metering_2, col = "red")
lines(result$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(result, 
     plot(Global_reactive_power,
          type = "l",
          ylab = "Global_reactive_power",
          xlab = "datetime",
          xaxt = "n")
)


dev.off()
