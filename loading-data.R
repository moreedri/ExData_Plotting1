#
# Individual household electric power consumption Data Set 
# https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption
#
# The dataset has 2,075,259 rows and 9 columns. First calculate a rough estimate of how much memory the dataset will require in memory before reading into R. Make sure your computer has enough memory (most modern computers should be fine).
#
# We will only be using data from the dates 2007-02-01 and 2007-02-02. One alternative is to read the data from just those dates rather than reading in the entire dataset and subsetting to those dates.
# You may find it useful to convert the Date and Time variables to Date/Time classes in R using the strptime() and as.Date() functions.
# Note that in this dataset missing values are coded as ?.
#


library(lubridate)


# this code is expected to run from the main git repository folder
# users are expected to have cloned the repo from Coursera
# setwd("~/GitRepo/ExData_Plotting1/")

# raw data is available in /data folder
# convention: the /data folder is excluded from git using .gitignore

trial <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = c("NA", "", " ", "?"), stringsAsFactors = FALSE, nrows = 10)
labels <- colnames(trial)
classes <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")


# compare some methods
# system.time(data <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = c("NA", "", " ", "?"), stringsAsFactors = FALSE, colClasses = classes))
#    user  system elapsed 
#  22.568   0.259  22.830 
# library(data.table)
# system.time(data <- fread("./data/household_power_consumption.txt", na.strings = "?"))
#    user  system elapsed 
#   1.321   0.056   1.376 
# conversion error: Coercing previously read values in this column from numeric back to character which may not be lossless.


data <- read.table("./data/household_power_consumption.txt", 
                   header = TRUE, 
                   sep = ";", 
                   na.strings = c("NA", "", " ", "?"), 
                   stringsAsFactors = FALSE, 
                   colClasses = classes,
                   nrows = 2075259)

data$Date <- dmy(data$Date)
data$Time <- fast_strptime(data$Time, format = "%H:%M:%S")

result <- data[data$Date == ymd("2007-02-01") | data$Date == ymd("2007-02-02"), ]

save(result, file = "./data/data.RData")

