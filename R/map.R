library(rgdal)
library(rgeos)
library(broom)


load_county_map <- readOGR(dsn = "data", 
                      layer = "monarch_data_county_summaries_090915"
                      )

