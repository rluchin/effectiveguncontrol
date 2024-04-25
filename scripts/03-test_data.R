#Tests for both the ratings-cleaned Parquet file and the average-agescore Parquet file.

# Load necessary libraries
library(arrow)
library(dplyr)
library(ggplot2)
library(nortest)  # For normality test

# Read the cleaned datasets
ratings_data <- read_parquet("data/analysis_data/taboo-ratings-cleaned.parquet")
average_data <- read_parquet("data/analysis_data/taboo-average-agescore.parquet")

# Test 1: Structure check and summarization 
print("Structure of Ratings Data:")
str(ratings_data)
print("Structure of Average Data:")
str(average_data)

# Print summary statistics
print("Summary of Ratings Data:")
summary(ratings_data)
print("Summary of Average Data:")
summary(average_data)

# Test 2: Data integrity check - count NA values to ensure absence
na_count_ratings <- sum(is.na(ratings_data))
na_count_average <- sum(is.na(average_data))

print(paste("Total NA values in Ratings Data: ", na_count_ratings))
print(paste("Total NA values in Average Data: ", na_count_average))

# Test 3. Visualize distribution of key variable
# For Ratings Data
if("normalsex" %in% names(ratings_data)) {
  ggplot(ratings_data, aes(x = normalsex)) +
    geom_histogram(bins = 10, fill = "blue") +
    labs(title = "Distribution of 'Normalsex' Ratings", x = "Rating", y = "Frequency") +
    theme_minimal()
}

# For Average Data
if("average" %in% names(average_data)) {
  ggplot(average_data, aes(x = average)) +
    geom_histogram(bins = 10, fill = "green") +
    labs(title = "Distribution of Average Scores by Age", x = "Average Score", y = "Frequency") +
    theme_minimal()
}

# Test 4. Normality Testing
# For Ratings Data
if("normalsex" %in% names(ratings_data)) {
  normalsex_p_value <- ad.test(ratings_data$normalsex, na.action = na.omit)$p.value
  print(paste("Anderson-Darling test p-value for 'normalsex':", normalsex_p_value))
}

# For Average Data
if("average" %in% names(average_data)) {
  average_p_value <- ad.test(average_data$average, na.action = na.omit)$p.value
  print(paste("Anderson-Darling test p-value for 'average':", average_p_value))
}

# Output results
print("Data integrity, distributions, and normality tests completed.")
