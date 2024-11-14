dataset = read.csv("C:/Users/91812/Desktop/python/Social_Network_Ads.csv")

dataset=dataset[3:5]
head(dataset)

library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])

library(class)
y_pred = knn(train = training_set[, -3],
             test = test_set[, -3],
             cl = training_set[, 3],
             k = 5,
             prob = TRUE)

cm = table(test_set[, 3], y_pred)
cm

mv <- mean(y_pred != test_set[,3])
mv
print(paste('Accuracy Overall: ',1 - mv))

