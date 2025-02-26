## Code for LTER Data Visualization and Exploration Workshop
## SOURCE: https://lter.github.io/ssecr/mod_data-viz.html

# install.packages("lterdatasampler") 
# install.packages("librarian")
# install.packages("summarytools")

library(librarian)
librarian::shelf(tidyverse,lterdatasampler, ggplot2, cowplot)

## decide on a dataset you want to work with
## list here: https://lter.github.io/lterdatasampler/

data(pie_crab)
str(pie_crab)

ggplot(data = pie_crab, mapping = aes(x = latitude, y = size, fill = site)) +
  geom_point(pch = 21, size = 2, alpha = 0.5)

# Define core theme elements
theme_workshop <- theme(legend.position = "none",
                        panel.background = element_blank(),
                        axis.line = element_line(color = "black"),
                        axis.text = element_text(size = 12))

# Create a graph
ggplot(pie_crab, aes(y = water_temp, x = air_temp, color = size, size = size)) +
  geom_point() +
  theme_workshop +
  theme(legend.position = "right")

# Create multipanel graph
ggplot(pie_crab, aes(x = date, y = size, color = site))+
  geom_point(size = 2) +
  facet_wrap(. ~ site) +
  theme_bw() +
  theme(legend.position = "none")

# Create the first cowplot graph
crab_p1 <- ggplot(pie_crab, aes(x = site, y = size, fill = site)) +
  geom_violin() +
  coord_flip() +
  theme_bw() +
  theme(legend.position = "none")

# Create the second cowplot graph
crab_p2 <- ggplot(pie_crab, aes(x = air_temp, y = water_temp)) +
  geom_errorbar(aes(ymax = water_temp + water_temp_sd, ymin = water_temp - water_temp_sd),
                width = 0.1) +
  geom_errorbarh(aes(xmax = air_temp + air_temp_sd, xmin = air_temp - air_temp_sd),
                 width = 0.1) +
  geom_point(aes(fill = site), pch = 23, size = 3) +
  theme_bw()

# Assemble into a plot grid
cowplot::plot_grid(crab_p1, crab_p2, labels = "AUTO", nrow = 1)

# Presenting information in multiple ways
ggplot(data = pie_crab, mapping = aes(x = latitude, y = size, 
                                      fill = site, shape = site)) +
  geom_jitter(size = 2, width = 0.1, alpha = 0.6) +  
  scale_shape_manual(values = c(21:25, 21:25, 21:23)) +
  theme_bw() +
  theme(legend.title = element_blank())

