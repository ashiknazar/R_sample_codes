library(arules)

data(Groceries)
data <- Groceries

data
View(data)

inspect(head(Groceries))
str(Groceries)
summary(Groceries)

itemFrequencyPlot(Groceries,topN=20,type="absolute") #item freq counts will b an absolute value so typ='absolute


rules <- apriori(Groceries, parameter = list(supp = 0.001, conf = 0.8))
rules

inspect(sort(rules, by = 'lift')[1:10])


rules1 <-apriori(data=Groceries, parameter=list(supp=0.001,conf = 0.08), 
                 appearance = list(default="lhs",rhs="whole milk"),
                 control = list(verbose=F))#rules1

rules1 <-sort(rules1, decreasing=TRUE,by="confidence")
rules1
inspect(rules1[1:5])


library(arulesViz)
plot(rules1,method="graph",interactive=TRUE)

