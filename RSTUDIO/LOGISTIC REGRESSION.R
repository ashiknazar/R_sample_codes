dataset = read.csv("C:/Users/91812/Desktop/python/Social_Network_Ads.csv")
dataset
dataset = dataset[3:5]
dataset
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased,SplitRatio = 0.75)

training_set = subset(dataset,split==TRUE)
testing_set = subset(dataset,split==FALSE)
training_set[-3]
#training_set[c(1,2)]

#feature_scaling
training_set[-3] = scale(training_set[-3])
testing_set[-3] = scale(testing_set[-3])
training_set[-3]

classifier = glm(formula = Purchased~.,
                 family = binomial,
                 data = training_set)

#predicting the prob
prob_pred = predict(classifier, type = 'response', newdata = testing_set[-3])
prob_pred

y_pred = ifelse(prob_pred > 0.5, 1, 0)
y_pred

cm = table(testing_set[, 3], y_pred )
cm
#acuuracy of the model
mv <- mean(y_pred != testing_set[,3])
print(paste('Accuracy Overall: ',1 - mv))