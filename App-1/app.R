library(shiny)

# Define UI ----
ui <- fluidPage(
  titlePanel("title panel"),

  sidebarLayout(
    sidebarPanel('sidebar panel',
                 h1("First level title", align='center'),
                 h2("Second level title"),
                 h3("Third level title"),
                 h4("Fourth level title"),
                 h5("Fifth level title"),
                 h6("Sixth level title")),
    mainPanel("hola")
  )
)

# Define server logic ----
server <- function(input, output) {

}

# Run the app ----
shinyApp(ui = ui, server = server)
