df<-read.table("C:\\Education\\R_programming\\exdata_data_household_power_consumption\\household_power_consumption.txt",header=TRUE,sep=";")
df1<-subset(df,Date==("1/2/2007"))
df2<-subset(df,Date==("2/2/2007"))           
df3<-rbind(df1,df2)

df3$Global_active_power<-apply(df3[3],2,as.numeric)
df3$Sub_metering_1=as.numeric(df3$Sub_metering_1)
df3$Sub_metering_2=as.numeric(df3$Sub_metering_2)
df3$Sub_metering_3=as.numeric(df3$Sub_metering_3)
df3$Voltage=as.numeric(df3$Voltage)
df3$Global_reactive_power=as.numeric(df3$Global_reactive_power)
DateTime<-strptime(paste(df3$Date,df3$Time,sep=" "),format = "%d/%m/%Y %H:%M:%S")

png("plot3.png")
with(df3,plot(DateTime,Sub_metering_1,type="l",xlab = "",ylab = "Energy sub metering"))
points(DateTime, df3$Sub_metering_2,type="l", col= "red")
points(DateTime, df3$Sub_metering_3,type="l", col= "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=1, col = c("black", "red", "blue"))
dev.off()
