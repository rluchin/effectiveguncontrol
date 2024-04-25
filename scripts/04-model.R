#Create simple linear model and save to agescore_lm.rds

# Read the dataset from the Parquet file
data <- read_parquet("data/analysis_data/taboo-average-agescore.parquet")

# Fit the linear model
model <- lm(average ~ selfage, data = data)

# Save the model to an RDS file
saveRDS(model, "models/agescore_lm.rds")

# Optionally, to verify saving and view a summary of the model
loaded_model <- readRDS("models/agescore_lm.rds")
summary(loaded_model)
