
setwd("/Users/jaydeep/jaydeep_workstation/Workplace/R/EvalMtdh")
#iris <- read.csv(file="iris.csv",header =T,sep = ",")

data(iris)

seed(1000)
#install.packages("caret")
require("caret")
# Create index to split based on labels and 75% will be in training data
index <- createDataPartition(iris$Species, p=0.75, list=FALSE)

# Subset training set with index
iris.training <- iris[index,]

# Subset test set with index
iris.test <- iris[-index,]

x.train = iris.training[, 1:4]
y.train = iris.training[, 5]

# Train a model
model_knn <- train(x.train, y.train, method='knn')

x.test = iris.test[,1:4]
y.test = iris.test[,5]
predictions<-predict(object=model_knn,x.test)


result <- confusionMatrix(predictions,y.test)


confusionMatrix(data = predictions, reference = y.test, mode = "prec_recall")


