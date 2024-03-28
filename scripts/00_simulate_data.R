# Generate example data for state, % of sex crime convictions, and state age of consent
set.seed(123) # for reproducibility

# List of states
states <- c("Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "Florida", "Georgia", 
            "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", 
            "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", 
            "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", 
            "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", 
            "West Virginia", "Wisconsin", "Wyoming")

# Simulate % of sex crime convictions (assuming it's a percentage)
percent_convictions <- round(runif(length(states), min = 0, max = 10), 2)

# Simulate state age of consent (assuming it's an age)
age_of_consent <- sample(16:18, length(states), replace = TRUE)

# Create a data frame
simulated_data <- data.frame(State = states,
                             Conviction_Percentage = percent_convictions,
                             Age_of_Consent = age_of_consent)

# Display first few rows of the data
head(simulated_data)