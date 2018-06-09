library(ggmap)
geocode("Baglung", output = "latlona",source = "google")

for(i in 1:nrow(origAddress))
{
  # Print("Working...")
  result <- geocode(origAddress$addresses[i], output = "latlona", source = "google")
  origAddress$lon[i] <- as.numeric(result[1])
  origAddress$lat[i] <- as.numeric(result[2])
  origAddress$geoAddress[i] <- as.character(result[3])
}


For more see here:

http://www.storybench.org/geocode-csv-addresses-r/
