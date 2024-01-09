library(dplyr)
library(ggplot2)

purchase_data<-data.frame(
  cid=c(101,102,103,104,105),
  pa=c(150,200,120,300,80)
)

meanp<-mean(purchase_data$pa)
medianp<-median(purchase_data$pa)
sdp<-sd(purchase_data$pa)
q1p<-quantile(purchase_data$pa,probs=0.25)
q3p<-quantile(purchase_data$pa,probs=0.75)

cat("mean purchase amount",meanp,"\n")
cat("median purchase amount",medianp,"\n")
cat("sd  purchase amount",sdp,"\n")
cat("quantile one purchase amount",q1p,"\n")
cat("quantile three purchase amount",q3p,"\n")

ggplot(purchase_data,aes(x=pa))+geom_histogram(binwidth=50,fill="red",color="yellow")+
  labs(title="distribution of purchase amount ",x="purchase amount",y="frequency")
