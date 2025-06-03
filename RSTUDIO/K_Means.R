
#
install.packages("ISLR")
library(ISLR)
head(iris)

dataset <- iris[, -5]
dataset

# visualization  of data set

plot(dataset$Sepal.Length, dataset$Sepal.Width)


#or plot using ggplot
library(ggplot2)
pl <- ggplot(iris, aes(Petal.Length,Petal.Width, color=Species))
pl
print(pl + geom_point(size=4))
#in ggplot we take 'iris' and not dataset because in dataset we removed 'Species' column


# WCSS - Elbow Method of data set
set.seed(101)
#The kmeans() function has an nstart option that attempts multiple initial configurations and reports on the best one. For example, adding nstart=25 will generate 25 initial configurations.
irisCluster <- kmeans(dataset, centers = 3) #centers meand no of clusters
irisCluster

irisCluster$cluster
iris$Species


library(cluster)
clusplot(iris,irisCluster$cluster , color = T, shade = T,labels = 3,
         lines =0,main = 'K means Chart',
         xlab='Length/Width', ylab = 'Height')

wcss = vector()
for(i in 1:10) wcss[i] = sum(kmeans(dataset, i)$withinss)
plot(1:10, wcss, type = 'b', main = 'The Elbow Method',
     xlab='Number of Cluster',ylab = 'WCSS')


# Set Number of Cluster you want frm graph
kmeans = kmeans(dataset, centers = 3)
y_kmenas = kmeans$cluster
y_kmenas


# Finally, Visualize your Clusters...
library(cluster)
clusplot(dataset, y_kmenas,
         color = T, shade = T,labels = 3,
         lines =0,main = 'K means Chart',
         xlab='Length/Width', ylab = 'Height')

