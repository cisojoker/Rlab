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
