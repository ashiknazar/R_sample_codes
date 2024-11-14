data(cars)
data = cars
data
plot(data$speed,data$dist)
#splitting the datset into training and testing
#install.packages('caTools')
library(caTools)
split = sample.split(data$speed,SplitRatio = 0.70)
split
training_set = subset(data,split==TRUE)  ## split 70 will go train rest will
testing_set = subset(data,split==FALSE)   # go to test
training_set
testing_set
#fitting with linear regressor
regressor = lm(formula = dist ~ speed,data=training_set)
summary(regressor)
#predict the value
y_pred_training_set = predict(regressor,newdata = training_set)
y_pred_testing_set = predict(regressor,newdata = testing_set)
y_pred_testing_set
y_pred_training_set
#visualising the dats with plot and linewidth
plot(training_set$speed,training_set$dist)
lines(training_set$speed,y_pred_training_set)

plot(testing_set$speed,testing_set$dist)
lines(testing_set$speed,y_pred_testing_set)

#visualising using ggplot
library(ggplot2)
ggplot() +geom_point(aes(x=training_set$speed,y=training_set$dist),color='red') +
        geom_line(aes(x=training_set$speed,y=y_pred_training_set),color='blue') +
        ggtitle('linear regression') + xlab('speed') + ylab('distance')

print(mean(regressor$residuals))
mse <- mean((y_pred_testing_set-testing_set$dist)^2)
print(mse)
rmse <- sqrt(mse)
rmse

