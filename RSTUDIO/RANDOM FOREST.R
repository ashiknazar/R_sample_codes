library(gam)

data("kyphosis")
data <- kyphosis
data

summary(kyphosis)

levels(kyphosis$Kyphosis)
library(caTools)
set.seed(123)
split = sample.split(data$Kyphosis, SplitRatio = 0.75)
training_set = subset(data, split == TRUE)
test_set = subset(data, split == FALSE)
training_set
test_set

# install.packages('randomForest')
library(randomForest)
set.seed(123)
classifier = randomForest(x = training_set[-1],
                          y = training_set$Kyphosis,
                          ntree = 500)

# Predicting the Test set results
y_pred = predict(classifier, newdata = test_set[-1])
y_pred

# Making the Confusion Matrix
cm = table(test_set[, 1], y_pred)
cm

mv <- mean(y_pred != testing_set[,1])
print(paste('Accuracy Overall: ',1 - mv))
