#week 7 homework
library(ggplot2)
library(dplyr)
library(tidyverse)
library(cowplot)
library(plotly)
library(gapmin)

#Install data 
gapminder <- read_csv("https://gge-ucd.github.io/R-DAVIS/data/gapminder.csv")

gapminder_wider <- gapminder %>% 
  select(1, 2, 3, 4) %>% 
  filter(year > 2000) %>% 
  pivot_wider(names_from = year, values_from = pop) %>% 
  mutate(change = `2007` - `2002`) %>% 
  filter(continent != "Oceania")

?facet_wrap
#Facets make multiple charts from the same dataset, whereas plot_grid makes multiple from diff datasets 
gapminder_viz <- 
  ggplot(data = gapminder_wider, mapping = aes(x = reorder(country, change), y = change)) +
           geom_col(aes(fill = continent)) + 
           facet_wrap(~ continent, scales = "free") +
  theme_wsj() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1, size = 5), axis.text.y = element_text(size = 8), strip.text = element_text(size = 7), legend.position = 'none', axis.title.x = element_text(size = 9, face = "bold"),  # Explicitly set x-axis title style
        axis.title.y = element_text(size = 9, face = "bold")) +
  xlab("Country") +
  ylab("Change in Population Between 2002 and 2007")
print(gapminder_viz)  
