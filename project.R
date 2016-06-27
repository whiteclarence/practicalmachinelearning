library(caret)

download.file("https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv","pml-training.csv")
download.file("https://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv","pml-testing.csv")
train.feat <- read.csv("pml-training.csv")
test.feat <- read.csv("pml-testing.csv")
train.feat <- train.feat[,8:ncol(train.feat)]
train.feat[is.na(train.feat)] <- 0
test.feat <- test.feat[,8:ncol(test.feat)]
test.feat[is.na(test.feat)] <- 0
print(train.feat$classe)

classifier <- train(factor(classe) ~ ., data=train, method="rpart")
print(table(train$classe, predict(classifier, train.feat[,-classe])))
