data <- read.xlsx("insurance_data.xlsx")
head(data)
print(colnames(data))
# Print the type of each column
column_types <- sapply(data, class)
print(column_types)




# Load necessary libraries
library(openxlsx)

# Load the data
data <- read.xlsx("insurance_data.xlsx", sheet = 1)

# Convert Renewed to factor (if not already done)
data$Renewed <- as.factor(data$Renewed)

# Check for missing values in the relevant columns
sum(is.na(data$Actual.Change.in.Price.vs.last.Year))
sum(is.na(data$Renewed))

# (Optional) Remove rows with missing values in these columns
data <- na.omit(data[, c("Actual.Change.in.Price.vs.last.Year", "Renewed")])

# Build the logistic regression model
model <- glm(Renewed ~ Actual.Change.in.Price.vs.last.Year, 
             family = binomial(link = "logit"), 
             data = data)

# Summary of the model
summary(model)

# Make predictions on the training set
predicted_probs <- predict(model, type = "response")

# Convert probabilities to class labels (0 or 1)
predicted_classes <- ifelse(predicted_probs > 0.5, 1, 0)

# Create a confusion matrix
confusion_matrix <- table(data$Renewed, predicted_classes)
print(confusion_matrix)

# Calculate accuracy
accuracy <- sum(diag(confusion_matrix)) / sum(confusion_matrix)
print(paste("Accuracy:", round(accuracy, 4)))



