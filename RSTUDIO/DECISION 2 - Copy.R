data <- read.csv('C:/Users/91812/Downloads/loan_data.csv')
data

library(caTools)
set.seed(123)
split = sample.split(data$not.fully.paid, SplitRatio = 0.80)
training_set = subset(data, split == TRUE)
testing_set = subset(data, split == FALSE)

library(rpart)
classifier = rpart(formula = not.fully.paid ~ .,method = 'class',
                   data = training_set)

library(rpart.plot)
rpart.plot(classifier)

y_pred = predict(classifier, newdata = testing_set[-14],type = 'class')
y_pred


cm = table(testing_set[, 14], y_pred)
cm



error <- mean(y_pred != testing_set[,14])
print(paste('Accuracy Overall: ',1 - error))
