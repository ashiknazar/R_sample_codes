data <- kyphosis
data

str(data)

library(arules)
library(rCBA)
library(rJava)

rules11 <- rCBA::fpgrowth(kyphosis, support = 0.0003, confidence = 0.03, maxLength = 2,
                          consequent = "Kyphosis", verbose = TRUE, parallel = FALSE)
summary(rules11)
inspect(sort(rules11, by = 'support')[1:10])


library(arulesViz)
plot(rules11,method="graph",engine='interactive')
