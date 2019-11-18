#Maarit Tarkiainen 13 Nov Creating alcohol consumption data
#https://archive.ics.uci.edu/ml/datasets/Student+Performance
math<-read.table("/Users/maarit/IODS-project/student-mat.csv", sep = ";" , header=TRUE)
por<-read.table("/Users/maarit/IODS-project/student-por.csv", sep = ";" , header=TRUE)
str(math) # this tests the dimensions of the file
str(por)
dim(math) #this code tests the dimensions of the file
dim(por)
#Join the two data sets by the following variables
join_by <- c("school","sex","age","address","famsize","Pstatus","Medu","Fedu","Mjob","Fjob","reason","nursery","internet")
library(dplyr)
#Join the two data sets, retaining only rows present in both sets 
math_por <- inner_join(math, por, by = join_by)
#Exploring the structure and dimensions of the data set
str(math_por)
dim(math_por)
# To modify columns repeated in the data, first let's create a new data frame "alc" which contains only the joined columns
alc <- select(math_por, one_of(join_by))
str(alc)
# To pick the columns not used for joining the data
notjoined_columns <- colnames(math)[!colnames(math) %in% join_by]

# to see names of the columns not used for joining
notjoined_columns
# to recognize and select the first of the double colmuns with same name, using for-loop command
for(column_name in notjoined_columns) {
  two_columns <- select(math_por, starts_with(column_name))
  first_column <- select(two_columns, 1)[[1]]

# If the first column is numeric, counting the mean of the two columns and giving that value to the column
#Otherwise, for non-numeric variables selecting the value of first column
#Add the the newmodifyed columns to "alc" data
    if(is.numeric(first_column)) {
    alc[column_name] <- round(rowMeans(two_columns))
  } else { 
    alc[column_name] <- first_column
  }
}

#take a look at the new data frame
glimpse(alc)
str(alc)

#computing and mutating new column presenting average alcohol consumption, mean of Dalc and Walc
alc <- mutate(alc, alc_use = (Dalc + Walc) /2)
alc <- mutate(alc, high_use = alc_use > 2)
#Take a look at the data
glimpse(alc)
str(alc)
#check which working directory is currently in use
getwd()
#set the certain as working directory
setwd("/Users/maarit/IODS-project/data")
#save the data file
write.table(alc, file = "create_alc")
test<-read.table("/Users/maarit/IODS-project/data/create_alc")
str(test)

