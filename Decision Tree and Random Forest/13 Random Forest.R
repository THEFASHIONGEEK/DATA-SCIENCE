# Using Random Forest
library(randomForest)

data(iris)

View(iris)
# Splitting data into training and testing. As the species are in order 
# splitting the data based on species 

iris_setosa<-iris[iris$Species=="setosa",] # 50
iris_versicolor <- iris[iris$Species=="versicolor",] # 50
iris_virginica <- iris[iris$Species=="virginica",] # 50

iris_train <- rbind(iris_setosa[1:25,],iris_versicolor[1:25,],iris_virginica[1:25,])
iris_test <- rbind(iris_setosa[26:50,],iris_versicolor[26:50,],iris_virginica[26:50,])

# Building a random forest model on training data 

model1 <- randomForest(Species~.,data=iris_train)

model1

# Output show 
# Number of Trees is 500 , Number of variables tried at each spilit is 2
# Error Rate is 4 % 


# Fine tuning parameters of Random Forest model
model2 <- randomForest(Species~.,data=iris_train, ntree = 100, importance = TRUE)
model2

#To check Importance variables 

importance(model2)

varImpPlot(model2) 

plot(round(importance(fit.forest)))


?randomeforest

table(predict(model1),iris_train$Species)




# Predicting test data 

pred_test <- predict(model1,newdata=iris_test)
table(pred_test,iris_test$Species)
  
#Checking the accuracy by creating confusion matrix 

CM <- table(pred_test,iris_test$Species)
CM
accuracy <- (sum(diag(CM)))/sum(CM)
accuracy

# predicting for Model2

pred_test <- predict(model2,newdata=iris_test)
table(pred_test,iris_test$Species)

#Checking the accuracy by creating confusion matrix 

CM <- table(pred_test,iris_test$Species)
CM
accuracy <- (sum(diag(CM)))/sum(CM)
accuracy


# compare with Decision Tree




