
# load data set
        power <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
        
# Convert the Date variable and get susbset of data from the dates 2007-02-01 and 2007-02-02
        power$Date <- as.Date(power$Date, "%d/%m/%Y")
        power_sub <- power[power$Date %in% c(as.Date("1/2/2007","%d/%m/%Y"), as.Date("2/2/2007","%d/%m/%Y")), ] 
               
# Create File & Build Plot 
        png(filename="plot2.png", width=480, height=480) #specifies output to PNG and sets width and height
        plot(power_sub$Global_active_power, 
             type="l",
             xlab="", 
             ylab="Global Active Power (kilowatts)", 
             axes="False",
             frame.plot="TRUE")
        axis(2)
        axis(1,at=c(0,1440,2900),labels=c("Thur","Fri","Sat"))
        dev.off() #saves PNG file
