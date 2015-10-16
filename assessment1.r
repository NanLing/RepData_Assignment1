setwd("C:/nobackup/Reproducible Research/Assessment1")
destfile <- paste(wd,"/DataSet.zip",sep ="")
download.file("https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2Factivity.zip",destfile=destfile)
unzip(destfile)

adata <- read.csv('activity.csv')
sum_dailysteps <- aggregate(steps ~ date, data=adata, FUN="sum", na.rm=TRUE)
hist(sum_dailysteps$steps)
mean(sum_dailysteps$steps)
median(sum_dailysteps$steps)



avg_5minsteps <- aggregate(steps ~ interval, data=adata, FUN="mean", na.rm=TRUE)
plot(avg_5minsteps$interval,avg_5minsteps$steps,type = "l")
avg_5minsteps$interval[which.max(avg_5minsteps$steps)]


sum(is.na(adata$steps))
