
# load data set
        power <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
        
# Convert the Date variable and get susbset of data from the dates 2007-02-01 and 2007-02-02
        power$Date <- as.Date(power$Date, "%d/%m/%Y")
        power_sub <- power[power$Date %in% c(as.Date("1/2/2007","%d/%m/%Y"), as.Date("2/2/2007","%d/%m/%Y")), ] 
               
# Create File & Build Plot 
        png(filename="plot1.png", width=480, height=480) #specifies output to PNG and sets width and height
        hist(power_sub$Global_active_power, 
             col="red", 
             xlab="Global Active Power (kilowatts)", 
             main="Global Active Power")
        dev.off() #saves PNG file
