#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(leaflet)
library(readxl)
library(leaflet.extras)

# Define UI for application that draws a histogram
ui <- fluidPage(
    
    # Application title
    titlePanel("Districts Across Nepal"),
    
    leafletOutput("mymap")
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    
    output$mymap <- renderLeaflet({
        data <- read_excel("districts_lat_long.xlsx")
        m <- leaflet() %>% 
            addProviderTiles(providers$OpenStreetMap.Mapni) %>% 
            addMarkers(data = data,lat = ~Latitude, lng = ~Longitude, popup = ~Address)
    })
}

# Run the application 
shinyApp(ui = ui, server = server)

