library(readr)
library(dplyr)
library(readxl)

# Read the CSV file into a data frame
purchase_data <- read_csv("customerpurchases.csv")

# Get the total number of records
total_records <- nrow(purchase_data)

# Get the total number of unique customers using n_distinct
total_unique_customers <- n_distinct(purchase_data$Customer_ID)

cat("Total number of records:", total_records, "\n")
cat("Total unique customers:", total_unique_customers, "\n")

# Calculate mean, median, and standard deviation of purchase amounts
mean_purchase_amount <- mean(purchase_data$Purchase_Amount)
median_purchase_amount <- median(purchase_data$Purchase_Amount)
std_dev_purchase_amount <- sd(purchase_data$Purchase_Amount)

cat("Mean purchase amount:", mean_purchase_amount, "\n")
cat("Median purchase amount:", median_purchase_amount, "\n")
cat("Standard deviation of purchase amounts:", std_dev_purchase_amount, "\n")

# Create a new variable 'segment' based on the median purchase amount
purchase_data$segment <- ifelse(purchase_data$Purchase_Amount < median_purchase_amount, "low spender", "high spender")

# Print the updated data frame
print(purchase_data)

# Create a histogram of purchase amounts
hist(purchase_data$Purchase_Amount, main = "Distribution of Purchase Amounts", xlab = "Purchase Amount", col = "red", border = "black")
