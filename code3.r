calfine<-function(daysoverdue){
    if(daysoverdue<=7){
        fine<-0
    }else if(daysoverdue<=30){
        finepd<-2
        fine<-(daysoverdue-7)*finepd
    } else{
        fine<-400
    }
    return (fine)
}
# daysoverdue<-as.integer(readline("enter the number of days")
daysoverdue<-50
fm<-calfine(daysoverdue)
if(fm==0){
    cat("no fine")
}else{
    if(daysoverdue<=30){
        cat("pay the fine %d",fm)
    }else{
        cat("you exhausted the limit")
    }
}
