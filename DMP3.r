# wine dataset
wine<-as.data.frame(read.csv(file="wine2.csv",header = F))
colnames(wine)=abbreviate(c("category","Alcohol","Malic acid","Ash","Alcalinity of ash","Magnesium","Total phenols","Flavanoids","Nonflavanoid phenols","Proanthocyanins","Color intensity","Hue","OD280/OD315 of diluted wines","Proline"))
wine
stndrd<-function(x) return((x-mean(x))/sd(x))
wi<-wine[2:14]
wi<-apply(wi,2,stndrd)
apply(wi,2,mean)
apply(wi,2,sd)
wi

# iris dataset

#1
ir<-iris[1:4]
ir<-apply(ir,2,stndrd)
apply(ir,2,mean)
apply(ir,2,sd)

#2
ir
i<-scale(ir)
i
apply(i,2,mean)
apply(i,2,sd)

#3
library("caret")
i<-preProcess(ir,method = c("center","scale"))
i
x<-predict(i,ir)
x
apply(x,2,mean)
apply(x,2,sd)

