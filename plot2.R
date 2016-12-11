plot2 <- {
        ## Part 1: Download dataset and clean data
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
        
        
        ## Part2: Create PNG 2
        ## Lunch Graphic Device PNG
        png(file="plot2.png", width = 480, height = 480)
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
        ## Close the PNG file device
        dev.off()
}