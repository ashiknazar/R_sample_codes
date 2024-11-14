library(datasets)
data(iris)
summary(iris)
data <- iris
data



library(caTools)
set.seed(123)
split = sample.split(data$Species, SplitRatio = 0.75)
training_set = subset(data, split == TRUE)
training_set
testing_set = subset(data, split == FALSE)
testing_set



library(rpart)
classifier = rpart(formula = Species ~ .,method = 'class',
                   data = training_set)

plot(classifier)
text(classifier)


library(rpart.plot)
rpart.plot(classifier)


y_pred = predict(classifier, newdata = testing_set[-5],type = 'class')
y_pred



cm = table(testing_set[, 5], y_pred)
cm



mv <- mean(y_pred != testing_set[,5])
print(paste('Accuracy Overall: ',1 - mv))
