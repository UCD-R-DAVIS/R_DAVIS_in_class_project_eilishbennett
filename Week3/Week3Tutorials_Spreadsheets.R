#Spreadsheet tutorial

surveys <- read.csv("data/portal_data_joined.csv")
str(surveys)
surveys
class(surveys)

nrow(surveys)
ncol(surveys)
str(surveys)

head(surveys)
tail(surveys)
?head
head(surveys, n=11)

summary(surveys)
surveys$sex

?summary

#Brackets dig out info from your greater pool
#Pulling out row 1, cloumn 3 value
surveys[1,3]
#Pulling out 
head(surveys,1)

#Pulling multiple things out - all the coloumns in the first row
surveys[1,]
#Pulling multiple things out - all the values  in the first column
surveys[,1]
surveys[1]
head(surveys[,1])

#First three rows
surveys[1:3,]

#All the rows of the first three columns
surveys[,1:3]

#First three rows and the first three columns
surveys[1:3,1:3]

#Pulling out specific rows and columns that are not in order, have to concagnate them
surveys[c(1,4,10), c(2,4,6)]

#Can subtract things, this is subtracting the first column
surveys[,-1]

#Subtracting the first row
surveys[-1,]

#Removing all rows from the 7th to the last 
surveys[-c(7:nrow(surveys)),]
nrow(surveys)==34786
#This code is the same as head function bc head function only takes the first 6 rows
head(surveys)

#Returning a specific column by its name. This is helpul to call by variable name if your data reorders sometimes
head(surveys['genus'])
head(surveys[,"genus"])

surveys[['genus']]

#Walking through an object - $ selecting a particular variable
surveys$record_id

#Installing a new package
install.packages('tidyverse')
library(tidyverse)

#Reading in our dataset with the new package
t_surveys <- read_csv('data/portal_data_joined.csv')
t_surveys
class(t_surveys)

#Same values but diff format with the normal vs tiblle thing 
surveys[,1]
t_surveys[,1]
