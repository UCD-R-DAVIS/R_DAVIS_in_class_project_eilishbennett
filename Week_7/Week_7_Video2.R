#Week 7 vid 2 
install.packages("cowplot")
library(cowplot)
library(tidyverse)

diamonds

# make a few plots:
(plot.diamonds <- ggplot(diamonds, aes(clarity, fill = cut)) + 
  geom_bar() +
  theme(axis.text.x = element_text(angle=70, vjust=0.5)))
#plot.diamonds
#above, if you embed the whole code, including making the new variable, into parenthesees, it will make the variable and run the plot at the same time

#plot.diamonds
mpg
(plot.cars <- ggplot(mpg, aes(x = cty, y = hwy, colour = factor(cyl))) + 
  geom_point(size = 2.5))
#plot.cars

iris
(plot.iris <- ggplot(data=iris, aes(x=Sepal.Length, y=Petal.Length, fill=Species)) +
  geom_point(size=3, alpha=0.7, shape=21))

#use plot_grid
(panel_plot <- plot_grid(plot.cars, plot.iris, plot.diamonds, labels=c("1", "2", "3"), ncol=2, nrow = 2))

str(panel_plot)

library(ggthemes)
# fix the sizes draw_plot
?ggdraw
fixed_gridplot <- ggdraw() + 
  draw_plot(plot.iris, x = 0, y = 0, width = 1, height = 0.5) +
  draw_plot(plot.cars, x=0, y=.5, width=0.5, height = 0.5) +
  draw_plot(plot.diamonds, x=0.5, y=0.5, width=0.5, height = 0.5) + 
  draw_plot_label(label = c("MPG Data","diamonds data","iris data"), x = c(0, 0.5, 0), y = c(1, 1, 0.5)) + 
  theme_bw()

fixed_gridplot

ggsave(filename = "Figures/testplot.png", plot = fixed_gridplot)


#plotly is interactive!
library(plotly)

plot.iris <- ggplot(data=iris, aes(x=Sepal.Length, y=Petal.Length, fill=Species)) +
  geom_point(size=3, alpha=0.7, shape=21)

plotly::ggplotly(plot.iris) #it's as simple as that! 