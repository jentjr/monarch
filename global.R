library(sf)
library(ggplot2)
library(viridis)

counties <- st_read(dsn = "data", 
                    layer = "monarch_data_county_summaries_090915"
)

# remove GEOID, NAME, STATE_NAME, FIPS, 
fill_vars <- names(counties)[-c(1:4)]