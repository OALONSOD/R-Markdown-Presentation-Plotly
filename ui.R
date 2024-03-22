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

# Define UI for application that draws a histogram
fluidPage(

    # Application title
    titlePanel("Size measurements for adult foraging penguins near Palmer Station, Antarctica"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
          h3("Selection of variables to compare"),
          varSelectInput("xvar", "X variable", penguins_num, selected = "bill_length_mm"),
          varSelectInput("yvar", "Y variable", penguins_num, selected = "body_mass_g"),
          hr(),
          radioButtons("graftype", label = h3("Select type of graph"), c("Scatter Plot","Boxplot")),
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("grafico")
        )
    )
)
