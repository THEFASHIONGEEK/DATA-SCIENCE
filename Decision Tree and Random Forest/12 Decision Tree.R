install.packages("C50") # we neeed to install C50 package to use ak
install.packages("tree")
library(C50)
data()
data("iris")
View(iris)

?iris

# Splitting data into training and testing. As the species are in order 
# splitting the data based on species 

iris_setosa<-iris[iris$Species=="setosa",] # 50
iris_versicolor <- iris[iris$Species=="versicolor",] # 50
iris_virginica <- iris[iris$Species=="virginica",] # 50

iris_train <- rbind(iris_setosa[1:25,],iris_versicolor[1:25,],iris_virginica[1:25,])
iris_test <- rbind(iris_setosa[26:50,],iris_versicolor[26:50,],iris_virginica[26:50,])

View(iris_train)
View(iris_test)

# Building model on training data

irisc5.0_train <- C5.0(iris_train[,-5],iris_train$Species)
plot(irisc5.0_train) # Tree graph
plot(irisc5.0_train,type="simple")

# Training accuracy

mean(iris_train$Species==predict(irisc5.0_train,iris_train)) # 97.33% Accuracy
predc5.0_test <- predict(irisc5.0_train,newdata=iris_test) # predicting on test data
mean(predc5.0_test==iris_test$Species) # 94.66% accuracy 
library(gmodels)

# Cross tablez

CrossTable(iris_test$Species,predc5.0_test)


