install.packages("arules")
install.packages("arulesViz")
update.packages("datasets")

library("arules")
library("arulesViz")
library("datasets")

data("Groceries")# after arules installing and including
inspect(Groceries[1:10])
r<-apriori(Groceries,parameter = list(support=0.05,conf=0.1,minlen=2))
d<-inspect(r)
bakery<-read.transactions("1000-out1.csv")
inspect(bakery)
bakery
r<-apriori(bakery,parameter = list(support=0.04,conf=0.3,minlen=2))

inspect(r)

bakery<-read.transactions("1000i.csv")
inspect(bakery)
bakery
r<-apriori(bakery,parameter = list(support=0.0005,conf=0.1,minlen=2))
inspect(r)