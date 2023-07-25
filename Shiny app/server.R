library(gapminder)
library(shiny)
library(tidyverse)
library(ggplot2)
library(lubridate)
library(DT)

data("gapminder")
data <- as.data.frame(gapminder); rm(gapminder)
all_countries <- sort(unique(data$country))
min_year <- min(data$year)
max_year <- max(data$year)

# Define server logic ---
server <- function(input, output) {
  
  datainput1 <- reactive({
    data %>% 
      filter(year >= input$range[1] & year <= input$range[2] & 
               continent %in% input$continent) 
  })
  
  output$plot1 <- renderPlot({
    ggplot(data = datainput1(), aes(x = lifeExp, y = gdpPercap, color = continent)) +
      geom_point() +
      geom_smooth() +
      labs(main = "Plot.1")
  })
  
  datainput2 <- reactive({
    data %>% 
      filter(year >= input$range[1] & year <= input$range[2] &
               country %in% input$country) 
  })
  
  output$plot2 <- renderPlot({
    ggplot(data = datainput2(), aes(x = lifeExp, y = gdpPercap)) +
      geom_point(color = "blue") +
      geom_smooth(color = "blue") +
      labs(main = "Plot.2")
  })
  
  datainput3 <- reactive({
    data %>% 
      filter(country %in% input$country) %>% 
      select(continent:gdpPercap)
  })
  
  observeEvent(input$show_data, {
    if(input$show_data) {
      output$data_table <- renderDT({
        datatable(datainput3(), options = list(pageLength = 10))
      })
    } else {
      output$data_table <- renderDT({
        datatable(NULL)  # Mostramos una tabla vacía
      })
      
    }
    
  })
  
}



