library(shiny)

shinyUI(fluidPage(
  titlePanel("Draw a Pretty Star"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       selectInput('type', 'Select Type of Star', 
                   choices=c("Pointed Star", "Inverse Star"), selected = 1),
       numericInput('n_lines', "Number of lines per side:", 
                    value = 20, min = 1, max = 100, step=1),
       selectInput('color', "Select Color", choices = colors(), selected="black"),
       checkboxGroupInput('sides', 'Which Sides to Draw:',
                          choices=c('Side 1','Side 2','Side 3','Side 4'), 
                          selected=c('Side 1','Side 2','Side 3','Side 4')),
       checkboxInput('rect', 'Draw a Box Around the Star?', value=F),
       numericInput('lineWidth', 'Line Width', value=1, min=0.25, max=3, step=0.25),
       selectInput('lineType', 'Line Type', choices=1:6, selected=1),
       submitButton("Draw!")
       
    ),
    
     mainPanel(
         tabsetPanel(
            tabPanel("Drawing",
                plotOutput("starPlot", width = "800px", height = "800px")
            ),
            tabPanel("Code",
                HTML("<p>Go to <a></a>")
            )
         )
    )
  )
))
