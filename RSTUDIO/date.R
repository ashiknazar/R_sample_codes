library(lubridate)
x<-c("2021-01-11","2020-08-18","2009-12-23")
print(x)

#extract year
year(x)
#extract month
month(x)
#extract month names
month(x,label=TRUE)
month(x,label=TRUE,abbr=FALSE)

#exact days
mday(x)

#extracting weekdays
wday(x,label=TRUE,abbr=FALSE)


x1<-c("2021-01-11","2020-08-18","2009-12-12") #c>vector
print(x1)
class(x1)
#converting vector into date formate
x1<-ymd(x1)
print(x1)
class(x1)

#shifting one year ahead
xy<-x1+years(1)
print(xy)

#updating days
mday(xy)<-c(12,14,18)
print(xy)
print(x1)

#using update to manipulate the date
new_x=update(x1,year=c(2005,2013,1993),month=c(4,6,8),day=c(10,8,7))
print(new_x)
