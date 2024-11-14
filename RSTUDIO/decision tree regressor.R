#DECISION TREE
dataset = read.csv('C:/Users/91812/Downloads/Position_Salaries.csv')
dataset
dataset = dataset[2:3]
dataset

library(rpart)
regressor = rpart(formula = Salary~., data = dataset,
                  control = rpart.control(minsplit = 2))
summary(regressor)

y_pred = predict(regressor,newdata = dataset)
y_pred
print(regressor)

mse <- mean((y_pred-dataset$Salary)^2)
rmse <- sqrt(mse)
mse
rmse
