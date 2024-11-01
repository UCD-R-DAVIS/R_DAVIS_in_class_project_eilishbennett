#Data Visualization Part 1a 
# Goals: Introduction ggplot package, scatter plots, and boxplots 

library(tidyverse)

surveys <- read_csv('data/portal_data_joined.csv') %>% 
  filter(!is.na(weight) & !is.na(hindfoot_length))
#filtering na's right off the bat is not a good practice irl, but for the sake of learning we are removing them 

#General ggplot format: 
# ggplot (data = <DATA>, mapping = aes(<MAPPINGS>) + 
## <GEOM_FUNCTION>())
## in ggplot, the plus sign kinda serves as a piping to add diff layers 

## blank canvas 
ggplot(data = surveys)

## add aes for 'mapping coordinates' which defines x and y axes
## Example geoms: 
## Geom_point() for scatter plots (continuous x continuous variables)
## geom_boxplot() for boxplots (categorical x continuous variables)
#3 geom_line() for trend lines 
geom_

ggplot(data = surveys, mapping = aes(x = weight, y = hindfoot_length))

# add layer for the geom 
base_plot <- ggplot(data = surveys, mapping = aes(x = weight, y = hindfoot_length)) + geom_point()

#adding plot elements: transparency = alpha, colors = color. infill = fill
#for colors, can also give it a hex code 
#fill acts differently depending on geom 
base_plot +
  geom_point(alpha = .2, color = "blue")

#color can be based on the data itself 
base_plot + 
  geom_point(mapping = aes(color = species_id))
#to include info about data, must be INSIDE aesthetic mapping (ie the color assignment must be nested within aes function. cant just say "color = species_id" bc then r looks for a color called species_id)

#geom_boxplot 
ggplot(data = surveys, mapping = aes(x = species_id, y = weight)) +
  geom_boxplot(color = "tomato") +
  geom_point(alpha = 0.1)

#Here the boxplots are BEHIND the points, depends on how you layer them (which is how you order them in the code) 
