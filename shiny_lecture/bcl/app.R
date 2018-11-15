#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

a <- 5
print(a^2) # running the app will also load these variables
bcl <- read.csv("C:/Users/Kiko0/Desktop/git_docs/STAT545_Participation/shiny_lecture/bcl/bcl-data.csv", stringsAsFactors = FALSE)


# Define UI for application that draws a histogram
 ui <- fluidPage(
#   "This is some text",
#   "This is more text.", # these display on the same line
#   tags$h1("Level 1 header"),
#   h1(em("Level 1 header, part 2")), # can nest tags, can call tages without "tags"
#   HTML("<h1>Level 1 header, part 3</h1>"), # ui also takes html syntax
#   tags$ol(
#     tags$li("I like lists"),
#     tags$li("I like lists 2"),
#     tags$li("i am sleepy")
#   ),
#   a(href="https://google.ca", "Link to google")
#   (a) # calling a variable
   
# cannot put R code into ui unless it outputs html; R code goes into the serve function
  titlePanel("BC Liquor price app", 
   windowTitle = "BCL app"),
  sidebarLayout(
   sidebarPanel("This text is in the sidebar."),
   mainPanel(
     plotOutput("price_hist"),
     tableOutput("bcl_data")
   )
 )
# 
 )

# Define server logic required to draw a histogram
server <- function(input, output) {
  output$price_hist <- renderPlot(ggplot2::qplot(bcl$Price))
  output$bcl_data <- renderTable(bcl)
}

# Run the application 
shinyApp(ui = ui, server = server)

