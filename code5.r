library(dplyr)

student_data<-data.frame(
Usn=character(0),
Name=character(0),
Mathscore=numeric(0),
Sciencescore=numeric(0),
Historyscore=numeric(0),
Attendence=numeric(0)
)
print(student_data)

# adding students to data frame
addstudent<-function(usn,name,ms,ss,hs,att){
  newstudent<-data.frame(
Usn=usn,
Name=name,
Mathscore=ms,
Sciencescore=ss,
Historyscore=hs,
Attendence=att
  )
  student_data<<-bind_rows(student_data,newstudent)
  cat("student information added")
}

# claculate average scores
calculateaverage<-function(){
  avgscores<-student_data %>%
  mutate(avgscore=(Mathscore+Sciencescore+Historyscore)/3) %>%
  select(Usn,Name,avgscore,Attendence)
  return(avgscores)
}

identifylowattendence<-function(threshold){
  lowattendence<-student_data%>%
  filter(Attendence<threshold)%>%
  select(Usn,Name,Attendence)
  return (lowattendence)
}

generatereport<-function(){
  if(nrow(student_data)==0){
    cat("no student data available for generatin a report\n")
    return ()
  }
  avg_scores<-calculateaverage()
  print(avg_scores)
  lowattendence<-identifylowattendence(70)
  print(lowattendence)
}
while(TRUE){

  cat("\n1. Add Student\n2. Generate Report\n3. Exit\n")
  choice <- as.integer(readline("Enter your choice: "))
  if(choice==1){
     usn <- readline("Enter USN: ")
    name <- readline("Enter student name: ")
    math_score <- as.numeric(readline("Enter math score: "))
    science_score <- as.numeric(readline("Enter science score: "))
    history_score <- as.numeric(readline("Enter history score: "))
    attendance <- as.numeric(readline("Enter attendance percentage: "))
    
    if (is.na(math_score) || is.na(science_score) || is.na(history_score) || is.na(attendance)) {
      cat("Invalid input. Please enter valid numbers for scores and attendance.\n")
      next #iterate again
    }
  addstudent(usn, name, math_score, science_score, history_score, attendance)
  }else if(choice==2){
    generatereport()
  }else if(choice==3){
     cat("Exiting the program. Goodbye!\n")
    break
  }else{
    cat("Invalid choice. Please try again.\n")
  }
}


