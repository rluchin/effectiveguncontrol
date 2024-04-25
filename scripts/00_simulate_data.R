# Load necessary libraries
library(dplyr)

# Set a seed for reproducibility
set.seed(123)

# Create a data frame
data <- data.frame(
  age = sample(18:70, 100, replace = TRUE),  # Random ages between 18 and 70
  gender = sample(c("Male", "Female", "Other"), 100, replace = TRUE, prob = c(0.48, 0.48, 0.04)),  # Gender with a given probability
  normalsex = sample(0:5, 100, replace = TRUE),  # Random scores for 'normalsex'
  analsex = sample(0:5, 100, replace = TRUE),    # Random scores for 'analsex'
  groupsex = sample(0:5, 100, replace = TRUE)    # Random scores for 'groupsex'
)

# Print the first few rows of the dataset to see what it looks like
print(head(data))

# Optional: Save the simulated data to a CSV file
write.csv(data, "data/analysis_data/simulated_sexual_data.csv", row.names = FALSE)