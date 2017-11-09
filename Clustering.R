
dataset <- read.csv("costpercompany.csv", header =T)
library(cluster)
pairs(dataset)
plot(dataset$Fcost~ dataset$Sales, data=dataset)
with(dataset,text(dataset$Fcost ~ dataset$Sales,labels=dataset$Company,pos=4,cex=0.6))
#normalization
normal = dataset[,-c(1,1)]
means = apply(normal,2,mean)
sds = apply(normal,2,sd)
nor = scale(normal,center = means,scale=sds)
#calculating Euclidean Distance
distance = dist(nor)
distance
print(distance,digits = 3)
dataset.hclust = hclust(distance)
plot(dataset.hclust,labels = dataset$Company,main='Default from hclust')
#aliging from zero
plot(dataset.hclust,hang = -1)
dataset.avhclust<-hclust(distance,method = "average")
plot(mydata.avhclust,hang= -1)
member.c = cutree(dataset.hclust,3)
member.c 
member.a =cutree(dataset.avhclust,3)
table(member.c,member.a)
kc <- kmeans(normal,3)
kc$cluster
kc$centers
plot(dataset$Sales~ dataset$Fcost, data = dataset)
#colorful
plot(dataset$Sales~ dataset$Fcost, data= dateset,col=kc$cluster)
