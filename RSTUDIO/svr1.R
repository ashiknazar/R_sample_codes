data(cars)
dataset = cars
dataset

plot(dataset$speed,dataset$dist)

library(caTools)
spilt = sample.split(dataset$dist, SplitRatio = 0.7)
training_set = subset(dataset,spilt==TRUE)
testing_set = subset(dataset,spilt==FALSE)

library(e1071)
regressor = svm(formula = dist~speed,
                data = training_set,
                type = 'eps-regression',
                kernel='linear')

#Epsilon-SVR is a variant of SVM used for regression tasks. It allows for some deviation (controlled by the parameter epsilon) between the predicted values and the actual target values.

summary(regressor)

y_pred_training_set = predict(regressor,newdata = training_set)
y_pred_training_set
y_pred_testing_set = predict(regressor,newdata = testing_set)
y_pred_testing_set

mse <- mean((y_pred_testing_set-testing_set$dist)^2)
rmse <- sqrt(mse)
mse
rmse
