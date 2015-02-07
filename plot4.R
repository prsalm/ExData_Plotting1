
# load data set
        power <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
        
# Convert the Date variable and get susbset of data from the dates 2007-02-01 and 2007-02-02
        power$Date <- as.Date(power$Date, "%d/%m/%Y")
        power_sub <- power[power$Date %in% c(as.Date("1/2/2007","%d/%m/%Y"), as.Date("2/2/2007","%d/%m/%Y")), ] 
               
# Create File & Build Plots 
        png(filename="plot4.png", width=480, height=480) #specifies output to PNG and sets width and height
       
        par(mfcol=c(2,2), mar=c(4,4,2,2), cex=.6) #create 2 x 2 plot structure
        
        #Plot 1
        plot(power_sub$Global_active_power, 
             type="l",
             xlab="", 
             ylab="Global Active Power", 
             axes="False",
             frame.plot="TRUE")
        axis(2)
        axis(1,at=c(0,1440,2900),labels=c("Thur","Fri","Sat"))
        
        #Plot 2
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
        legend("topright",col=c("black","red","blue"), lty=1, xjust=1, box.lwd=0,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        axis(2)
        axis(1,at=c(0,1440,2900),labels=c("Thur","Fri","Sat"))
        
        #Plot 3
        plot(power_sub$Voltage, 
             type="l",
             xlab="datetime", 
             ylab="Voltage", 
             axes="False",
             frame.plot="TRUE")
        axis(2)
        axis(1,at=c(0,1440,2900),labels=c("Thur","Fri","Sat"))
        
        #Plot 4
        plot(power_sub$Global_reactive_power, 
             type="l",
             xlab="datetime", 
             ylab="Global_reactive_power",  
             axes="False",
             frame.plot="TRUE")
        axis(2)
        axis(1,at=c(0,1440,2900),labels=c("Thur","Fri","Sat"))
        
        
        dev.off() #saves PNG file
