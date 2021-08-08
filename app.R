library(shiny)

ui <- fluidPage(
  
  fluidRow(column(4, selectInput(inputId = "I1", label = "Env Variable", choices = c("Yes", "No"), selected = "No")),
           column(8, textOutput(outputId = "O1")))
)

server <- function(input, output, session) {
  
  output$O1 <- renderText({
    
    if (input$I1 == "Yes") {
      
      return(Sys.getenv("TESTENV"))
      
    } else if (input$I1 == "No") {
      
      return("Empty String")
      
    }
    
  })
  
}
  
# RUN ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# run the application 
shinyApp(ui = ui, server = server)
