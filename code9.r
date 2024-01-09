# You are a data analyst tasked with analyzing and visualizing a dataset.
# The dataset contains information about student performance in a
# course. You need to create a program that generates various types
# of plots to help understand and present the data effectively. Write a
# program that performs data analysis and generates visualizations for
# a given dataset.
# The program should:
# • Load the necessary libraries (ggplot2).
# • Prepare example data with columnsforstudent names,scores,
# and attendance percentages.
# Perform the following tasks:
# [1] Create a scatter plot to visualize the relationship between
# scores and attendancepercentages.
# [2] Generate a bar plot to show the distribution of scores among
# different students.
# [3] Create a line plot to display the trend of scores over time
# (assuming different students' scores were collected at
# different time intervals).
# [4] Generate a histogram to visualize the distribution of scores.
# • Customize the appearance of each plot, such as color, labels,
# and titles.
# • Arrange the plots in a way that they are easy to compare and
# understand.

# • Provide appropriate titles for each plot and the axes.

# Note: The student data created for visualization should be uniquely
# created with respect to the number of students, names , scores,
# column names by each one of you.
library(ggplot2)
library(gridExtra)
set.seed(123)
num_students <- 15
students <- data.frame(
  Name = paste("S", 1:num_students),
  Scores = sample(60:100, num_students, replace = TRUE),
  Attendance = sample(60:100, num_students, replace = TRUE)
)

scatter_plot <- ggplot(students, aes(x = Scores, y = Attendance)) +
  geom_point(color = "red") +
  labs(title = "Scatter Plot - Scores vs Attendance", x = "Scores", y = "Attendance")

students$Time <- seq_len(num_students)
line_plot <- ggplot(students, aes(x = Time, y = Scores, group = 1)) +
  geom_line(color = "purple") +
  labs(title = "Line Plot - Trend of Scores Over Time", x = "Time", y = "Scores")

bar_plot <- ggplot(students, aes(x = Name, y = Scores)) +
 geom_bar(stat="identity",fill="red")+
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  labs(title = "Bar Plot - Distribution of Scores", x = "Student Names", y = "Scores")


histogram_plot <- ggplot(students, aes(x = Scores)) +
  geom_histogram(binwidth = 10, color = "brown", fill = "blue") +
  labs(title = "Distribution of Scores", x = "Scores", y = "Frequency")

print(histogram_plot)

grid.arrange(scatter_plot, bar_plot, line_plot, histogram_plot, nrow=2)
