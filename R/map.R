library(sf)

load_county_map <- st_read(dsn = "data", 
                      layer = "monarch_data_county_summaries_090915"
                      )

