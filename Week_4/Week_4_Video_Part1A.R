#Week 4 - Select, Filter, and Piping 

library(tidyverse)

surveys <- read_csv("data/portal_data_joined.csv")

view(surveys)
str(surveys)

#Selecting columns
month_day_year <- select(surveys, month, day, year)
length(month_day_year)

#filtering rows by equals 
#Note: do not name a variable starting with a number!
year_1981 <- filter(surveys, year == 1981)

#Filtering by a year range 
filter(surveys, year %in% 1981:1983)

# Why you should never do this: 
filter(surveys, year == c(1981, 1982, 1983))
#You get a warning because there are only 1685 results. This is because it is recycling through the 3 years, or asking if row 1 is 1981, row 2 is 1982, is 3 for 1983. 
#instead of checking each row for ANY of the three years. 

#Filtering by conditional statements 
bigfoot_with_weight <- filter(surveys, hindfoot_length > 40 & !is.na(weight))

#VERSUS multi-step process 
small_animals <- filter(surveys, weight < 5)
small_animals_ids <- select(small_animals, record_id, plot_id, species_id)
#This two-step process can be dangerous because in each next step, you have to remember to select from your new subset small-animals, instead of the greater surveys 

#same process, using nested functions in the same line of code.
small_animals_ids <- select(filter(surveys, weight < 5), record_id, plot_id, species_id)

#Can do all this more efficiently with piping in tidyverse
#Piping is cmd+shift+m %>% 
small_animal_ids <- filter(surveys, weight < 5) %>% select(record_id, plot_id, species_id)
#Piping reads from left to right. Using the surveys, then filtering the weights, then selecting the three columns. 
# Think of it as a pipe that gets smaller and smaller. 

#The same as below, but this time more readabe 
small_animal_ids <- surveys %>% filter(weight < 5) %>% select(record_id, plot_id, species_id)

#But, the above is very long. Below is how to do line breaks with pipes
surveys %>% filter(month==1)

#good: 
surveys %>% 
  filter(month==1)

#notgood: 
surveys 
%>% filter(month==1)
#This doesn't work because it prints the whole surveys, not what you are trying to filter. 
#The piping function ( %>% ) needs to go after your input on the same line 


#one final review of an important concept we learned last week
#applied to the tidyverse

mini <- surveys[190:209,]
table(mini$species_id)
#how many rows have a species ID that's either DM or NL?
nrow(mini)
# There are 20 rows that fit these 

test <- mini %>% filter(species_id == c("DM", "NL"))
nrow(test)
# This equals 10 rows!!! Because it is recycling 


#How to fix and get the full 20 rows 
test <- mini %>% filter(species_id %in% c("DM", "NL"))
nrow(test)
