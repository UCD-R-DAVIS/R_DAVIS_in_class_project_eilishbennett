# Week 4 Video 1B 
# Goals: learn about mutate, group_by, and summarize functions

library(tidyverse)
surveys <- read_csv("data/portal_data_joined.csv")

# Mutate 
surveys2 <- surveys %>% 
  mutate(weight_kg = weight/1000)

str(surveys2)

#Adding multiple columns
surveys3 <- surveys %>% 
  mutate(weight_kg = weight/1000, 
         weight_kg2 = weight_kg*2)
str(surveys3)

#filter out na's 
surveys3 <- surveys %>% 
  filter(!is.na(weight)) %>% 
  mutate(weight_kg = weight/1000, 
         weight_kg2 = weight_kg*2)
str(surveys3)

head(surveys3)

# Group_by and sumamrize 
surveys4 <- surveys3 %>% 
  group_by(sex) %>% 
  mutate(mean_weight = mean(weight))
str(surveys4)
#This created a new column of mean weight where all 32283 rows for male/female (respectively) had the same value. Instead just geving you males and females sum stats 

#How to JUST see the summary statistics of avg weight by sex 
surveys4 <- surveys3 %>% 
  group_by(sex) %>% 
  summarize(mean_weight = mean(weight))
surveys4

#What if there are multiple groups we want to know weight for? Ie not just m/f, but also species anf each gener's weights?
surveys4 <- surveys3 %>% 
  group_by(sex, species_id) %>% 
  summarize(mean_weight = mean(weight))
surveys4

#What if you want to sort by ascending or descending order? This is the ARRANGE function
surveys4 <- surveys3 %>% 
  group_by(sex, species_id) %>% 
  summarize(mean_weight = mean(weight)) %>% 
  arrange(mean_weight)
surveys4

#This sorts it in ascending order. Putting a dash in reverses the order to descending
surveys4 <- surveys3 %>% 
  group_by(sex, species_id) %>% 
  summarize(mean_weight = mean(weight)) %>% 
  arrange(-mean_weight)
surveys4

#summarizing multiple columns
surveys4 <- surveys3 %>% 
  group_by(sex, species_id) %>% 
  summarize(mean_weight = mean(weight), 
            min_weight = min(weight)) %>% 
  arrange(-mean_weight)
surveys4

