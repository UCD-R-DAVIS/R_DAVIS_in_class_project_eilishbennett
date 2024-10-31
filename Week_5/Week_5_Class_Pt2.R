#Joints and Pivots 

#inner_join will keep only the shared row ids, so the output tends to get smaller
#left_join keeps  ALL of the x, or left table, row ids, so the output will have the same amount of rows as x table
#rightjoin does the opposite, but recommended to never use. You can avoid using it by swapping the inputs in leftjoin
#fulljoin combines  EVERYTHING, fillin in NAs where there is not a corresponding value

library(tidyverse)
tail <- read_csv('data/tail_length.csv')
surveys <- read_csv

dim(tail)
dim(surveys)
head(tail)

surveys_inner <- inner_join(x = surveys, y = tail)
dim(surveys_inner)
head(surveys_inner)

#tail and surveys have the same number of rows and rowsid, but tail has one column that surveys doesnt. so the innerjoin can fully complete and the output has the same rows as both the inputs (bc the inputs have equal number of rows). If you had differently sized datasets, the result would have the same number of rows as the smaller one

surveys_mz <- surveys %>% 
  filter(!is.na(weight)) %>% 
  group_by(genus, plot_id) %>% 
  summarize(mean_weight = mean(weight)) 

surveys_mz %>%
  pivot_wider(id_cols = 'genus', 
              names_from = 'plot_id',
              values_from = "mean_weight")