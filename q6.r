ir<-iris
install.packages("cluster")
install.packages("dbscan")

library("cluster")
library("dbscan")
#normalize the data and compare

# K Means
?dist
k<-kmeans(ir[1:4],3)
clusplot(ir[1:4],k$cluster,labels = 2,lines = T)
hullplot(ir[1:4],k$cluster)

# Agglomerative hierarchical clustering 

d<-dist(ir[1:4],method = "euclidean")
h<-hclust(d,method = "single")
plot(h)
h1<-hclust(d,method = "complete")
plot(h1)
h2<-hclust(d,method = "average")
h2=cutree(h2,k=3)#cluster to each sample
hullplot(ir[1:4],h2)

# DBScan
d<-dist(ir[1:4],method = "euclidean")
dbc<-dbscan(ir[1:4],eps=0.8,minPts = 10)
dbc<-dbscan(d,eps=0.8,minPts = 10)
clusplot(ir[1:4],dbc$cluster,labels = 2,lines = T)
hullplot(ir[1:4],dbc$cluster)

