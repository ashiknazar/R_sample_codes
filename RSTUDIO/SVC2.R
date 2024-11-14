dataset = read.csv('C:/Users/91812/Downloads/Commercial.csv')
dataset

library(caTools)
set.seed(123)
split = sample.split(dataset$Sold, SplitRatio = 0.80)
training_set = subset(dataset, split == TRUE)
testing_set = subset(dataset, split == FALSE)


library(e1071)
classifer = svm(formula = Sold ~ .,
                data = training_set,
                type = 'C-classification',
                kernel = 'sigmoid')

summary(classifer)
y_pred_pro = predict(classifer, newdata = testing_set[-3])
y_pred_pro

cm = table(testing_set[,3], y_pred_pro)
cm

error <- mean(y_pred_pro != testing_set[,3])
error
print(paste('Accuracy Overall: ',1 - error))
