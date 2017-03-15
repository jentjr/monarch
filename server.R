library(sf)
library(ggplot2)

counties <- st_read(dsn = "data", 
                    layer = "monarch_data_county_summaries_090915"
            )

shinyServer(function(input, output, session) {

  
  output$map <- renderPlot({
   
    palette <- switch(
      input$divPalette, 
      
    )
    
    layerSelected <- input$layerInput
    ggplot(counties) + geom_sf(aes_string(fill = layerSelected)) + 
      theme_bw() + 
      scale_fill_distiller(type = input$paletteType, 
                           palette = input$palette)
  
   })

})
