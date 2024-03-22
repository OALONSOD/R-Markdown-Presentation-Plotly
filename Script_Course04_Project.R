# Cargar librerias
# install.packages("palmerpenguins")
library(palmerpenguins)
library(dplyr)
library(ggplot2)
library(plotly)
library(caret)

# Datos de estudio
data("penguins")
?penguins

# Limpiar datos
penguins <- penguins %>%
  na.omit()

# Resumen de datos
summary(penguins)
str(penguins)

# Histograma
g1 <- ggplot(penguins, aes(x=body_mass_g, fill = (sex), alpha = 0.5)) + 
  geom_histogram()
  #geom_density()
ggplotly(g1)

# Scatter plot
g2 <- ggplot(penguins, aes(x=bill_length_mm, y=body_mass_g, color=species))+
  geom_point()
ggplotly(g2)

# gráfico 3D plotly
g3 <- plot_ly(penguins, z=~body_mass_g, x=~bill_length_mm, y=~bill_depth_mm, color=~species) %>% 
  add_markers()
g3

# grafico evolución anual
g4 <- plot_ly(penguins, x=~bill_length_mm, y=~body_mass_g, color=~species, symbol=~sex, frame = ~year, size = 5)
g4

g5 <- ggplot(penguins, aes(x=bill_length_mm, y=body_mass_g, color=species))+
  geom_point(aes(shape=sex))+
  facet_grid(year ~ island)
#g5
ggplotly(g5)



g6 <- ggplot(penguins, aes(x=bill_length_mm, y=body_mass_g, color=species))+
  geom_boxplot(aes(fill = sex), alpha=0.5, size = 1)+
  facet_grid(year ~ island)
g6

