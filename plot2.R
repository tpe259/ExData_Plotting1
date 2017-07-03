## Prepare standard charts of household electricity usage data
#
# Call the function plot2() to import data from working directory and create plot
#
plot2 <- function(){
        # Start by reading whole data set
        elec <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, na.strings = "?")
        # Convert Date field to POSIXlt
        elec$Date <- strptime(elec$Date, format = "%d/%m/%Y")
        # Subset to the requested days
        elec <- elec[(elec$Date == strptime("2007-02-01", format = "%Y-%m-%d") | elec$Date == strptime("2007-02-02", format = "%Y-%m-%d")),]
        # Line graph
        # Open png device
        png("plot2.png", width = 480, height = 480)
        with(elec, plot(Global_active_power, type = "l", xaxt = 'n', xlab = "", ylab = "Global Active Power (kilowatts)"))
        axis(at = c(1, 1440, 2880), side = 1, labels = c("Thursday", "Friday", "Saturday"))
        # Close device and write file
        dev.off()
}
