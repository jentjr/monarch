
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
# https://github.com/hrbrmstr/ggvis-maps

library(shiny)
library(rgdal)
library(rgeos)
library(broom)
library(maptools)
library(ggvis)

shinyUI(fluidPage(

  # Application title
  titlePanel("Monarch Butterfly Habitat Tool"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(

    ),

    # Show a plot of the counties
    mainPanel(
      ggvisOutput("counties")
    )
  )
))
