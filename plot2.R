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


png(file = "plot2.png")

with(result, 
     plot(Global_active_power,
          type = "l",
          ylab = "Global Active Power (kilowatts)",
          xlab = NA,
          xaxt = "n")
)
axis(side = 1, labels = weekdays(result$Date), at = NULL)


dev.off()
