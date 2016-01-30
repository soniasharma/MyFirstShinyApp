library(shiny)

# Convert the categorical variables in mtcars to factor class
mtcars <- transform(mtcars, cyl=factor(cyl), vs=factor(vs), am=factor(am), gear=factor(gear), carb=factor(carb))

# A function which classifies a variable as quantitative categorical
varType <- function(x){
  ifelse (class(x) == "factor", "categorical","quantitative")
}


shinyServer(
  function(input, output){
output$obs <- renderPrint({
              head(mtcars, input$n)
              })    
 output$type <- renderText({
                varType(mtcars[ ,input$feature])
                }) 
 #output$levels <- renderText({levels(mtcars[ ,input$feature])})
 output$summ <- renderPrint({
                summary(mtcars[ ,input$feature])
                 })
 output$plot <- renderPlot({
                plot(x=mtcars[ ,input$xvar], y=mtcars[ ,input$yvar], 
                xlab=input$xvar, ylab=input$yvar)
                })
  
 })