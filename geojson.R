library(leaflet)
library(tidyverse)
library(sp)


nepal <- geojsonio::geojson_read("nepal_districts.geojson", what="sp")

leaflet(nepal) %>% addTiles() %>% addPolygons(stroke = TRUE)

data <- readxl::read_excel("districts_lat_long.xlsx")
m <- leaflet(nepal) %>% addPolygons(color = "blue",weight = 0.8,opacity = 0.3) %>% 
  addProviderTiles(providers$OpenStreetMap.Mapni) %>% 
  addMarkers(data = data,lat = ~Latitude, lng = ~Longitude, popup = ~Address)
m
