library(shiny)
attach(mtcars)

shinyUI(fluidPage(
  titlePanel(title="Some Exploratory Analysis for the mtcars"),
  sidebarLayout(
    sidebarPanel(
      conditionalPanel(
        'input.tab === "Data"', 
      sliderInput("n", "Number of observations", min=1, max=32, value=7)),
      
      conditionalPanel(
        'input.tab === "Summary"', 
      "Select a variable to see its summary",
      selectInput("feature"  ,"", names(mtcars)
                  )),
      
      conditionalPanel(
        'input.tab === "Plot"', 
      "Select x and y variables to for a plot",
      selectInput("xvar", "x", names(mtcars)
                  ),
      selectInput("yvar", "y", names(mtcars)
                  ))
                  
      ),
    mainPanel(
      tabsetPanel(
        id='tab',
        tabPanel("Data", verbatimTextOutput("obs")),
        
        tabPanel("Summary", 
                 h5("The selected variable is"),
                 textOutput("type"),  
                 h5("The summary statistics of this variable is"),
                 verbatimTextOutput("summ")),
        
        tabPanel("Plot", plotOutput("plot")),
       
        tabPanel("Documentation",
                h5("This shiny app helps with the visulization and understanding of some of the                    basic aspects of the mtcars dataset. There are four tabs:"),
                
                h4("Data Tab"),
                "Set a number on the slider to see a given number of observations in the data. The                    default number of observations shown is 7.",
                
                h4("Summary Tab"),
                "Select a variable in the left hand side panel to see the type and the statistical                  summary of that variable.",
                
                h4("Plot Tab"),
                "Select values for the x and the y variables to see the plot. Depending upon the                   type of variables selected we get a scatterplot, box plots or bar plots.",
                
                h4("Documentation Tab"),
                "Users guide to using this shiny app. Hope you enjoyed playing with it!"
                
                )
      )
      )
  )
  
))
