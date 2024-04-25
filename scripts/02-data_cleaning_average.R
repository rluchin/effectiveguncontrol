#Creates secondary clean dataset for modelling purposes, saves as Parquet

# Read the cleaned data from the Parquet file
data <- read_parquet("data/analysis_data/taboo-ratings-cleaned.parquet")

# Check if 'selfage' exists and is properly formatted
if (!"selfage" %in% colnames(data)) {
  stop("Column 'selfage' does not exist in the dataset")
}

# Extract 'selfage' separately
selfage_data <- select(data, selfage)

# Select only numeric columns for the average calculation, ensuring 'selfage' is excluded if it's numeric
numeric_data <- select(data, where(is.numeric))
if ("selfage" %in% colnames(numeric_data)) {
  numeric_data <- select(numeric_data, -selfage)
}

# Combine 'selfage' back with numeric columns
combined_data <- bind_cols(selfage_data, numeric_data)

# Calculate the mean of all numeric columns for each 'selfage'
average_data <- combined_data %>%
  group_by(selfage) %>%
  summarise(across(everything(), mean, na.rm = TRUE), .groups = "drop")

# Create a new dataset with 'selfage' and 'average' of other numeric columns
final_dataset <- average_data %>%
  transmute(selfage, average = rowMeans(select(., -selfage), na.rm = TRUE))

# Save the new dataset to a new Parquet file
write_parquet(final_dataset, "data/analysis_data/taboo-average-agescore.parquet")

# Inspect the final dataset
head(final_dataset)
