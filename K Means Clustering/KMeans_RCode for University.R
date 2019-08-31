install.packages("plyr")
library(plyr)

# Import the unviersity data set and name it as input
View(input)

# consider all rows from 1 to 25 and removing first column from the dataset

mydata<-input[1:25,c(2,3:8)]
View(mydata)

# Normalizaing the data : from 2nd column in mydata file ( because first variable is not numeric)

normalized_data<-scale(mydata[,2:7]) # Excluding the university name column before normalizing the data

View(normalized_data)


# Decide the k values and group them into clusters as per k value

km <- kmeans(normalized_data,4) #kmeans clustering
str(km)

# now we have to group by calculating centrioid and finding the distance between centroids and variable and group the
#variable as per least distanc

install.packages("animation")
library(animation)

km <- kmeans.ani(normalized_data, 4)
km$centers

# TO decide the k valus use elbow curve/ scree plot or user  k ~ sqrt(n/2) 
# Determine number of clusters by scree-plot

wss = (nrow(normalized_data)-1)*sum(apply(normalized_data, 2, var))		  
for (i in 2:8) wss[i] = sum(kmeans(normalized_data, centers=i)$withinss)
plot(1:8, wss, type="b", xlab="Number of Clusters", ylab="Within groups sum of squares")   # Look for an "elbow" in the scree plot #
title(sub = "K-Means Clustering Scree-Plot")

# labelling the clustering number into dataset

final2<- data.frame(mydata, km$cluster) # append cluster membership
final2

# making membership varaible as first column.

final3 <- final2[,c(ncol(final2),1:(ncol(final2)-1))]
final3


# Load the package for writing the data into xlsx file format 
library(xlsx)

# save the file on desktop

write.xlsx(final1,file="final1.xlsx")

# To check directory 
getwd()


