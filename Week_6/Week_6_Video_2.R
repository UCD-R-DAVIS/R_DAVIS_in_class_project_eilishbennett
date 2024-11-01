#Time series facets 
library(tidyverse)

surveys_complete <- read_csv('data/portal_data_joined.csv') %>% 
  filter(complete.cases(.))

# these are two diff ways of doing the same thing (group_by from last week's lessons, could probably freshen up on this)
head(surveys_complete %>% count(year, species_id))
head(surveys_complete %>%  group_by(year, species_id) %>%  tally())
?count

yearly_counts <- surveys_complete %>% count(year, species_id)
head(yearly_counts)

#for ggplot, we want everything in the long format 

ggplot(data = yearly_counts, mapping = aes(x = year, y = n)) +
  geom_point()

ggplot(data = yearly_counts, mapping =aes(x = year, y=n)) +
  geom_line()

#The below codes groups by each species and gives it its own line 
ggplot(data = yearly_counts, mapping =aes(x = year, y=n, group = species_id)) +
  geom_line()
#This gives each species its own colored line
ggplot(data = yearly_counts, mapping =aes(x = year, y=n, color = species_id)) +
  geom_line()

#faceting solves this problem of a million lines of similar colors, each species will get its own graph
ggplot(data = yearly_counts, mapping = aes(x = year, y = n)) +
  geom_line() + 
  facet_wrap(~ species_id)


#Multiple plots but changing how they are arranged by n of col/rows
ggplot(data = yearly_counts, mapping = aes(x = year, y = n)) +
  geom_line() + 
  facet_wrap(~ species_id, ncol = 4)

ggplot(data = yearly_counts, mapping = aes(x = year, y = n)) +
  geom_line() + 
  facet_wrap(~ species_id, scales = 'free')


#you can also alter the scales for these diff charts and select only a few species to symbolize
#revisit how to do this ----


#maps and installing new packages
install.packages("ggthemes")
install.packages("tigris")
install.packages('sf')

ca_counties = tigris::counties(state = "CA", class='sf')
ggplot(data=ca_counties) + geom_sf(state='CA', class = "sf")
