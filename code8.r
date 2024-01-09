library(ggplot2)
library(reshape2)
matrixa<-matrix(c(1,2,3,4,5,6,7,8,9),nrow=3,ncol=3,byrow=TRUE)
matrixb<-matrix(c(9,8,7,6,5,4,3,2,1),nrow=3,ncol=3,byrow=TRUE)

summ<-matrixa+matrixb
scaledmatrix<-matrixa*2
transposedmatrixa<-t(matrixa)
productmatrix<-matrixa%*%matrixb

suma<-sum(matrixa)
meana<-mean(matrixa)
sda<-sd(matrixa)
# heatmap 
heatmap<-melt(matrixa)
heatmap_plot<-ggplot(heatmap,aes(x=Var1,y=Var2,fill=value))+
  geom_tile()+
  scale_fill_gradient(low="white",high="black")+
  labs(title="heatmap of a",x="column",y="row")
print(heatmap_plot)
# barplot
rowsums=rowSums(matrixb)
row_names<-paste("row",1:3)
barplot_data<-data.frame(row=row_names,sum=rowsums)
barplot<-ggplot(barplot_data,aes(x=row,y=rowsums))+
  geom_bar(stat="identity",fill="green")+
  labs(title="sum of row in matrix b ",x="row",y="sum")
print(barplot)
