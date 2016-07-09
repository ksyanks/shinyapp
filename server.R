library(shiny)
library(ggplot2)
library(markdown)

data(mtcars)
dataset <- mtcars
av <- sum(dataset$mpg)/nrow(dataset)

shinyServer(function(input, output) {

   ds <- reactive({
     if (input$bTran)
       ds <- dataset
     else
       ds <- subset(dataset, dataset$am == as.numeric(input$dist))
   })
  
   output$plot <- renderPlot({
     #relabel the axis name
     if (input$x == 'mpg') {
       xLab <- 'Miles Per Gallon'
     } else if (input$x == 'cyl') {
          xLab <- 'Number of cylinders'
     } else if  (input$x == 'disp') {
          xLab <- 'Displacement (cu.in.)'
     } else if  (input$x == 'hp') {
          xLab <- 'Gross horsepower'
     } else if  (input$x == 'drat'){
          xLab <- 'Rear axle ratio'
     } else if  (input$x == 'wt') {
          xLab <-  'Weight (1000 lbs)'
     } else if  (input$x == 'qsec'){
          xLab <- '1/4 mile time'
     } else if  (input$x == 'vs'){
          xLab <- 'V/S'
     } else if  (input$x == 'am'){
          xLab<- 'Transmission (0 = automatic, 1 = manual)'
     } else if  (input$x == 'gear'){
          xLab <- 'Number of forward gears'
     } else if  (input$x == 'carb'){
          xLab <- 'Number of carburetors'
     }
     
     
     if (input$bTran){
       if (input$color != 'None') 
          ggplot(ds(),aes_string(x=input$x, y='mpg')) + geom_point() + 
          geom_point(size=as.numeric(input$csize),color=input$color) +
          labs( x= xLab, y = "Miles Per Gallon") +
          geom_hline(aes(yintercept = av), color = "green")+
          geom_text(aes(0, av, label='avg', vjust= -1))
       else
         ggplot(ds(),aes_string(x=input$x, y='mpg')) + geom_point() + 
         geom_point(size=as.numeric(input$csize),color='black') +
         labs( x= xLab, y = "Miles Per Gallon") +
         geom_hline(aes(yintercept = av), color = "green") +
         geom_text(aes(0, av, label='avg', vjust= -1))
     }
     
     else{
        if (input$color != 'None') 
           ggplot(ds(),aes_string(x=input$x, y='mpg')) + 
           geom_point(size=as.numeric(input$csize),color=input$color) + 
           labs( x= xLab, y = "Miles Per Gallon")
        else
           ggplot(ds(),aes_string(x=input$x, y='mpg')) + 
           geom_point(size=as.numeric(input$csize),color='black') + 
           labs( x= xLab, y = "Miles Per Gallon")
      }
     
   })
  
})
