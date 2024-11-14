dataset <- iris[, -5]
dataset


plot(dataset$Sepal.Length, dataset$Sepal.Width)


dgram = hclust(d = dist(dataset, method = 'euclidean'),
                   method = 'ward.D')
dgram
summary(dgram)


plot(dgram, xlab='Length/Width', ylab = 'Height')


y_hc = cutree(dgram,3)
y_hc


library(cluster)
clusplot(dataset, y_hc,
         shade = TRUE,
         color = TRUE,
         labels = 3,
         plotchar =TRUE,
         span = TRUE,
         main = 'HC Chart',
         xlab='Length/Width', ylab = 'Height')

