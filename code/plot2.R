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
gap<-as.numeric(ll[,"Global_active_power"])
maxt<-max(tt)
mint<-min(tt)
midt <-  strptime('2/2/2007 00:00:00', "%d/%m/%Y %H:%M:%OS",tz="GMT")

#plot
png("plot2.png",width = 480, height = 480)
plot(tt,gap,xlab="",ylab="Global active power(kilowatts)",main="Global active power",type='l')
dev.off()