# drop the id feature
wbcd <- wbcd[-1]

# table of diagnosis -> calculating number of entries with B and M 

table(wbcd$diagnosis)

# recode diagnosis as a factor -> giving the full name to labels 

wbcd$diagnosis <- factor(wbcd$diagnosis, levels = c("B", "M"),
                         labels = c("Benign", "Malignant"))


# table or proportions with more informative labels  -> calcualting the probablity

round(prop.table(table(wbcd$diagnosis)) * 100, digits = 1)

# summary of dataset

summary(wbcd)

# summarize three numeric features
summary(wbcd[c("radius_mean", "area_mean", "smoothness_mean")])


str(wbcd)

# create normalization function
normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}

# test normalization function - result should be identical
#normalize(c(1, 2, 3, 4, 5))
#normalize(c(10, 20, 30, 40, 50))

# normalize the wbcd data -> applying the normalize function which is created in line 29

wbcd_n <- as.data.frame(lapply(wbcd[2:31], normalize))

# confirm that normalization worked
View(wbcd_n)
summary(wbcd_n)

# create training and test data

wbcd_train <- wbcd_n[1:469, ]

wbcd_test <- wbcd_n[470:569, ]

# create labels for training and test data

wbcd_train_labels <- wbcd[1:469, 1]
wbcd_test_labels <- wbcd[470:569, 1]

#---- Training a model on the data ----

# load the "class" library
library(class)
wbcd_train_labels <- wbcd_train_labels[["diagnosis"]]
wbcd_test_labels <- wbcd_test_labels[["diagnosis"]]

wbcd_test_pred <- knn(train = wbcd_train, test = wbcd_test,
                      cl = wbcd_train_labels, k=23)
#View(wbcd_test_pred)

##--------Evaluating model performance ----

# load the "gmodels" library
library(gmodels)

# Create the cross tabulation of predicted vs. actual

CrossTable(x = wbcd_test_labels, y = wbcd_test_pred,
           prop.chisq=FALSE)

## Improving model performance ----

# re-classify test cases
wbcd_test_pred <- knn(train = wbcd_train, test = wbcd_test,
                      cl = wbcd_train_labels, k=2)

# Create the cross tabulation of predicted vs. actual
CrossTable(x = wbcd_test_labels, y = wbcd_test_pred,
           prop.chisq=FALSE)


wbcd_test_pred <- knn(train = wbcd_train, test = wbcd_test, cl = wbcd_train_labels, k=1)
CrossTable(x = wbcd_test_labels, y = wbcd_test_pred, prop.chisq=FALSE)

wbcd_test_pred <- knn(train = wbcd_train, test = wbcd_test, cl = wbcd_train_labels, k=5)
CrossTable(x = wbcd_test_labels, y = wbcd_test_pred, prop.chisq=FALSE)

wbcd_test_pred <- knn(train = wbcd_train, test = wbcd_test, cl = wbcd_train_labels, k=11)
CrossTable(x = wbcd_test_labels, y = wbcd_test_pred, prop.chisq=FALSE)

wbcd_test_pred <- knn(train = wbcd_train, test = wbcd_test, cl = wbcd_train_labels, k=15)
CrossTable(x = wbcd_test_labels, y = wbcd_test_pred, prop.chisq=FALSE)

wbcd_test_pred <- knn(train = wbcd_train, test = wbcd_test, cl = wbcd_train_labels, k=21)
CrossTable(x = wbcd_test_labels, y = wbcd_test_pred, prop.chisq=FALSE)

wbcd_test_pred <- knn(train = wbcd_train, test = wbcd_test, cl = wbcd_train_labels, k=27)
CrossTable(x = wbcd_test_labels, y = wbcd_test_pred, prop.chisq=FALSE)


