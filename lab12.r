library(dplyr)
library(ggplot2)
library(readxl)
ipl<-read.csv("/content/data.csv")
print(ipl)
str(ipl)
summary(ipl)

total<-nrow(ipl)
print(total)
unq<-unique(c(ipl$team1,ipl$team2))
print(unq)
print(length(unq))

wins<-ipl%>% 
  count(winner)%>%
  arrange(desc(n))
  print(wins)

avgruns<-mean(ipl$win_by_runs)
print(avgruns)

avgwk<-mean(ipl$win_by_wickets)
print(avgwk)

mostvenue<-names(which.max(table(ipl$venue)))
print(mostvenue)

bar<-ggplot(wins,aes(x=winner,y=n))+geom_bar(stat="identity",fill="green")+labs(title="barploting",x="most wins",y="frequency")
print(bar)
