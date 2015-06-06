#this script will generate the histogram of Global Active Power in png graphic device.

#first step is to read the data into R:
data4<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";",skip=66636,nrow=2880)

#after the data has been read, we need to properly name the columns:

n1<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","sub_metering_1","sub_metering_2","sub_metering_3")
names(data4)<-n1

data4$Date<-as.character(data4$Date) #type-casting it into Character type to converted into date format afterwards
data4$Date<-as.Date(data4$Date,"%d/%m/%Y") #converting it into date format
data4$datetime<-paste(data4$Date,data4$Time) #concatenating the two columns in a new column
data4$datetime<-strptime(data4$datetime,format="%Y-%m-%d %H:%M:%S") 

png(file="plot3.png")
with(data4,plot(datetime,sub_metering_1,type="n",ylab="Energy sub metering",xlab=""))
     
lines(data4$datetime,data4$sub_metering_1)
lines(data4$datetime,data4$sub_metering_2, col="red")
lines(data4$datetime,data4$sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),pch=c("_","_","_"),col=c("black","blue","red"))
dev.off()