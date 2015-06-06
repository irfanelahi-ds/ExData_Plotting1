#this script will generate the histogram of Global Active Power in png graphic device.

#first step is to read the data into R:
data4<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";",skip=66636,nrow=2880)

#after the data has been read, we need to properly name the columns:

n1<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","sub_metering_1","sub_metering_2","sub_metering_3")
names(data4)<-n1

#functioning properly. now use png graphic device:
png(file="plot1.png")

hist(data4$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()
