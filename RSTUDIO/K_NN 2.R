dataset = read.csv('C:/Users/91812/Downloads/Commercial.csv')
dataset

library(caTools)
set.seed(123)
split = sample.split(dataset$Sold, SplitRatio = 0.80)
training_set = subset(dataset, split == TRUE)
testing_set = subset(dataset, split == FALSE)

library(class)
y_pred = knn(train = training_set[-3],
             test = testing_set[-3],
             cl = training_set[,3],
             k = 2,
             prob = TRUE)
#cl- ytrain #k -number of neighbours

summary(y_pred) 
y_pred


cm = table(testing_set[,3], y_pred)
cm

mv <- mean(y_pred != testing_set[,3])
print(paste('Accuracy Overall: ',1 - mv))

