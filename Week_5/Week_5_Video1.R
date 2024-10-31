#Conditional Statements

library(tidyverse)
surveys <- read_csv("data/portal_data_joined.csv")
str(surveys)

#We will be focusing on hindfoot_length column
summary(surveys$hindfoot_length)

#psuedocode
#ifelse(test or condition, what to do if the test is yes/true, what to do if its false/no)

#boolean test with the mean - will tell you t/f 
surveys$hindfoot_length < 29.29

surveys$hindfoot_cat <- ifelse(surveys$hindfoot_length < 29.29, yes = "small", no = "big")
head(surveys$hindfoot_cat)
head(surveys$hindfoot_length)

#more robust way to do this

surveys$hindfoot_length <- ifelse(surveys$hindfoot_length < mean )

#What to do if you have more than two conditions? Use case_when()!!!
surveys %>% 
  mutate(hindfoot_cat = case_when(
    hindfoot_length > 29.28 ~ "big", 
    TRUE ~ "small"
  )) %>% 
  select(hindfoot_length, hindfoot_cat) %>% 
  head()
#not great bc the everything else part captured NA values! Now there are "small" in the new column

mutate(hindfoot_cat = case_when(
  hindfoot_length > 29.28 ~ "big",
  is.na(hindfoot_length) ~ NA_character_,
  TRUE ~ "small"
)) %>% 
  select(hindfoot_length, hindfoot_cat) %>% 
  
  
  head()
# GETTING A WEIRD ERROR HERE: Error in `case_when()`:
#! Failed to evaluate the left-hand side of formula 1.
#Caused by error:
#  ! object 'hindfoot_length' not found

str(surveys)

#This is a weird syntax... TRUE ~ small part captures everything else 

surveys$hindfoot_length
str(surveys$hindfoot_length)


### Uhhhh keep getting an error about my hindfoot_length column?? Restarted R and reran code, and now the error is occuring earlier in my script on code that had previously worked before.
