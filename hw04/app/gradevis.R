###################################
# title: "HW04 Grade Visualizer App"
# subtitle: "Stat 133, Fall 2017"
# author: "Olivier"
###################################

# required packages
library(shiny)
library(ggvis)
library(dplyr)

lister <- c("HW1", "HW2", "HW3", "HW4", "HW5", "HW6", "HW7","HW8", "HW9",
              "ATT", "QZ1", "QZ2", "QZ3", "QZ4", "EX1","EX2", "Test1",
              "Test2", "Lab", "Homework", "Quiz","Overall")
lines <- c("None", "Lm", "Loess")



# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Application title
  titlePanel("Grade Visualizer"),
  
  # Sidebar with different widgets depending on the selected tab
  sidebarLayout(
    sidebarPanel(
      conditionalPanel(condition = "input.tabselected==1",
                       h3("Grades Distribution"),
                       tableOutput("results")),
      conditionalPanel(condition = "input.tabselected==2",
                       selectInput(   "select",inputId = "var",
                                      label = h3("Select box"),
                                      choices = mylist),
    ),
    mainPanel(
      tabsetPanel(type = "tabs",
                  plotOutput("coolplot"),
                  tabPanel("Histogram", value = 2, 
                           ggvisOutput("histogram"),
                           tableOutput("sum_stats")),
                  id = "tabselected")
    )
  )
)


# Define server logic
server <- function(input, output) {
  
  output$coolplot <- renderPlot({
    ggplot(data=bcl, aes(x=overall_grade)) + 
      geom_bar(aes(y = (..count..))) + ylab("Frequency") })
  output$results <- renderTable({
    freq_table})                                                          
  
  vis_histogram <- reactive({
    var2 <- prop("x", as.symbol(input$var2))
    col <- input$var2
    df <- print_stats(summary_stats(data$col))
    
    data %>% 
      ggvis(x = var2) %>% 
      layer_histograms(stroke := 'black')
  })
  vis_histogram %>% bind_shiny("histogram")
  
  x <- input$var2

  output$sum_stats <- renderTable({
  
  
  
  
  
  

}












# Run the application 
shinyApp(ui = ui, server = server)

ᐧ