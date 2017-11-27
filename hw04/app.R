
# title: " Grade Visualizer"
# subtitle: "Stat 133, Fall 2017"
# author: "Olivier DAMAS"


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
                       selectInput(   "select",inputId = "variable",
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
    newtable})        
  
  
  
  server <- function(input, output) {
    
    data <- reactive({
      if
      "HW1" = data$HW1,
      "HW2" = data$HW2,
      "HW3" = data$HW3,
      "HW4" =data$HW4,
      "HW5"=data$HW5, 
      "HW6"=data$HW6,
      "HW7"=data$HW7,
      "HW8"=data$HW8,
      "HW9"=data$HW9,
      "ATT"=data$ATT, 
      "QZ1"=data$QZ1,
      "QZ2"=data$QZ2, 
      "QZ3"=data$QZ3, 
      "QZ4"=data$QZ4, "EX1"=data$EX1,"EX2"=data$EX2, "Test1"=data$Test1,
      "Test2"=data$Test2, "Lab"=data$Lab, "Homework"=data$homework, "Quiz"=data$quiz,"Overall"=data$Overall
      
      
      
    )
    })

output$plotOne <- renderPlot({
  input$var %>% ggvis(~as.numeric(input$var)) %>% layer_histograms()
})
  }
  
  
  
  #vis_barchart <- ggvis(data = input$choices , ~factor(overall_grade),) %>% #
    #add_axis("x", title = ) %>%                              
    #add_axis("y", title = "Frequency")                              
  #vis_barchart %>% bind_shiny("barchart")                           
  
                                                     
  })    
  vis_histogram <- reactive({
    variable <- prop("x", as.symbol(input$variable))
    col <- input$var2
    data <- print_stats(summary_stats(data))
    
    data %>% 
      ggvis(x = variable) %>% 
      layer_histograms(stroke := 'white')
  })
  vis_histogram %>% bind_shiny("histogram")
  
  x <- input$variable


  
  
  
  
  
  

}












# Run the application 
shinyApp(ui = ui, server = server)

ᐧ