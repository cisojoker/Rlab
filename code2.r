nostudent<-6
nocourses<-5

studentnames<-c("KING","Sohan","Mithali","Rahul","Jahal A R", "Suresh")

coursemarks<-matrix(c(
  85, 92, 78, 88, 95,
  75, 80, 85, 70, 60,
  100,78,56,34,56,
  78,45,67,89,90,
  89,80,67,78,90,
  80, 75, 70, 80, 90
),nrow=nostudent,byrow=TRUE)
print(coursemarks)

studentrecords<-list()
for(si in 1:nocourses){
  studentname=studentnames[si]
  totalmarks<-sum(coursemarks[si,])
  averagemarks<-totalmarks/nocourses
  
  grade<-ifelse(averagemarks>=90,"A",
  ifelse(averagemarks>=80,"B",
  ifelse(averagemarks>=70,"c",
  ifelse(averagemarks>=60,"d","e"))))
  
  studentrecord<-list(name=studentname,marks=coursemarks[si,],total=totalmarks,average=averagemarks,grade=grade)
  studentrecords<-append(studentrecords,list(studentrecord))
}

# display the result
cat("\nStudent Grade Report:\n") 
for (record in studentrecords)
{
  
  cat("\nName:", record$name, "\n") 
  cat("Marks:", record$marks, "\n") 
  cat("Total Marks:", record$total, "\n") 
  cat("Average Marks:", record$average, "\n") 
  cat("Grade:", record$grade, "\n")
  
}
