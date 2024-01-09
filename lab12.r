library(readxl)
library(dplyr)
library(ggplot2)

# Load the Dataset
IPL_data <- read.csv("/content/data.csv")
View(IPL_data)

# Task 1: Data Overview and Structure
# Display the structure of the dataset
str(IPL_data)
summary(IPL_data)
# Output summary statistics of numerical columns
summary(IPL_data[, c("win_by_runs", "win_by_wickets")])

# Task 2: Basic Data Insights
# Calculate and display the total number of matches in the dataset
Total_matches <- nrow(IPL_data)
cat("The total number of matches in the dataset is", Total_matches, "\n")

# Determine the number of unique teams that have participated in IPL matches
n_teams <- length(unique(c(IPL_data$team1, IPL_data$team2)))
cat("The number of unique teams that have participated in IPL matches is", n_teams, "\n")
Unique_teams <- unique(c(IPL_data$team1, IPL_data$team2, IPL_data$winner))
cat("The number of unique teams that have participated in IPL matches is", length(Unique_teams), "\n")
cat("The unique teams:", Unique_teams, "\n")

# Task 3: Team Performance Analysis
# Calculate the number of matches won by each team and display the results
Matches_won_by_team <- table(IPL_data$winner)
cat("The number of matches won by each team is:\n")
print(Matches_won_by_team)
# Compute the average win by runs in the matches
avg_runs <- mean(as.numeric(IPL_data$win_by_runs), na.rm = TRUE)
cat("The average total runs scored in matches ", round(avg_runs, 2), "\n")
# Calculate the average win by wickets in the matches
avg_wickets <- mean(as.numeric(IPL_data$win_by_wickets), na.rm = TRUE)
cat("The average total wickets taken in the matches", round(avg_wickets, 2), "\n")

# Task 4: Venue Insights
# Identify and display the most frequently used venue for matches
most_freq_venue <- names(sort(table(IPL_data$venue), decreasing = TRUE)[1])
cat("The most frequently used venue for matches is", most_freq_venue, "\n")

# Task 5: Visualization
matches_won_data <- as.data.frame(Matches_won_by_team)
matches_won_data$Team <- rownames(matches_won_data)
barplot(Matches_won_by_team, main = "Number of Matches Won by Each Team",
xlab = "Team", ylab = "Wins", col = rainbow(n_teams))
