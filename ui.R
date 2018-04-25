shinyUI(fluidPage(

  # Application title
  titlePanel("Monarch Butterfly Habitat Tool"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      selectInput("layerInput", "Select Layer to Display", fill_vars)
    ),
    # Show a plot of the counties
    mainPanel(
      plotOutput("map")
    )
  )
))
