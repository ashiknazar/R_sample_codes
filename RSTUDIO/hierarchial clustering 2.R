dataset = read.csv('Mall_Customers.csv')
dataset
dataset = dataset[4:5]
dataset


dgram = hclust(d = dist(dataset, method = 'euclidean'), method = 'ward.D')

plot(dgram,
     main = paste('Dendrogram'),
     xlab = 'Customers',
     ylab = 'Euclidean distances')

y_hc = cutree(dgram, 5)
y_hc


library(cluster)
clusplot(dataset,
         y_hc,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels= 5,
         plotchar = TRUE,
         span = TRUE,
         main = paste('Clusters of customers'),
         xlab = 'Annual Income',
         ylab = 'Spending Score')