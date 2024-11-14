#install.packages('dplyr')

library(dplyr)

#example data
#install.packages('nycflights13')
library(nycflights13)

flights

summary(flights)
dim(flights)
flights
head(filter(flights,month==11,day==3,carrier=='AA'))
head(flights[flights$month==11 &flights$day==3 & flights$carrier=='AA',])

#slice
slice(flights,1:10)
flights

#arrange
head(arrange(flights,desc(dep_delay)))

#select
head(select(flights,carrier))

#rename
head(rename(flights,months=month))
distinct(select(flights,carrier))

#flights$carrier
#mutate

head(flights)
head(mutate(flights,new_col=arr_delay-dep_delay))
x=mutate(flights,new_col=arr_delay-dep_delay)
x$new_col

#summarize
summarise(flights,avg_air_time=mean(air_time,na.rm=TRUE))

#sample_n() and sample_frac()
sample_n(flights,2)
sample_frac(flights,0.06)

