  # load package 'readxl' to load data from xlsx file
library(readxl)
input <- read_excel("G:\\Hierarchical Clustering\\University_Clustering.xlsx") 

# To view the dataset
View(input)

# attach command to upload the dataset

attach(input)

# consider all rows from 1 to 25 and removing first column from the dataset

mydata<-input[,c(3,4:8)]

View(mydata)

# Normalizaing the data : from 2nd column in mydata file ( because first variable is not numeric)

normalized_data<-scale(mydata) 

# Excluding the university name column before normalizing the data

View(normalized_data)

# calculate the distance between the variable using Euclidean or any other distance method

d<-dist(normalized_data,method="euclidean") 

summary(d)

d

# grouping the varaible using methods like single , complete 
?hclust

fit<-hclust(d,method="complete")

fit

?hclust

# Need to check the clustering using Dendogram

plot(fit) 

# make all the variable in one line

plot(fit,hang=-1)

# looking into dendogram decide how many cluster we need 
# we are diving the dendogram into 5 clustering by taking k=5


groups<-cutree(fit,k=3)
groups

?cutree

# labelling the groups with red colour

rect.hclust(fit,k=3,border="red")

#to check the syntax for cutting tree
?rect.hclust

library(cluster)
clusplot(normalized_data,
         groups,
         lines = 0,labels = 2,color = TRUE,  shade = TRUE,
         main = paste('Clusters of University'))

# in data set label the clusters or grouping in dataset

membership<-as.matrix(groups)
View(membership)


final1<-data.frame(input,membership)

View(final1)

# Get the membership column as first column in dataset
#final1<-final[,c(ncol(final),1:(ncol(final)-1))]
#View(final1)

# Load the package for writing the data into xlsx file format 
library(xlsx)

# save the file on desktop

write.xlsx(final1,file="jan1st.xlsx")

# To check directory 
getwd()


