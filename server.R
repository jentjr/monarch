
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
# https://github.com/hrbrmstr/ggvis-maps

library(shiny)
library(rgdal)
library(rgeos)
library(broom)
library(ggvis)

shinyServer(function(input, output, session) {

  
  progress <- shiny::Progress$new()
  progress$set(message = "Loading maps", value = 0)
  
  
  counties <- readOGR(dsn = "data", 
                      layer = "monarch_data_county_summaries_090915"
                      )
  
  map <- ggplot2::fortify(counties, region = "GEOID")
  
  map %>%
    group_by(group, id) %>%
    ggvis(~long, ~lat) %>%
    layer_paths(strokeOpacity := 0.15) %>%
    hide_legend("fill") %>%
    hide_axis("x") %>%
    hide_axis("y") %>%
    set_options(width = 400, height = 600, keep_aspect = TRUE) %>%
    bind_shiny("counties")

  progress$close()

})
