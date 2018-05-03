install.packages("editrules")
library("editrules")

file1<-read.csv(file="people.txt",sep="\t")
file1

rules<-editfile(file="rules.txt")
rules
plot(rules)

r1<-violatedEdits(rules,file1)
r1
summary(r1)
plot(r1)

#modifications
file2<-file1
file2$Age[4]=70
file2$Age[3]=38
file2

r2<-violatedEdits(rules,file2)
summary(r2)
plot(r2)