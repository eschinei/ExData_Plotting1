plot4 <- {
        ########### Part 1: Download dataset and clean data  ####################
        
        ## download dataset from web
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","power.zip")
        ## unzip file
        unzip("power.zip")
        ##read .txt file
        data=read.table("household_power_consumption.txt",header=T,sep=";")
        ## filter data for days 1 and 2 of February 2007
        power_cons=data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
        ## convert dates to Date
        power_cons$Date=as.Date(power_cons$Date, format="%d/%m/%Y")
        
        ########### Part2: Create PNG 4         ########### 
        
        ## Lunch Graphic Device PNG
        png(file="plot4.png", width = 480, height = 480)
        ## Prepare our canvas to insert multiple plots (matrix of 2x2), inserted per column (mfcol)
        par(mfcol=c(2,2), mar=c(4,4,2,1))
        
        ########### Plot1
        ## Transform data to numeric
        Global_active_power=as.numeric(levels(power_cons$Global_active_power)[power_cons$Global_active_power])
        ## Create an empty 'canvas' with no x label 
        plot(Global_active_power,type="n", xaxt='n',xlab="", ylab="Global Active Power (kilowatts)")
        ## Create our line plot
        lines(Global_active_power)
        ## Estimate positions where x label will be located (last Friday sample is the only parameter needed)
        pos=c(0,length(power_cons$Date[power_cons$Date=="2007-02-01"]),length(power_cons$Date))
        ## create new X axis label
        axis(1,at=pos,c("Thu","Fri","Sat"))
    
        ########### Plot2
        ## Transform data to numeric
        Sub_metering_1=as.numeric(levels(power_cons$Sub_metering_1)[power_cons$Sub_metering_1])
        Sub_metering_2=as.numeric(levels(power_cons$Sub_metering_2)[power_cons$Sub_metering_2])
        Sub_metering_3=as.numeric(power_cons$Sub_metering_3)
        ## Create an empty 'canvas' with no x label 
        plot(Sub_metering_1,type="n", xaxt='n',xlab="", ylab="Energy sub metering")
        ## Create our lines plot
        lines(Sub_metering_1)
        lines(Sub_metering_2, col="red")
        lines(Sub_metering_3, col="blue")
        ## create new X axis label
        axis(1,at=pos,c("Thu","Fri","Sat"))
        ## place a legend at the top right corner with requested names and colors
        legend("topright", pch="-", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
        ########### Plot3
        ## Transform data to numeric
        Voltage=as.numeric(levels(power_cons$Voltage)[power_cons$Voltage])
        ## Create an empty 'canvas'
        plot(Voltage,type="n", xaxt='n', ylab="Voltage", xlab="datetime")
        ## Create our line plot
        lines(Voltage)
        ## create new X axis label
        axis(1,at=pos,c("Thu","Fri","Sat"))
        
        ########### Plot4
        ## Transform data to numeric
        Global_reactive_power=as.numeric(levels(power_cons$Global_reactive_power)[power_cons$Global_reactive_power])
        ## Create an empty 'canvas'
        plot(Global_reactive_power,type="n", xaxt='n', ylab="Global_reactive_power", xlab="datetime")
        ## Create our line plot
        lines(Global_reactive_power)
        ## create new X axis label
        axis(1,at=pos,c("Thu","Fri","Sat"))
        ## Close the PNG file device
        dev.off()
}