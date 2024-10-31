# Week 4 Homework

library(tidyverse)
# ^ Do we need to load in this every time?----

# Create a tibble named surveys from the portal_data_joined.csv file.
surveys <- read_csv("data/portal_data_joined.csv")

# Subset surveys using Tidyverse methods to keep rows with weight between 30 and 60, and print out the first 6 rows.
surveys %>% 
  filter(weight >30 & weight < 60) 
surveys[1:6,]
head(surveys)
#Is there another way to print the first six columns?----

#Create a new tibble showing the maximum weight for each species + sex combination and name it biggest_critters. 
#Sort the tibble to take a look at the biggest and smallest species + sex combinations. 
#HINT: it’s easier to calculate max if there are no NAs in the dataframe…

biggest_critters <- surveys %>% 
  filter(!is.na(weight)) %>%
  group_by(sex, species_id) %>%
  summarize(max_weight = max(weight), 
            min_weight = min(weight)) %>% 
  arrange(min_weight)
biggest_critters
  
biggest_critters <- surveys %>% 
  filter(!is.na(weight)) %>%
  group_by(sex, species_id) %>%
  summarize(max_weight = max(weight), 
            min_weight = min(weight)) %>% 
  arrange(-min_weight)
biggest_critters

biggest_critters <- surveys %>% 
  filter(!is.na(weight)) %>%
  group_by(sex, species_id) %>%
  summarize(max_weight = max(weight), 
            min_weight = min(weight)) %>% 
  arrange(max_weight)
biggest_critters

biggest_critters %>% arrange(desc(max_weight))

#Try to figure out where the NA weights are concentrated in the data- is there a particular species, taxa, plot, or whatever, where there are lots of NA values? 
#There isn’t necessarily a right or wrong answer here, but manipulate surveys a few different ways to explore this. 
#Maybe use tally and arrange here.

na_explore <- surveys %>%
  filter(is.na(weight)) %>% 
  arrange(-year)
na_explore  

na_explore %>% arrange(year)
surveys %>%
  filter(genus == "Neotoma")

na_explore2 <- surveys %>% 
  filter(is.na(weight)) %>% 
  group_by(species) %>% 
  tally() %>% 
  arrange(-n)
na_explore2

view(na_explore2)
#In the above code, I filtered by NA weight values, grouped them by species, counted how many per species were NA, and then arranged them in descending order. 
#N is the new column that the tally function makes. It is the count 
# After this exploration, the top 3 species with NA values are harrisi, merriami, and bilineata
  
na_explore2 <- surveys %>% 
  filter(is.na(weight)) %>% 
  group_by(taxa) %>% 
  tally() %>% 
  arrange(-n)

#After this code, rodents are the taxa with the most NA values. 

str(surveys)

na_explore2 <- surveys %>% 
  filter(is.na(weight)) %>% 
  group_by(plot_type) %>% 
  tally() %>% 
  arrange(-n)
na_explore2
#After this code, the control has more NA values

#Take surveys, remove the rows where weight is NA and add a column that contains the average weight of each species+sex combination to the full surveys dataframe. 
#Then get rid of all the columns except for species, sex, weight, and your new average weight column. 
#Save this tibble as surveys_avg_weight.

surveys <- surveys %>%
  filter(!is.na(weight))
     
nrow(surveys)

surveys <- surveys %>% 
  group_by(species_id, sex) %>% 
  mutate(mean_weight = mean(weight)) %>% 
surveys

surveys_avg_weight <- surveys %>% select(species_id, sex, weight, mean_weight)
surveys_avg_weight

#Take surveys_avg_weight and add a new column called above_average that contains logical values stating whether or not a row’s weight is above average for its species+sex combination 
#(recall the new column we made for this tibble).
surveys_avg_weight <- surveys_avg_weight %>% 
  mutate(above_average = weight > mean_weight)
surveys_avg_weight

#Question: in the mutate line, how did this know to be a logical answer column? Without an "if then" or "ifelse" function? 