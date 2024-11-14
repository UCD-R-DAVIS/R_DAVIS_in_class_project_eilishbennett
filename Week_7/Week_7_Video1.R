# Week 7 

library(tidyverse)
library(ggthemes)

# Load plot 

surveys <- read_csv("data/portal_data_joined.csv") %>% 
  filter(!is.na(weight) & !is.na(hindfoot_length))

#ggplot template 
# ggplot(data = <data>, mapping = aes(<MAPPINGS>)) + <geom_function>()

#Changing colors by species
ggplot(data = surveys, aes(x= weight, y = hindfoot_length, color = species_id)) + geom_point()

#making color more accessible 
ggplot(data = surveys, aes(x= weight, y = hindfoot_length, color = species_id)) + geom_point() + 
  scale_color_colorblind()


#viridis - converts to still be readable when published ----
# Load ggplot2 and viridis if needed
library(ggplot2)

#viridis discrete data 
ggplot(data = surveys, aes(x= weight, y = hindfoot_length, color = species_id)) + geom_point() + 
  scale_color_viridis_d(option = "B")

#viridis option for continuous - change end of code function after scale color viridis 
plot <- ggplot(data = surveys, aes(x= weight, y = hindfoot_length, color = weight)) + geom_point() + 
  scale_color_viridis_c(option = "B")

# installing for other types of accessibility 
install.packages("BrailleR")
library(BrailleR)

# Using this function to textually describe your plot!
BrailleR::VI(plot)
#if you were to publish, you'd need to make sure your labels are descriptive 

#sonification of your plots - for people who cannot see but could hear the data in terms of pitches 
install.packages("sonify")
library(sonify)

sonify(surveys$hindfoot_length)
