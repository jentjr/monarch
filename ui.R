library(sf)
library(ggplot2)
library(RColorBrewer)

counties <- st_read(dsn = "data", 
                    layer = "monarch_data_county_summaries_090915"
)

# remove GEOID, NAME, STATE_NAME, FIPS, 
fill_vars <- names(counties)[-c(1:4)]

shinyUI(fluidPage(

  # Application title
  titlePanel("Monarch Butterfly Habitat Tool"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      selectInput("layerInput", "Select Layer to Display", fill_vars),
      radioButtons("paletteType", "Select Palette", c("div", "qual", "seq")),
      conditionalPanel(
        condition = "input.paletteType == 'div'",
        selectInput("divPalette", "Select Pallete",
                    c("BrBG", "PiYG", "PRGn", "PuOr", "RdBu", "RdGy", 
                      "RdYlBu", "RdYlGn", "Spectral"))
      ),
      conditionalPanel(
        condition = "input.paletteType == 'qual'",
        selectInput("qualPalette", "Select Palette", 
                    c("Accent", "Dark2", "Paired", "Pastel1", 
                      "Pastel2", "Set1", "Set2", "Set3"))
      ),
      conditionalPanel(
        condition = "input.paletteType == 'seq",
        selectInput("seqPalette", "Select Pallete",
                    c("Blues", "BuGn", "BuPu", "GnBu", "Greens", "Greys", 
                      "Oranges", "OrRd", "PuBu", "PuBuGn", "PuRd", "Purples", 
                      "RdPu", "Reds", "YlGn", "YlGnBu", "YlOrBr", "YlOrRd")) 
      )
    ),

    # Show a plot of the counties
    mainPanel(
      plotOutput("map")
    )
  )
))
