install.packages("caret")
install.packages("RWeka")
install.packages("lubridate")

library("caret")
library("RWeka")


ir<-iris

#a). 75%- 25%

train_no<-createDataPartition(ir$Species,p = 0.75,list=F)
train_set<-ir[train_no,]
train_set

test_set<- ir[-train_no,]
test_set
View(test_set)
## HOLDOUT METHOD

#naive bayes
x<-train(Species~.,train_set,preProcess = NULL,method="nb",trControl=trainControl(method = "LGOCV",number=1))
y<-predict(x,test_set)
confusionMatrix(y,test_set$Species)

i<-preProcess(train_set,method = c("center","scale"))
out<-predict(i,test_set)
out
apply(out[1:4],2,mean)
apply(out[1:4],2,sd)

#decision tree
x<-train(Species~.,train_set,preProcess = NULL,method="J48",trControl=trainControl(method = "LGOCV",number=1))
y<-predict(x,test_set)
confusionMatrix(y,test_set$Species)

#knn
x<-train(Species~.,train_set,preProcess = NULL,method="knn",trControl=trainControl(method = "LGOCV",number=1))
predict(x,test_set)
confusionMatrix(x)

## RANDOM SUBSAMPLING METHOD

#naive bayes
x<-train(Species~.,train_set,preProcess = NULL,method="nb",trControl=trainControl(method = "LGOCV"))
predict(x,test_set)
confusionMatrix(x)

#decision tree
x<-train(Species~.,train_set,preProcess = NULL,method="J48",trControl=trainControl(method = "LGOCV"))
predict(x,test_set)
confusionMatrix(x)

#knn
x<-train(Species~.,train_set,preProcess = NULL,method="knn",trControl=trainControl(method = "LGOCV"))
predict(x,test_set)
confusionMatrix(x)

## CROSS VALIDATION METHOD

#naive bayes
x<-train(Species~.,ir,preProcess = NULL,method="nb",trControl=trainControl(method = "cv",number = 4))
x
confusionMatrix(x)

#decision tree
x<-train(Species~.,ir,preProcess = NULL,method="J48",trControl=trainControl(method = "cv",number = 4))
confusionMatrix(x)

#knn
x<-train(Species~.,ir,preProcess = NULL,method="knn",trControl=trainControl(method = "cv",number = 4))
confusionMatrix(x)

