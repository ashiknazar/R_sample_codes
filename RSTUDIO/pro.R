library('readxl')
data=read_excel(file.choose())
data
View(data)
summary(data)
table(data$'Renewed?')
sum(is.na(data))
which(is.na(data))
#print(sum(is.na(data)))  # TO FIND THE COUNT OF NULLVALUES IN THE DATA
colSums(is.na(data))

####################################################################
#null value omiting#####
data<-na.omit(data)
View(data)
sum(is.na(data))
colSums(is.na(data))
which(is.na(data))
####################################################
##Encoding#####

data$'Marital Status'= factor(data$'Marital Status',levels=c("D","M","S","V","W"),
                             labels=c(1,2,3,4,5))
data$'Gender'= factor(data$'Gender',levels=c("C","M","F"),
                             labels=c(1,2,3))
data$'Payment Method'= factor(data$'Payment Method',levels=c("Annual","Monthly"),
                      labels=c(1,2))
data$'Acquisition Channel'= factor(data$'Acquisition Channel',levels=c("Aggreg","Direct","Inbound","Outbound"),
                              labels=c(1,2,3,4))
View(data)
table(data$'Acquisition Channel')


################################################################################


#######fitting model####################

library(caTools)
set.seed(123)
split = sample.split(data$`Renewed?`, SplitRatio = 0.75)
training_set =subset(data, split == TRUE)
training_set
testing_set =subset(data, split == FALSE)
testing_set

model <- glm(formula=data$'Renewed?'~ + data$'Car Value'+ data$'Marital Status'+ data$'AGE' + data$'Gender' + data$'Car Value' + data$'Years of No Claims Bonus' + data$'Annual Mileage' + data$'Payment Method' + 
               data$'Acquisition Channel' + data$'Years of Tenure with Current Provider', data = training_set, family = binomial)

#model <- glm(formula=data$'Renewed?'~+ data$'AGE' + data$'Years of No Claims Bonus' + data$'Payment Method' + 
                #+ data$'Years of Tenure with Current Provider', data = training_set, family = binomial)


summary(model)

y_pred_prob = predict(model,type = 'response',newdata = testing_set[-14])
y_pred_prob


y_pred_final=ifelse(y_pred_prob>0.5,1,0)
y_pred_final


############CONFUSIN MATRIX####################
cm=table(testing_set[,14],y_pred_final)
cm



########################Accuracy##############################

error=mean(y_pred_final != testing_set[,14])
error
print(paste('Accuracy overall:',1-error))




#############decision tree############



library(caTools)
set.seed(123)
split = sample.split(data$"Renewed?", SplitRatio = 0.80)
training_set = subset(data, split == TRUE)
testing_set = subset(data, split == FALSE)

library(rpart)
classifier = rpart(formula = "Renewed?" ~ .,method = 'class',
                   data = training_set)

library(rpart.plot)
rpart.plot(classifier)

y_preda = predict(classifier, newdata = testing_set[-14],type = 'class')
y_preda


cm = table(testing_set[, 14], y_preda)
cm



error <- mean(y_preda != testing_set[,14])
print(paste('Accuracy Overall: ',1 - error))


