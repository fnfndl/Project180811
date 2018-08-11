##기본문법
# ui <-  fulidpage(
#  titlePanel()
#  sidebarPanel()
#  mailPanel()
#  )
# server <- function(input,output){
#  }

if(!requireNamespace("plotly")){install.packages("plotly")}

library(shiny)
library(shinydashboard)
library(shinyjs)
library(ployly) ##샤이니와 짝꿍


data = data.frame(
  population
)

ui <- fluidPage(
  titlePanel(
    title=h4("인구조사",
             alig="center")),
  sidebarPanel(
    radioButtons("YEAR","10년주기선택",
                 choice=c("2000","2010"),
                 selected="2000")),
  mainPanel(
    plotOutput("bar",height=500))
)

server <- function(input,output){
  reactive_year=reactive({
    selectec_year=as.numeric(input$YEAR)
    return(data[data$year==selected_year,])
  })
  output$bar <-  renderPlot({
  color <- c("blue","red")
  our_data <- reactive_data()
  barplot(colSums(our_data[,c("population","households")]),
          ylab="Total",
          xlab="Census Year",
          names.arg = c("population","households"),
          col=color)
})
}
