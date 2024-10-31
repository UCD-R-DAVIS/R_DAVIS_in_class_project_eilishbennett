# Data Manipulation Part 1B

library(tidyverse)

surveys <- read_csv("data/portal_data_joined.csv")
str(surveys)

#Adding a new column
# this is called mutating 

surveys <- surveys %>%
  mutate ( weight_kg = weight/1000)
head(surveys)
str(surveys)


#Lost in class after this
#Read tutorials, watch videos, and attempt the challenges. 