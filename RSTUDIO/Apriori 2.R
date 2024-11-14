dataset = read.csv("Online_Retail.csv", header = FALSE)
dataset

dataset = read.transactions('Online_Retail.csv', sep = ',', rm.duplicates = TRUE)
summary(dataset)
dataset


itemFrequencyPlot(dataset, topN = 10,type="absolute")

library(arules)
rules = apriori(data = dataset, parameter = list(support = 0.004, confidence = 0.2),
                appearance = list(default="lhs",rhs="DOORMAT NEW ENGLAND "),
                control = list(verbose=F))#rules1)

inspect(sort(rules, by = 'lift')[1:10])
rules1 <-sort(rules, decreasing=TRUE,by="confidence")
rules1
inspect(rules1[1:5])


library(arulesViz)
plot(rules1[1:15],method="graph",engine='interactive')

