# Lab Exercise 10:
# Exploring Data manipulation with dplyr package.
# In this exercise, you will delve into data manipulation using the dplyr package in R.
# You will perform operations that empower you to filter, select, mutate, group,
# summarize, arrange, and join data frames. The dplyr package provides a streamlined
# approach to enhance your ability to manipulate and transform data efficiently,
# making it a vital tool for data analysis tasks.
# ● Filter and Select: Apply the filter() function to extract rows that satisfy certain
# conditions from a given data frame. Additionally, employ the select() function to
# choose specific columns from the data frame.
# ● Mutate: Utilize the mutate() function to create new variables or modify existing
# ones within the data frame, thus enriching your dataset with calculated values.
# ● Group and Summarize: Harness the power of the group_by() function to group
# data based on specific variables. Then, employ the summarize() function to compute
# summary statistics within each group.
# ● Arrange: Leverage the arrange() function to sort the data frame based on the
# values of selected variables, helping you gain insights from organized data.
# ● Join: Explore the join() function, which allows you to merge multiple data frames
# based on common
library(dplyr)
df <- data.frame(
EMPID= c(101,102,103,104,105),
Name=c("John","peter","bob","Linda","Elizabeth"),
Age=c(25,30,35,40,45),
Salary=c(50000,60000,45000,70000,55000),
Department=c("HR","IT","Finance","Production","QualityControl"))

filtered_data <- filter(df,Age>25)

selected_columns <- select(df, EMPID, Name, Salary)

mutated_data <-mutate(df,Salary_Adjusted=Salary*1.1)

grouped_data <- group_by(df,Department)
summarized_data <-summarize(grouped_data,
Avg_salary=mean(Salary),Max_Age=max(Age))

arranged_data <- arrange(df,Age,desc(Salary))

df2 <- data.frame(
EMPID =c(103,104,105),
Bonus=c(2000,3000,5000)
)
joined_data <- left_join(df,df2,by="EMPID")
print("Filtered Data:")
print(filtered_data)

print("Selected Columns:")
print(selected_columns)

print("Mutated Data:")
print(mutated_data)
print("Summarized Data:")
print(summarized_data)
print("Arranged Data:")
print(arranged_data)
print("Joined Data:")
print(joined_data)
