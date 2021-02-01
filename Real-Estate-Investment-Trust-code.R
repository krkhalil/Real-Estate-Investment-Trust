df = read.csv('realestate_data.csv')
df

#summary of the data set 
summary(df)

#sum of the NA Values in the data set
sum(is.na(df))
#here we are seeing the names of the data set column names
colnames(df)


#here is the loop that is checking ,replacing and removing the NA values from the Data Frame

for (i in which(sapply(df, is.numeric))) {
  df[is.na(df[, i]), i] = mean(df[, i],  na.rm = TRUE)
}


#here is new data frame which  omitting the NA values here another technique the remove NA values from the data set 
newdf = na.omit(df)

#The next major preprocessing activity is to identify the outliers package and deal with it. We can identify the presence of outliers in R by making use of the outliers function. We can use the function outliers only on the numeric columns, hence let's consider the preceding dataset, where the NAs were replaced by the mean values, and we will identify the presence of an outlier using the outliers function. Then, we get the location of all the outliers using the which function and finally, we remove the rows that had outlier values

install.packages("outliers")
library(outliers)

#We identify the outliers in the X2012 column, which can be subsetted using the data$X2012 command

outlier_tf = outlier(newdf$grade,logical=TRUE)
sum(outlier_tf)



#What were the outliers
find_outlier = which(outlier_tf==TRUE,arr.ind=TRUE)
#Removing the outliers
newdata = newdf[-find_outlier,]
nrow(newdata)

#finding the Standard Deaviation of Price Column 
standard_deviation = sd(newdf$price)
paste("Std Deviation of MPG:", standard_deviation)


