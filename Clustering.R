
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
