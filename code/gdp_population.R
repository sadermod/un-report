2+2
## Use Cmd Enter to run a line of code

library(tidyverse)

gapminder_1997 <- read_csv("data/gapminder_1997.csv")

Sys.Date() # provides the date
getwd() # current working directory

round(3.1415, digits = 2)

ggplot(data = gapminder_1997) +
  aes(x = gdpPercap) +
  labs(x = "GDP Per Capita") +
  aes(y= lifeExp) +
  labs(y = "Life Expectancy") +
  geom_point() +
  labs(title = "Do people in wealthy countries live longer?") +
  aes(color = continent) +
  scale_color_brewer(palette = "Set1") +
  aes(size = pop/1000000) + #scales the size by population
  labs(size = "Population (in millions)")


##Cool color palettes on color brewer


ggplot(data = gapminder_1997) +
  aes(x = gdpPercap, y = lifeExp, color = continent, size = pop/1000000) +
  geom_point() +
  labs(x = "GDP Per Capita", y = "Life Expectancy", 
       title = "Do people in wealthy countries live longer?", 
       size = "Popoulation (in millions)") +
  scale_color_brewer(palette = "Set1")


## now read in the full dataset
gapminder_data <- read.csv("gapminder_data.csv")
head(gapminder_data)
dim(gapminder_data)

#group by country, use geom_line for spaghetti plot
ggplot(data = gapminder_data) +
  aes(x=year, y=lifeExp, color=continent, group=country)+
  geom_line()

##life expectancy per continent
ggplot(data = gapminder_data) +
  aes(x=continent, y=lifeExp) +
  geom_boxplot() +
  geom_point() +
  geom_jitter()

#order matters when layering plots
ggplot(data = gapminder_data) +
  aes(x=continent, y=lifeExp, color = continent) +
  geom_jitter() +
  geom_boxplot(color="black")

#color aesthetic can be put inside certain geoms and fill boxes
#color refers to outline, fill refers to the inside
ggplot(data = gapminder_data) +
  aes(x=continent, y=lifeExp) +
  geom_jitter(aes(color=continent)) +
  geom_boxplot(fill="yellow")

#change transparency of dots using alpha
ggplot(data = gapminder_data) +
  aes(x=continent, y=lifeExp) +
  geom_boxplot() +
  geom_jitter(alpha = 0.2)

#colors must be in quotes

## HISTOGRAM to look at the distribution of life expectancy
#use themes!! 
ggplot(data = gapminder_1997) +
  aes(x=lifeExp) +
  geom_histogram(bins=20) +
  theme_bw()


##help tab > cheat sheets

## Use facets to divide up plots 
ggplot(data = gapminder_1997) +
  aes(x = gdpPercap, y = lifeExp) +
  geom_point() +
  facet_wrap(vars(continent)) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#this aligns the data by rows
ggplot(data = gapminder_1997) +
  aes(x = gdpPercap, y = lifeExp) +
  geom_point() +
  facet_grid(rows=vars(continent))

##stackoverflow has really good resources (google)

#violin plot
ggplot(data = gapminder_1997) +
  aes(x = continent, y = lifeExp) +
  geom_violin(aes(fill = continent)) +
  theme_classic() 
ggsave("figures/testplot.jpg")

#assign a variable to a plot
violin_plot <-ggplot(data = gapminder_1997) +
  aes(x = continent, y = lifeExp) +
  geom_violin(aes(fill = continent)) +
  theme_classic() 

violin_plot

ggsave("figures/testplot2.jpg", plot=violin_plot, width = 6, height = 4)
