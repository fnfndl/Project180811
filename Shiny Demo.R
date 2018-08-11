if(!requireNamespace("rJava")){install.packages("rJava")}
## 이미 설치가 되어 있으면 설치하지 말라는 뜻
if(!requireNamespace("DBI")){install.packages("DBI")}
if(!requireNamespace("RJDBC")){install.packages("RJDBC")}
if(!requireNamespace("XML")){install.packages("XML")}
if(!requireNamespace("memoise")){install.packages("memoise")}
if(!requireNamespace("KoNLP")){install.packages("KoNLP")}
if(!requireNamespace("wordcloud")){install.packages("wordcloud")}
if(!requireNamespace("dplyr")){install.packages("dplyr")}
if(!requireNamespace("ggplot2")){install.packages("ggplot2")}
if(!requireNamespace("ggmap")){install.packages("ggmap")}
if(!requireNamespace("rvest")){install.packages("rvest")}
if(!requireNamespace("RColorBrewer")){install.packages("RColorBrewer")}
if(!requireNamespace("data.table")){install.packages("data.table")}
if(!requireNamespace("dplyr")){install.packages("dplyr")}
if(!requireNamespace("reshape")){install.packages("reshape")}
if(!requireNamespace("shiny")){install.packages("shiny")}
 
library(rJava)
 library(DBI)
 library(RJDBC)
 library(XML)
 library(memoise)
 library(KoNLP)
 library(wordcloud)
 library(dplyr)
 library(ggplot2)
 library(ggmap)
 library(rvest)
 library(RColorBrewer)
 library(data.table)
 library(reshape)
library(shiny)

ui <- fluidPage(
  sliderInput(
    inputId = "num1",
    label = "숫자를 고르세요",
    value = 25, min = 1, max = 50, step =1), ##디폴트가
  plotOutput(
    "hist"
  )
)
server <- function(input, output){
  output$hist <-  renderPlot({
  hist(rnorm(input$num1),
       main="50에서 랜덤숫자")
  })
}

shinyApp(ui, server)
##ui는 화면, server는 로직을 의미

