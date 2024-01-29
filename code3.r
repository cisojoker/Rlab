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
