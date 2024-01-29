fineamt<-function(days){
  if(days<=7){
    fine<-0
  }else if(days<=30){
    fine<-2*days
  }else{
    fine<-1000
  }
  return (fine)
}
days<-as.integer(readline("enter the number of days"))
val<-fineamt(days)
if(val==0){
  cat("no fine")
}else{
  if(days<=30){
    cat("fine is ",val,"/n")
  }else{
    cat("reached the cap\n")
  }
}

students <- 5
courses <- 5

for (student in 1:students) {
    for (course in 1:courses) {
        days <- as.integer(readline(sprintf("Enter number of days overdue for Student %d, Course %d: ", student, course)))
        fines <- fineamt(days)
        print(sprintf("Fine for Student %d, Course %d: %d", student, course, fines))
    }
}
