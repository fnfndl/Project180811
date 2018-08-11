library(shiny)
library(shinydashboard)
library(shinyjs)



rps <- function(x){
  return(switch(toString(
    sample(1:3,1,replace = TRUE) - x)
    ,'0'='TIE',
    '1'='WIN',
    '-2'='WIN',
    '-1'='LOSE',
    '2'='LOSE'))
}
rps(3)

ui = shiny::fluidPage(
  useShinyjs(),
  numericInput("x","입력:",2,min=1,max=3),
  shiny::actionButton("btn","클릭")
)

server=function(input,output,session){
  onclick("btn",info(rps(input$x)))
}

if(interactive()){
  shinyApp(ui,server)
}


##셀렉트박스


library(shiny)
ui <- fluidPage(
  titlePanel("가위바위보"),
  sidebarLayout(
    sidebarPanel(
      helpText("셀렉트박스에서 선택하세요"),
      selectInput("var", 
                  label = "가위바위보 게임",
                  choices = c("가위", 
                              "바위",
                              "보"),
                  selected = "가위")
    ),
    mainPanel(
      textOutput("selected_var")
    )
  )
)
server <- function(input, output) {
  output$selected_var <- renderText({ 
    paste("경기결과 :: ", input$var)
  })
}
if (interactive()) {
  shiny::shinyApp(ui,server)
}
