# Rshiny
# http://yanping.me/shiny-tutorial/
library(shiny)
runApp("E:/Dropbox/github_qxs/My_Scripts/Rstudy/shiny_example")

#





##########################################################
#http://yanping.me/shiny-tutorial/
  
library(shiny)
runExample("01_hello")
runExample("02_text")
runExample("03_reactivity")

# input values => R code => output values

# input
datasetInput <- reactive({
  switch(input$dataset,
         "rock" = rock,
         "pressure" = pressure,
         "cars" = cars)
})

# output
output$view <- renderTable({
  head(datasetInput(), n = input$obs)
})



# ui.R
# Define UI for dataset viewer application
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Reactivity"),
  
  # Sidebar with controls to provide a caption, select a dataset, and 
  # specify the number of observations to view. Note that changes made
  # to the caption in the textInput control are updated in the output
  # area immediately as you type
  sidebarPanel(
    textInput("caption", "Caption:", "Data Summary"),
    
    selectInput("dataset", "Choose a dataset:", 
                choices = c("rock", "pressure", "cars")),
    
    numericInput("obs", "Number of observations to view:", 10)
  ),
  
  
  # Show the caption, a summary of the dataset and an HTML table with
  # the requested number of observations
  mainPanel(
    h3(textOutput("caption")), 
    
    verbatimTextOutput("summary"), 
    
    tableOutput("view")
  )
))



















