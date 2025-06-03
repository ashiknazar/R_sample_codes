library(shiny)

# UI: What the user sees
ui <- fluidPage(
  titlePanel("Hello Shiny!"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("num", "Choose a number", 1, 100, 50)
    ),
    mainPanel(
      textOutput("result")
    )
  )
)

# Server: What happens behind the scenes
server <- function(input, output) {
  output$result <- renderText({
    paste("You chose:", input$num)
  })
}

# Launch the app
shinyApp(ui = ui, server = server)
