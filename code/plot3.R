##download the data and unzip the data 
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="household_power_consumption.zip")
unzip("household_power_consumption.zip")

##read the data into R
pw <-read.table("household_power_consumption.txt",header=TRUE,sep=";")

##convert the Date and Time variables to Date/Time classes
tt <- strptime(paste(pw[,1],pw[,2]), "%d/%m/%Y %H:%M:%OS",tz="GMT")
pw2 <- cbind(pw,tt)

##set the range of date
st <-  strptime('1/2/2007 00:00:00', "%d/%m/%Y %H:%M:%OS",tz="GMT")
et <-  strptime('3/2/2007 00:00:00', "%d/%m/%Y %H:%M:%OS",tz="GMT")

##extract data data from the selected date
 ll <- pw2[which(pw2[,"tt"] >= st & pw2[,"tt"] < et),]
tt<- (ll[,"tt"])
maxt<-max(tt)
mint<-min(tt)
midt <-  strptime('2/2/2007 00:00:00', "%d/%m/%Y %H:%M:%OS",tz="GMT")

#plot
png("plot3.png",width = 480, height = 480)
plot(tt,ll[,"Sub_metering_1"],xlab="",ylab="energy sub-metering",type='l')
lines(tt,ll[,"Sub_metering_2"],type='l',col='red',new=FALSE)
lines(tt,ll[,"Sub_metering_3"],type='l',col='blue',new=FALSE)
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"),
pch=c('！！','！！','！！'))
dev.off()