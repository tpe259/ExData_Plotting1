## Prepare standard charts of household electricity usage data
#
# Call the function plot4() to import data from working directory and create plot
#
plot4 <- function(){
        # Start by reading whole data set
        elec <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, na.strings = "?")
        # Convert Date field to POSIXlt
        elec$Date <- strptime(elec$Date, format = "%d/%m/%Y")
        # Subset to the requested days
        elec <- elec[(elec$Date == strptime("2007-02-01", format = "%Y-%m-%d") | elec$Date == strptime("2007-02-02", format = "%Y-%m-%d")),]
        # Grid of graphs
        # Open png device
        png("plot4.png", width = 480, height = 480)
        par(mfrow = c(2,2))
            with(elec, {
                # Top-left plot
                    plot(Global_active_power, type = "l", ylab = "Global Active Power")
                # Top-right plot
                    plot(Voltage, type = "l", xaxt = 'n', xlab = "datetime", ylab = "Voltage")
                    axis(at = c(1, 1440, 2880), side = 1, labels = c("Thu", "Fri", "Sat"))
                # Bottom-left plot
                    plot(Sub_metering_1, type = "l", ylim = c(0, 38), xaxt = 'n', xlab = "", ylab = "Energy sub metering")
                    par(new = TRUE)
                    plot(Sub_metering_2, type = "l", xaxt = 'n', xlab = "", ylab = "", ylim = c(0, 38), col = "red", axes = FALSE)
                    par(new = TRUE)
                    plot(Sub_metering_3, type = "l", xaxt = 'n', xlab = "", ylab = "", ylim = c(0, 38), col = "blue", axes = FALSE)
                    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), text.col = c("black", "red", "blue"))
                    axis(at = c(1, 1440, 2880), side = 1, labels = c("Thu", "Fri", "Sat"))
                # Bottom-right plot
                    plot(elec$Global_reactive_power, type = "l", xaxt = 'n', xlab = "datetime", ylab = "Global_reactive_power")
                    axis(at = c(1, 1440, 2880), side = 1, labels = c("Thu", "Fri", "Sat"))
            })
        # Close device and write file
        dev.off()
}