data <- iris
data

str(data)
View(data)

library(arules)
library(rCBA)
library(rJava)

rules11 <- rCBA::fpgrowth(iris, support = 0.03, confidence = 0.03, maxLength = 2,
                          consequent = "Species", verbose = TRUE, parallel = FALSE)
summary(rules11)
inspect(sort(rules11, by = 'support')[1:10])


library(arulesViz)
plot(rules11,method="graph",engine='interactive')
