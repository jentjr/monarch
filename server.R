shinyServer(function(input, output, session) {

  output$map <- renderPlot({
    ggplot(counties) + geom_sf(aes_string(fill = input$layerInput)) + 
      theme_bw() + 
      scale_fill_viridis()
   })

})
