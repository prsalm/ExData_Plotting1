
# load data set
        power <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
        
# Convert the Date variable and get susbset of data from the dates 2007-02-01 and 2007-02-02
        power$Date <- as.Date(power$Date, "%d/%m/%Y")
        power_sub <- power[power$Date %in% c(as.Date("1/2/2007","%d/%m/%Y"), as.Date("2/2/2007","%d/%m/%Y")), ] 
               
# Create File & Build Plot 
        png(filename="plot2.png", width=480, height=480) #specifies output to PNG and sets width and height
        plot(power_sub$Sub_metering_1, 
             type="l",
             xlab="", 
             ylab="Energy sub metering", 
             axes="False",
             frame.plot="TRUE")
        lines(power_sub$Sub_metering_2, 
             type="l",
             col="red")
        lines(power_sub$Sub_metering_3, 
              type="l",
              col="blue")
        legend("topright",col=c("black","red","blue"), lty=1, legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        axis(2)
        axis(1,at=c(0,1440,2900),labels=c("Thur","Fri","Sat"))
        dev.off() #saves PNG file
