
boxplot(mba$gmat)

boxplot(mba$gmat)$out

unique(boxplot(mba$gmat)$out)

summary(mba$gmat)

boxplot(mba$gmat)

myboxplot <- boxplot(mba$gmat)

# TO find the outliers in data

myboxplot$out

unique(myboxplot$out)

# Check the Outliers for workex

unique(boxplot(mba$workex)$out)

# To check the outliers value

myboxplot <- boxplot(mba$workex)

# Checking the outliers value

myboxplot$out

unique(myboxplot$out)

unique(boxplot(mba$gmat)$out)

# Removing the outliers value 

test <- boxplot(mba$workex,mba$gmat,outline = FALSE)
getwd()


bp <- boxplot(mba$gmat, outline = FALSE)



quantiles <- quantile(mba$gmat, probs = c(.25, .75))
quantiles

range <- 1.5 * IQR(mba$gmat)

range

mba3 <- subset(mba,mba$gmat> (quantiles[1] - range) 
               & mba$gmat < (quantiles[2] + range))
View(mba3)

boxplot(mba3$gmat)
boxplot(mba$gmat)$out

boxplot(mba3$gmat)$out
unique(boxplot(mba3$gmat)$out)

quantiles <- quantile(mba3$gmat, probs = c(.25, .75))
quantiles
range <- 1.5 * IQR(mba3$gmat)
range
mba4 <- subset(mba3,mba3$gmat> (quantiles[1] - range) 
               & mba3$gmat < (quantiles[2] + range))
View(mba4)

quantiles[1] - 1.5* IQR 

qunatiles[1] - range


boxplot(mba4$gmat)

# mean without outliers 
mean(mba4$gmat)
