## Prepare standard charts of household electricity usage data
#
# Call the function plot1() to import data from working directory and create plot
#
plot1 <- function(){
        # Start by reading whole data set
        elec <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, na.strings = "?")
        # Convert Date field to POSIXlt
        elec$Date <- strptime(elec$Date, format = "%d/%m/%Y")
        # Subset to the requested days
        elec <- elec[(elec$Date == strptime("2007-02-01", format = "%Y-%m-%d") | elec$Date == strptime("2007-02-02", format = "%Y-%m-%d")),]
        # Histogram
        # Open png device
        # The required dimensions are the default,
        # ~but have been specified explicitly for completeness
        png("plot1.png", width = 480, height = 480)
        hist(elec$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
        # Close device and write file
        dev.off()
}
