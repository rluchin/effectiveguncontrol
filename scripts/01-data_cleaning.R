#Cleans the original Raw CSV and saves newly cleaned data set as a Parquet file


# Load the raw data
data <- read_csv("data/raw_data/taboo-ratings-raw.csv")

# Initial cleaning: remove specified columns and columns with bracketed codes
data <- data %>%
  select(-c(User, Run, `Program Version`, `Time Started (UTC)`, `Time Finished (UTC)`,
            `Minutes Spent`, Position, Points, arousalScale, `Your age? (rkkox57)`)) %>%
  select(-matches("\\(.*\\)"))

# Further clean data by removing rows where 'selfage' is NA
data_cleaned <- filter(data, !is.na(selfage))

# Save the cleaned data as a Parquet file, only once after all cleaning is done
write_parquet(data_cleaned, "data/analysis_data/taboo-ratings-cleaned.parquet")

# Verify the operation by inspecting the first few rows of the cleaned data
head(data_cleaned)
