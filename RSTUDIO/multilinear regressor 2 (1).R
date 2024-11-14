dataset = read.csv('50_startups.csv')
dataset

#encoding catagorical data
dataset$State = factor(dataset$State,levels = c('New York','California','Florida',
                                                labels =c(1,2,3)))

#spliting the dataset
library(caTools)
split = sample.split(dataset$Profit,SplitRatio = 0.8)
training_set = subset(dataset , split==TRUE)
testing_set = subset(dataset , split==FALSE)

regressor =lm(formula = Profit~.,data = training_set)
y_pred = predict(regressor,newdata = testing_set)
y_pred

print(mean(regressor$residuals))
mse <- mean((y_pred-testing_set$Profit)^2)
mse
rmse <- sqrt(mse)
rmse
