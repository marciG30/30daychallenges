# historical



##
library(tidyverse)
library(ggforce)
theme_set(theme_void())
library(readxl)
library(lubridate)

## load the timeline file

timeline = read_excel("may BES run timeline.xlsx")

timeline %>% 
  ggplot(aes(x = datetime, label = actions)) +
  
  annotate("segment", 
           x = ymd_hms("2021-05-18 12:00:00"), 
           xend = ymd_hms("2021-06-28 12:00:00"), 
           y = 0, yend = 0, 
           size = 1, color = "#e76f51")+
  geom_mark_circle(aes(y = 0, label = actions, group = actions),
                   con.cap = -5, fill = NA, color = NA, label.fontsize = 8, label.hjust = 0,
                   con.size = 0.5, con.border = "one",
                   con.type = "elbow")+
  
  geom_point(aes(y = 0), size = 3, shape = 21, stroke = 1.5, fill = "white")+
  labs(title = "BES Geobacter run",
       caption = "May to July run")

#  theme_bw()+
theme(legend.position = "none",
      plot.background = element_rect(fill = "#F9F8F1", color = NA),
      plot.title = element_text(hjust = 0.5, face = "bold", size = 25, family = "Patua"),
      plot.subtitle = element_text(hjust = 0.5, face = "italic", size = 22),
      plot.caption = element_text(hjust = 0.5, color = "grey50", family = "Lato")) +
  xlim(950, 8700)+ ylim(-10,10)

