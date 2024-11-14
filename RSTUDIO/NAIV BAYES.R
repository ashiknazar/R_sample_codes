data(iris)
data <- iris
data

library(caTools)
library(e1071)

set.seed(123)
split = sample.split(data$Species, SplitRatio = 0.75)

training_set<-subset(data,split="TRUE")
training_set
testing_test<-subset(data,split="FALSE")
testing_test

classifier = naiveBayes(x=training_set[-5],y=training_set$Species)
classifier

y_pred = predict(classifier,newdata = testing_test[-5])
y_pred

cm = table(testing_test[,5],y_pred)
cm

err <- mean(y_pred != testing_test[,5])
err
print(paste('accuracy overall:',1-err))
