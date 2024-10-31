#Joins and pivots

library(tidyverse)

tail <- read_csv('data/tail_length.csv')
head(tail)
dim(tail)

#psuedocode 
#join_function (data frame a, data frame b, how to join)
#inner_join takes A and B and we want to merge only on the column, and gets ride of columns whee there are not a match
# inner_join(data frame a , data frame b, common id)

surveys <- read_csv('data/portal_data_joined.csv')
dim(inner_join(x = surveys, y=tail))
  
#This automatically works on the common columns 
#inner_join only keeps records that are in both data frames

#same as 
dim(inner_join(x = surveys, y = tail, by = 'record_id'))
dim(surveys)

#left_join
#left_join takes dataframe x and dataframe y and it keeps everything in x and only matches in y 
#left_join(x,y) == right_join(y,x)

#right_join
#takes dataframe x and dataframe y and it keeps everything in y and only matches in x
#right_join(x,y) == left_join(y,x)
#OPTION - can only do left_join ever!!! swap x and y if you need 

surveys_left_joined <- left_join(x = surveys, y = tail, by = 'record_id')
surveys_right_joined <- right_join(y = surveys, x = tail, by = 'record_id')

dim(surveys_left_joined)
dim(surveys_right_joined)

#full_join(x,y)
#full_join keeps EVERYTHING

surveys_full_joined <- full_join(x=surveys, y = tail)
dim(surveys_full_joined)
#if something doesn't match up, R still merges by assigns NA values


#Pivoting ---- 
#pivot_wider makes data with more columns

#pivot_longer makes data with more rows

surveys_mz <- surveys %>% 
  filter(!is.na(weight)) %>% 
  group_by(genus, plot_id) %>% 
  summarize(mean_weight = mean(weight)) 

#groupd by genus and plot_id
surveys_mz
#see each genus 
unique(surveys_mz$genus)

wide_survey <- surveys_mz %>% 
  pivot_wider(names_from = 'plot_id', values_from = 'mean_weight')

head(wide_survey)
#resulting NA values even though we already filtered them out! because our code wanted to see the weight for every genus/plot_id combo 

surveys_long <- wide_survey %>% pivot_longer(-genus, names_to = 'plot_id', values_to = 'mean_weight')
head(surveys_long)


#I understand the larger picture of what is happening but not the coding details
#Prof Tyler endorses and "trial and error" method where you start with minimal code and add/edit as needed 

