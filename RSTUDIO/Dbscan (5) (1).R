data(iris)

View(iris)

data = iris[,-5]
head(data)

#install.packages('fpc')
library(fpc)
set.seed(123)
db <- dbscan(data,eps = 0.45,MinPts = 5)
db
db$cluster
table(db$cluster,iris$Species)

plot(db,data,main="DBSCAN")
