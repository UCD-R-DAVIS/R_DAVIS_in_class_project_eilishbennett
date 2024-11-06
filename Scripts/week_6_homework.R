#Week 6 Homework
library(dplyr)
library(tidyverse)

gapminder <- read_csv("https://gge-ucd.github.io/R-DAVIS/data/gapminder.csv")

head(gapminder)

# First calculates mean life expectancy on each continent. Then create a plot that shows how life expectancy has changed over time in each continent. Try to do this all in one step using pipes! (aka, try not to create intermediate dataframes)

gapminder %>% 
  group_by(continent, year) %>%
  summarize(avg_le = mean(lifeExp)) %>% 
  ggplot +
  geom_point(aes(x = year, y = avg_le, color = continent))+
  geom_line(aes(x = year, y = avg_le, color = continent))


#Look at the following code and answer the following questions. What do you think the scale_x_log10() line of code is achieving? What about the geom_smooth() line of code? 
ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(color = continent), size = .25) + 
  scale_x_log10() +
  geom_smooth(method = 'lm', color = 'black', linetype = 'dashed') +
  theme_bw() 
#I think the scale_x_log10() code is changing the scale of the x axis to be more readable instead of being such a large number. 
# I think the geom_smooth code is adjusting visual features of the line by making it black and dashed. I asked chatgpt what "lm" means and found out that the code is running a linear regression on the data points. 

#Challenge! Modify the above code to size the points in proportion to the population of the country. Hint: Are you translating data to a visual feature of the plot?
ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(color = continent, size = pop), alpha = 0.5)  + 
  scale_x_log10() +
  geom_smooth(method = 'lm', color = 'black', linetype = 'dashed') +
  theme_bw()

#With the help of Chatgpt, I included the size=pop inside the aesthetics parentheses (was leaving it out before). Also added some transparency to the points with the help of alpha function to reduce overlapping points. 

#Hint: There’s no cost to tinkering! Try some code out and see what happens with or without particular elements.

#Create a boxplot that shows the life expectency for Brazil, China, El Salvador, Niger, and the United States, with the data points in the backgroud using geom_jitter. Label the X and Y axis with “Country” and “Life Expectancy” and title the plot “Life Expectancy of Five Countries”.

included_countries <- c('Brazil', 'China', 'El Salvador', 'Niger', 'United States')
filtered_countries <- gapminder %>% 
  filter(country %in% included_countries)


ggplot(data = filtered_countries, mapping = aes(x = country, y = lifeExp)) +
       geom_boxplot() +
  geom_jitter(alpha = 0.93, color = "orange")+
         theme_bw() + 
         labs(title = "Life Expectancy of Five Countries", x = "Country", y = "Life Expectancy")
