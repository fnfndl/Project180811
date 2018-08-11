library(ggplot2)
library(ggmap)

names <- c("1. 역삼더블루점",
           "2. 역삼상록점",
           "3. 역삼역점")
(gc<- geocode(enc2utf8("서울")))
(cen <- as.numeric(gc))
map <- get_googlemap(
  center=cen,
  zoom=10,
  maptype = "roadmap"
)
ggmap(map)
