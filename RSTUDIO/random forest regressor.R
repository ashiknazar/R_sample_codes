#RANDOM FOREST REGRESSOR

#install.packages('randomForest')

dataset = read.csv('C:/Users/91812/Downloads/Position_Salaries.csv')
dataset
dataset = dataset[2:3]
dataset

library(randomForest)
regressor = randomForest(x= dataset[1],
                         y= dataset$Salary,
                         ntree=500)

#dataset[1]
#dataset[2]

summary(regressor)

y_pred = predict(regressor,newdata = dataset)
y_pred

mse <- mean((y_pred-dataset$Salary)^2)
mse
rmse <- sqrt(mse)
rmse
