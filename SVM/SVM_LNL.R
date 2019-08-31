# SVM METHOD USING LINEAR METHODS

# Take the default data set iris 

data()

data("iris")

# view the iris data file.

View(iris)

# Attach the file to the program

attach(iris)

# Syntax for SVM model and applying SVM data on IRIS Dataset

install.packages('e1071', dependencies=TRUE)

library(e1071)


#build the SVM default method and as default it will excute Kernel of Radial Method

final_svm <- svm(Species ~ ., data=iris)

summary(final_svm)  

# prediction of Default  Radial method

pred <- predict(final_svm,iris)

tab <-table(predicted = pred,Actual = iris$Species)

sum(diag(tab))/sum(tab)


## Build the model using linear methods with cost and Gamma use linear and radial as Linear methods

svm_linear <- svm(Species ~ ., data=iris,kernel = "linear")

summary(svm_linear)                 

# prediction of Linear Method

pred <- predict(svm_linear,iris)

tab <-table(predicted = pred,Actual = iris$Species)

sum(diag(tab))/sum(tab)


## SVM Methods Using NON LINEAR METHODS.

# For Non Linear Methods we user vaniladot , polydot,rbfdot without cost and gamma values 

library(kernlab)

svm_nonlinear <- ksvm(Species ~ ., data = iris, kernel = "rbfdot")

prediction <- predict(svm_nonlinear,iris)

#pred <- predict(svm_linear,iris)

#tab <-table(predicted = pred,Actual = iris$Species)

#sum(diag(tab))/sum(tab)

table(prediction)

prop.table(table(prediction))

tab <-table(prediction = prediction,Actual = iris$Species)
tab

sum(diag(tab))/sum(tab)



