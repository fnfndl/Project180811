
if(!requireNamespace("ggmap")){install.packages("ggmap")}
#구글맵을 처리하는 패키지 ggmap
update.packages(checkBuilt = T,ask=F)
library(tm)
library(wordcloud)
library(RColorBrewer)
library(ggplot2)
library(ggmap)


names <- c("1. 역삼더블루점",
           "2. 역삼상록점",
           "3. 역삼역점")
addr <- c("서울특별시 강남구 논현로63길 16",
          "서울특별시 강남구 테헤란로43길 18",
          "서울특별시 강남구 테헤란로25길 17")

(gc <- geocode(enc2utf8(addr))) #구글맵이 한글을 인식하지 못하기 때문에 enc2utf8을 씀 #괄호를 씌워서 anonymous 함수를 만듬 
(df<-data.frame(name=names,
               lon=gc$loc,lat=gc$lat)) #위도경도
cen <- c(mean(df$lon),mean(df$lat))
map <- get_googlemap(center = cen,
                     maptype = "roadmap",
                     markers = gc)
ggmap(map)
gmap <- ggmap(map)
gmap+geom_text(
  data=df,
  aex(x=lon,y=lat),
  size=5,
  lable=df$name
)

map <- get_googlemap()