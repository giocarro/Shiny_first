# C:/Users/Gio Carro/Documents/R_exercises/Data_Science/census-app/app.R

# counties.rds is a dataset of demographic data for each county in the 
# United States, collected with the UScensus2010 R package.

library(shiny)
library(maps)
library(mapproj)
library(dplyr)

source("helpers.R")
counties <- readRDS("data/counties.rds")
df_counties <- data.frame(counties)

ui <- fluidPage(
  titlePanel("censusVis"),
  
  fluidRow(
    column(6,
           helpText("Create demographic maps with 
                    information from the 2010 US Census."),
           
           selectInput("var",
                       label = "Choose a variable to display",
                       choices = c("Percent White",
                                   "Percent Black",
                                   "Percent Hispanic",
                                   "Percent Asian"),
                       selected = "Percent White"),
           
           sliderInput("range",
                       label = "Range of interest:",
                       min = 0, max = 100, value = c(2, 80)),
    ),
    
    column(6,
           textOutput("selected_var"),
           textOutput("selected_range"),
           plotOutput("map"),
           
           plotOutput(outputId = "distPlot"),
           tableOutput("table")
           # textOutput("range_type")
    )
           
      
  )
    
)

server <- function(input, output) {
  
  output$selected_var <- renderText({ 
    paste("You have selected", input$var)
  })
  
  output$selected_range <- renderText({ 
    paste("You have chosen a range that goes from", min(input$range), "to", max(input$range) )
  })

  # How to render a map with  reactive arguments
  output$map <- renderPlot({
    
    # MORE CONCISE
    args <- switch(input$var,
                   "Percent White" = list(counties$white, "darkgreen", "% White"),
                   "Percent Black" = list(counties$black, "black", "% Black"),
                   "Percent Hispanic" = list(counties$hispanic, "darkorange", "% Hispanic"),
                   "Percent Asian" = list(counties$asian, "darkviolet", "% Asian"))

    args$min <- input$range[1]
    args$max <- input$range[2]
    
    do.call(percent_map, args)
  })
  
  #Here is where the histogram goes
  output$distPlot <- renderPlot({
    
    x    <- switch (input$var,
                    "Percent White" = counties$white,
                    "Percent Black" = counties$black,
                    "Percent Hispanic" = counties$hispanic,
                    "Percent Asian" = counties$asian
    )
    
    #bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    hist(x, breaks = 100, col = "#75AADB", border = "white",
         xlab = input$var,
         main = paste0("Histogram of ",input$var," people.") 
    )
    
  })
  
  
  #Here is where our analysis will show in the table
  output$table <- renderTable(
    dplyr::filter(counties, 
                           # white >= min(input$range) & white <= max(input$range))
                           switch(input$var, 
                                  "Percent White" = counties$white >= min(input$range) & counties$white <= max(input$range),
                                  "Percent Black" = counties$black >= min(input$range) & counties$black <= max(input$range),
                                  "Percent Hispanic" = counties$hispanic >= min(input$range) & counties$hispanic <= max(input$range),
                                  "Percent Asian" = counties$asian >= min(input$range) & counties$asian <= max(input$range)
                           )
    ) %>% select(name,
                 total.pop,
                 switch (input$var,
                         "Percent White" = "white",
                         "Percent Black" = "black",
                         "Percent Hispanic" = "hispanic",
                         "Percent Asian" = "asian"
                 ))
  )

}

shinyApp(ui = ui, server = server)