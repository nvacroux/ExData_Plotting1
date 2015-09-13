# This program satisfies the requirements of Exploratory Data Analysis offered by Johns Hopkins University
# through Coursera, Project 1.

# NOTE:  The instructions for this assignment state "...code file should include code for reading the data...".
# I interpret that requirement to mean that _you_, the grader, are responsible for downloading the data and
# insuring that it is in the working directory.

#NOTE:  This code assumes that your system has sufficient memory to load the entire data set.

# This commentted-out code block will import the data from a zip file, if you should need it.  If you are
# starting with the zip file, delete all the "# " at the start of the five lines of code and then comment out
# the code in the next block.
# temp <- "exdata_data_household_power_consumption.zip"
# data <- read.table(unz(temp, "household_power_consumption.txt"),
#                    header=TRUE, sep=";", na.strings="?", stringsAsFactors = FALSE)
# subdata <- subset(data, (data$Date == "1/2/2007" | data$Date == "2/2/2007"))
# rm(data)

# This code block will import the _unzipped_ data file.
data <- read.table("household_power_consumption.txt",
                   header=TRUE, sep=";", na.strings="?", stringsAsFactors = FALSE)
subdata <- subset(data, (data$Date == "1/2/2007" | data$Date == "2/2/2007"))
rm(data)

# Convert Date ant Time to date/time format.
subdata$Date <- as.Date(subdata$Date, format="%d/%m/%Y")
subdata$Time <- as.POSIXct(paste(subdata$Date, subdata$Time))

# Create plot and save as PNG file.
png(filename="plot3.png")
plot(subdata$Time, subdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub-metering")
lines(subdata$Time, subdata$Sub_metering_2, type="l", col="red")
lines(subdata$Time, subdata$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()