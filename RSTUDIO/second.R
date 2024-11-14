date1<-as.Date("2022-04-29")
date1
class(date1)

dat<-"2022-04-29"
class(dat)
dat

dat11<-as.Date("04/09/2022",format="%m/%d/%Y")
dat11
class(dat11)

#use 'y' if we have in 2 digits('Y' normal 4 digit)
dat2<-as.Date("04/09/22",format="%m/%d/%y")
dat2
class(dat2)

#use 'B' if we have a month in letters
date3<-as.Date("11,january,2022",format="%d,%B,%Y")
date3
class(date3)

#current system date
Sys.Date()

#timezone
Sys.timezone()

 
#current time
#install.packages("lubridate") in console
library(lubridate)
now()
