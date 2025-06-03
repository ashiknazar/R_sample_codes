data(iris)

View(iris)




#data =read.csv('C:/Users/91812/Downloads/Mall_Customers.csv')
#w=data[3:5]

install.packages('fpc')
library(fpc)
set.seed(123)
db <- dbscan(w,eps = 0.9,MinPts = 9)
db
db$cluster
table(db$cluster,iris$Species)

plot(db,w,main="DBSCAN")

