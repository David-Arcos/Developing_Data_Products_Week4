ui <- fluidPage(
  titlePanel("Developing Data Products: Course Project Week 4"), 
  sidebarLayout(
    sidebarPanel(
      h1("Sidebar Panel"),
      h2("Widgets"),
      br(),
      br(),
      
      selectInput(
        inputId = "continent",
        label = "Choose a continent:",
        choices = c("Asia" = "Asia", 
                    "Europe" = "Europe", 
                    "Africa" = "Africa", 
                    "Americas" = "Americas", 
                    "Oceania" = "Oceania"),
        selected = "Americas",multiple = TRUE),
      helpText("Note: the 'Continent' widget will only affect Plot.1" ),
      
      selectInput(inputId = "country",
                  label = "Selected country:", 
                  choices = all_countries, 
                  selected = "Ecuador"),
      helpText("Note: the 'Country' widget will only affect Plot.2" ),
      
      sliderInput("range",
                  label = "Period:",
                  min = min_year, max = max_year, step = 1,sep = "", 
                  value = c(min_year, max_year)),
      helpText("Note: the 'Date range' widget will affect both plots, but not the data table" ),
      
      tags$hr(), 
      
      checkboxInput(
        inputId = "show_data",
        label = "Show data table"),
      
      tags$hr()),
    
    mainPanel(
      h1("Main Panel"),
      h3("Plot 1.Evolution of life expectancy vs. GDP per capita, by continent"),
      plotOutput(outputId = "plot1",width = 1000,height = 350),
      br(),
      p("When all the continents are selected, we can see the Europe is the country with the largest life expectancy 
                    \nas well with the highest levels of GDP per capita, followed by some observations that belong to America, Oceania and Asia. 
                    \nOn the other hand, as expected, the continent with the least life expectancy and GDP per capita is Africa."),
      tags$hr(),
      h3("Plot 2.Evolution of life expectancy vs. GDP per capita, by country"),
      plotOutput(outputId = "plot2",width = 930,height = 350), 
      br(),
      p("As you can see in Plot 2, in the hometown of the author you can see that GDP per capita grows until reaching a point, 
                    about 60 year of life expectancy, \nhowever, beyond that point, the GDP per capit seems to stall, and again decreases after 70 years of life expectancy."),
      tags$hr(),
      h3("Data table by country (show when the data table buttom is selected)"),
      dataTableOutput(outputId = "data_table"))
    
  ) 
)
