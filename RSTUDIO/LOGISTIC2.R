dataset = read.csv('C:/Users/91812/Downloads/Commercial.csv')
dataset

library(caTools)
split = sample.split(dataset$Sold, SplitRatio = 0.80)
training_set = subset(dataset, split == TRUE)
testing_set = subset(dataset, split == FALSE)

classifer = glm(formula = Sold ~ .,
                family = binomial,
                data =training_set )
summary(classifer)

y_pred_prob = predict(classifer,type = 'response',newdata = testing_set)
y_pred_prob

y_pred = ifelse(y_pred_prob > 0.5, 1, 0)
y_pred

cm = table(testing_set[,3], y_pred)
cm

mv <- mean(y_pred != testing_set[,3])
print(paste('Accuracy Overall: ',1 - mv))