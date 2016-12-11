plot1 <- {
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
        
        ## Part2: Create PNG 1
        ## Lunch Graphic Device PNG
        png(file="plot1.png", width = 480, height = 480)
        ## create histogram for Global_active_power
        hist(as.numeric(levels(power_cons$Global_active_power)[power_cons$Global_active_power]), main="Global Active Power", xlab="Global Active Power (kilowatts)",col="red")
        ## Close the PNG file device
        dev.off()
}