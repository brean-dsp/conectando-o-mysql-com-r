library(shiny)
library(stringr)
library(RMySQL)

con <- dbConnect(MySQL(),user="userCurso", password="teste123", host="localhost", dbname="")

sql <- "SELECT * FROM tbfilme"
res <- dbSendQuery(con, sql)
dados <- dbFetch(res)


ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      tags$h4("Conectando com BD")
    ),
    mainPanel(

      tableOutput("outTableId")
    )
  )
)

server <- function(input, output) {
    output$outTableId <- renderTable({dados})
}
shinyApp(ui,server)
