if(!requireNamespace("shinyjs")){install.packages("shinyjs")}
if(!requireNamespace("shiny")){install.packages("shiny")}
if(!requireNamespace("shinydashboard")){install.packages("shinydashboard")}

library(shiny)
library(shinydashboard)
library(shinyjs)

bmi <- function(t,w){
  x <- w / ((t*t)/10000)
  return(if(x >=35)'고도 비만'else
    if(x >=30 & x < 35)'중등도 비만'else
      if(x >=25 & x < 30)'경도 비만'else
        if(x >=23 & x < 24.9)'과체중'else
          if(x>=18.5 & x < 22.9)'정상'else
            '저체중')
}
bmi(180.3,90)

ui = shiny::fluidPage(
  useShinyjs(),
  numericInput("t","키:",170,min=150,max=200),
  numericInput("w","몸무게:",70,min=40,max=100),
  shiny::actionButton("btn","클릭")
)

server=function(input,output,session){
  onclick("btn",info(bmi(input$t,input$w)))
}

if(interactive()){
  shinyApp(ui,server)
}
