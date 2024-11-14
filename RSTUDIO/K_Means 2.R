dataset = read.csv('C:/Users/91812/Downloads/Mall_Customers (2).csv')
dataset
dataset = dataset[4:5]
dataset

colnames(dataset)

library(ggplot2)
pl <- ggplot(dataset, aes(Annual.Income..k..,Spending.Score..1.100.))
print(pl + geom_point(size=4))

set.seed(101)
#The kmeans() function has an nstart option that attempts multiple initial configurations and reports on the best one. For example, adding nstart=25 will generate 25 initial configurations.
mallCluster <- kmeans(dataset, centers = 3) 
#centers meand no of clusters
mallCluster

mallCluster$cluster

library(cluster)
clusplot(dataset,
         mallCluster$cluster,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 3,
         span = TRUE,
         main = paste('Clusters of customers'),
         xlab = 'Annual Income',
         ylab = 'Spending Score')

set.seed(6)
wcss = vector()
for (i in 1:10) wcss[i] = sum(kmeans(dataset, i)$withinss)
plot(1:10,
     wcss,
     type = 'b',
     main = paste('The Elbow Method'),
     xlab = 'Number of clusters',
     ylab = 'WCSS')

set.seed(29)
kmeans = kmeans(x = dataset, centers = 3)
y_kmeans = kmeans$cluster
y_kmeans


# Visualising the clusters
library(cluster)
clusplot(dataset,
         y_kmeans,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Clusters of customers'),
         xlab = 'Annual Income',
         ylab = 'Spending Score')
