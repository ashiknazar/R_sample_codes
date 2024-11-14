dataset = read.csv("C:/Users/91812/Desktop/python/Social_Network_Ads.csv")
dataset 
dataset = dataset[3:5]
dataset
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
testing_set = subset(dataset, split == FALSE)

training_set[-3] = scale(training_set[-3])
training_set[-3]
testing_set[-3] = scale(testing_set[-3])
testing_set[-3]

library(e1071)
classifier = svm(formula = Purchased ~ .,
                 data = training_set,
                 type = 'C-classification',
                 kernel = 'linear')


# This implies that you are building a binary classification model where "C" refers to the cost parameter, used to control the trade-off between maximizing the margin and minimizing the classification error.


y_pred = predict(classifier, newdata = testing_set[-3])
y_pred

cm = table(testing_set[, 3], y_pred)
cm

error <- mean(y_pred != testing_set[,3])
print(paste('Accuracy Overall: ',1 - error))

