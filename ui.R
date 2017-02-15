library(sf)

counties <- st_read(dsn = "data", 
                    layer = "monarch_data_county_summaries_090915"
)

shinyUI(fluidPage(

  # Application title
  titlePanel("Monarch Butterfly Habitat Tool"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      selectInput("layerInput", "Select Layer to Display", names(counties))
    ),

    # Show a plot of the counties
    mainPanel(
      plotOutput("map")
    )
  )
))
