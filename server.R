# Cargar librerias
# install.packages("palmerpenguins")
library(palmerpenguins)
library(dplyr)
library(ggplot2)
library(plotly)
library(caret)
library(shiny)

# Datos de estudio
data("penguins")
?penguins

# Limpiar datos
penguins <- penguins %>%
  na.omit()

penguins_num <- penguins %>% 
  select(where(is.numeric),-year)

# Define server logic required to draw a histogram
function(input, output, session) {

      output$grafico <- renderPlot({
       
        if (input$graftype == "Scatter Plot") {
          ggplot(penguins, aes(!!input$xvar, !!input$yvar, color=species))+
            geom_point(aes(shape=sex))+
            facet_grid(year ~ island)+
            theme (axis.text.x = element_text(hjust=1,face="bold", colour="black", size=rel(1.5)),axis.text.y = element_text(face="bold", colour="black", size=rel(1.5)))+
            labs(title = "PENGUINS STUDY",
                 subtitle = "ISLANDS AND YEAR OF STUDY")+
            theme(legend.position = "bottom")
        } else if (input$graftype == "Boxplot") {
          ggplot(penguins, aes(!!input$xvar, !!input$yvar, color=species))+
            geom_boxplot(aes(fill = sex), alpha=0.5, size = 0.5)+
            facet_grid(year ~ island)+
            theme (axis.text.x = element_text(hjust=1,face="bold", colour="black", size=rel(1.5)),axis.text.y = element_text(face="bold", colour="black", size=rel(1.5)))+
            labs(title = "PENGUINS STUDY",
                 subtitle = "ISLANDS AND YEAR OF STUDY")+
            theme(legend.position = "bottom")
        }
      })
     }
