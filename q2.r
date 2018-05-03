library("editrules")
datasetlink <- "https://raw.githubusercontent.com/edwindj/datacleaning/master/data/dirty_iris.csv"
download.file(datasetlink, "dirtyiris.csv")

d_iris<-read.csv(file="dirtyiris.csv")
d_iris[142,2]=NaN
d_iris[149,3]=Inf
d_iris
remove_inf<-function(x){
  for(i in 1:length(x)){
    if(is.infinite(x[i]) | is.nan(x[i]))
      x[i]=NA
  }
  x
}
for( i in 1:length(d_iris)){
  d_iris[,i]=remove_inf(d_iris[,i])
}
d<-na.omit(d_iris)  # removes NA and NaNs not Inf
d

paste("Number of complete entries ",nrow(d))
paste("%age of complete entries ",nrow(d)/nrow(d_iris)*100)

rules_iris<-editfile(file="rules_iris.txt")
rules_iris

plot(rules_iris)

v1<-violatedEdits(rules_iris,d_iris)
summary(v1)
plot(v1)

v2<-violatedEdits(rules_iris,d)

summary(v2)
plot(v2)

boxplot(d$Sepal.Length)
boxplot.stats(d$Sepal.Length)

