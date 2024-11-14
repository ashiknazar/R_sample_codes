dataset = read.csv('C:/Users/91812/Downloads/Position_Salaries.csv')
dataset = dataset[2:3]
dataset

library(e1071)
regressor = svm(formula = Salary~.,
                data = dataset,
                type = 'eps-regression',
                kernel = 'radial')

y_pred = predict(regressor,newdata = dataset[-2])
y_pred


mse <- mean((y_pred-dataset$Salary)^2)
rmse <- sqrt(mse)
mse
rmse
