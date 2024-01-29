ns<-10;
nc<-5
snames=c("a","b","c","d","e","f","G","h","i","j")
cmarks<-matrix(c(10,20,30,40,50,
                 60,70,80,90,10,
                 20,30,40,50,60,
                 70,80,90,10,20,
                 30,40,50,60,70,
                 20,30,40,50,60,
                 80,90,10,20,30,
                 20,30,40,50,60,
                 20,30,40,50,60,
                 30,40,50,60,70
                 ),nrow=ns,byrow="TRUE")
  print(cmarks)
  strecord<-list()
  for(i in 1:ns){
       stname=snames[i];
       total<-sum(cmarks[i,])
       avg=total/nc
       grade<-ifelse(avg>=90,'A',
       ifelse(avg>=80,'B',
       ifelse(avg>=70,'C',
       ifelse(avg>=60,'D',
       ifelse(avg>=50,'E',
       ifelse(avg<60,'f'))))))
       student<-list(name=stname,marks=cmarks[i,],total=total,average=avg,grade=grade)
       strecord<-append(strecord,list(student))
  }
cat("student information\n")
for(i in strecord)
{
    # print(i$name)
    # print(i$marks)
    # print(i$total)
    # print(i$average)
    # print(i$grade)
    cat("\n")
    cat("name:",i$name,"\n")
    cat("marks:",i$marks,"\n")
    cat("total:",i$total,"\n")
    cat("average:",i$average,"\n")
    cat("grade:",i$grade,"\n")
}
