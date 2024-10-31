#Spreadsheets

#How to check which repo you're using. Typing in quotes and using tab can get the data file name without having to type the whole thing. 
getwd()
# 'the data file you want and tab' 

surveys <- read.csv("data/portal_data_joined.csv")
nrow(surveys)
ncol(surveys)
dim(surveys)
str(surveys)

class(surveys)

summary(surveys)
rm(surverys)

#Calling a specific value by iding row and column
surveys[1,5]
#Calling a set of rows or columns: first 5 rows 
surveys[1:5,]

#A data frame is a two dimensional object with an x and y. 
surveys[1,]
surveys[c(1, 5, 24, 307),]
surveys[,1]

# calling specific columns 
# it's good to call columns by their names instead of number in case you move around the columns later. Then your code can just stay the same. 
# Brackets or parentheses? Parentheses if using a function, bracket if wanting to move around a data fram or another object that you can think abut moving around on "grid" paper. 
surveys[c('record_id','year','day')]
dim(surveys[c('record_id','year','day')])

head(surveys)

#Do not understand head function or the difference between usung a value or just leaving a comma there. 


head(surveys['genus'])

head(surveys[c("genus", "species")])

head(surveys['genus',])
head(surveys[,'genus'])
str(surveys)

surveys$genus


surveys$hindfoot_length
class(surveys$hindfoot_length)

surveys$plot_id
class(surveys$plot_id)


install.packages('tidyverse')
library(tidyverse)
?read_csv

t_surveys <- read_csv('data/portal_data_joined.csv')
class(t_surveys)
t_surveys
