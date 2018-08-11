library(shiny)
library(shinydashboard)
library(shinyjs)


genderchecker<- function(X){
  return(switch(substr(X,1,1),
                "1"="남",
                "3"="남",
                "2"="여",
                "4"="여",
                "5"="외",
                "6"="외",
                "error"))}
genderchecker(1889717)


genderchecker<- function(X){
  b<-substr(X,1,1)
  return(
    if(b=="1"||b=="3")"남" else
      if(b=="2"||b=="4")"여" else
        "외")}
genderchecker(2889717)

##문자 input의 경우
ui = shiny::fluidPage(
  useShinyjs(),
  textInput("text",label=h3("주민번호 입력"),value="(예시)900101-2"),
    shiny::actionButton("btn","클릭")
)

server=function(input,output,session){
  onclick("btn",info(genderchecker(input$text)))
}

if(interactive()){
  shinyApp(ui,server)
}
