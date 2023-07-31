library(ggplot2)
library(tidyr)
library(gganimate)
theme_set(theme_bw())
library(gapminder)
head(gapminder)

## Life expectancy face_wrap 
plot4 = gapminder %>% ggplot(
  aes(x = gdpPercap, y=lifeExp, size = pop, colour = country)
) +
  ggtitle("Life Expectancy vs GDP per Capita by Country") +
  labs(x = "GDP Per Capita", 
       y = "Life Expectancy", 
       color = "Continent",
       caption = "Source: Hans Rosling's gapminder data on health and wealth") +
  geom_point(show.legend = FALSE, alpha = 0.7) +
  #scale_color_viridis_d() 
  scale_color_manual(values = country_colors)+
  scale_size(range = c(2, 12)) +
  scale_x_log10() +
  #labelling
  labs(x = "GDP per capita", y = "Life expectancy") 
  
#movement of the time
  plot4 + transition_time(year) +
    #time frame
  labs(title = "Year: {frame_time}") +
    #shadowing the movement
    shadow_wake(wake_length = 0.1, alpha = FALSE) +
    #marking the shadow
    shadow_mark(alpha = 0.3, size = 0.5) + 
    #making frames
    facet_wrap(~continent) +
    view_follow(fixed_y = TRUE) + 
    ease_aes('linear')
    
  ## Save into git
  plot4.animate
  anim_save("gapminder plot9.gif") 

  
  
  ## graph in one frame
  
  library(ggplot2)
library(ggplot)
library(dplyr)
library(gapminder) 
library(ggthemes)

  plot1 = gapminder %>% 
    ggplot(aes(x = gdpPercap, y = lifeExp, color = continent, size = pop)) + 
    geom_point(alpha = 0.7, stroke = 0) + 
    theme_fivethirtyeight() +
    scale_size(range = c(2, 12), guide = "none") + 
    scale_x_log10() + 
    
    #labelling
    labs(title = "Life Expectancy vs GDP per Capita by Country",
         x = "GDP Per Capita", 
         y = "Life Expectancy", 
         color = "Continent",
         caption = "Source: Hans Rosling's gapminder data on health and wealth") + 
    #theme
    theme(axis.title = element_text(), 
          text = element_text(family = "serif"), 
          legend.text = element_text(size = 10)) + 
    scale_color_brewer(palette = "Set2")
  
  plot1.animate = plot1 + 
    transition_time(year) # adding the transition effect
  
  plot1.animate = plot1 + 
    transition_time(year) + 
    labs(subtitle = "Year: {frame_time}")
  
  # Add shadow wake trail to show how the point are moving over time 
  
  plot1.animate = plot1 + 
    transition_time(year) + 
    labs(subtitle = "Year: {frame_time}") + 
    shadow_wake(wake_length = 0.1)
  
  ## View the plot
  plot1.animate
  ## save in gif
  anim_save("gapminder plot1.gif")     
getwd()  
