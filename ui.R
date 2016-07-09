
data(mtcars)

dataset <- mtcars
cName <- names(dataset)
cName <- cName[-c(1,9)]

shinyUI(fluidPage(
        
        headerPanel("Automobile Exploratory Data Analysis"),
       
        sidebarPanel(
                checkboxInput('bTran', 'Both Auto and Manual Transmission (Checking this, Distribution Type will be ignored)', value = FALSE),
                br(),
                selectInput('x', 'Variable', cName),
                selectInput('color', 'Color', c('None', 'red', 'blue')),
                br(),
                radioButtons("dist", "Distribution type:",
                             c("Automatic" = "0",
                               "Manual" = "1"
                               )),
                br(),
                numericInput('csize', label = ("Plot size (number)"), value = 1)
               
        ),
        
        mainPanel(
                tabsetPanel(
                        tabPanel("Plot", plotOutput('plot')),
                        tabPanel("README", includeMarkdown("README.md"))
               )
        )
        
))
