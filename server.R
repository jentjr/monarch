library(sf)

counties <- st_read(dsn = "data", 
                    layer = "monarch_data_county_summaries_090915"
            )

shinyServer(function(input, output, session) {

  
  output$map <- renderPlot({
   
    layerSelected <- input$layerInput
    plot(counties[[layerSelected]])
  
   })

})
