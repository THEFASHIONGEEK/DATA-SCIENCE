install.packages("readr")
library(readr)


view(mba)

View(mba)

View(mba)

mba <- read_csv("C:/Users/Rohit/Desktop/mba.csv")

View(mba)

str(mba)


mean(workex)

mean(mba$workex)

median(mba$workex)

var(mba$workex)

sd(mba$workex)


max(mba$workex)
min(mba$workex)



mean(mba$gmat)

median(mba$gmat)

# variance 
var(mba$gmat)
sd(mba$gmat)

 # mode  function method1

temp <- table(as.vector(mba$workex))
temp
names(temp)[temp == max(temp)]

# MOde function method 2

install.packages("modeest")
library(modeest)

mlv(mba$gmat, method = "mfv")

mlv(mba$workex,method = "mfv")


# standard deviation

sd(mba$gmat)

# attach the data to R and we can call directly varabile name to excute  the line by removing file name
# in the commands


attach(mba)

median(workex)
mean(gmat)
median(gmat)
mode(gmat)
var(gmat)
sd(gmat)

x <- min(gmat)
x
y<- max(gmat)
y
range <- y-x

range

install.packages("e1071")
library(e1071)


skewness(gmat)
kurtosis(gmat)

attach(mba)
mean(workex)
mean(gmat)
skewness(workex)
skewness(workex)
kurtosis(workex)

summary(mba)

# Barplot

plot(workex)
plot(gmat)
barplot(mba$workex)

barplot(workex)
barplot(gmat)

hist(mba$gmat)
hist(workex)


boxplot(mba$gmat)

boxplot(mba$gmat,horizontal = T)


# remove the first Variable 


mba1 <- mba[,1]

View(mba1)
 
#TO remove the column first varilabe
 
mba_n <- mba[,-1]
View(mba_n)

# To remove the Row 

mba_r <- mba_n[-8,]

View(mba_r)

# Normalization : X-u/sigma

View(mba)

View(mba_n)

mba_Nor <- scale(mba_n)

View(mba_Nor)

summary(mba_Nor)

plot(workex,gmat)

summary(mba)

pnorm(680,711,29)

pnorm(720,711,29)

qqnorm(mba$gmat)

qqline(mba$gmat)

qnorm(0.975)
qnorm

qnorm(0.96)
qnorm(0.95)
qnorm(0.97)
qnorm(0.981)

qt(0.95,772)
qt(0.995,772)
qt(0.95,139)

#nstall.packages("fbasic")
#basicStats(input)
#basicStats(mydata)
#boxplot(mydata$Accept)$out
#basicStats(normalized_data)
