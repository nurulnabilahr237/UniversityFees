
library(shiny)


shinyServer (function(input, output) {
 
  abc <- read.csv("ListOfFeesByUniversity.csv", header = TRUE, sep = ",")
  abc = abc[,apply(abc, 2, function(x){sum(!is.na(x))>0}),]
  abc = abc[!apply(is.na(abc) | abc == "",1,all),]
  
  
  
  output$table = renderTable({
    
    data <- abc
    
    if (input$type != "All"){
      data <- data[data$Type == input$type,]
    }
    
    if (input$state != "All"){
      data <- data[data$Location == input$state,]
    }
    
    if (input$course != "All"){
      data <- data[data$Course == input$course,]
    }
    
    
    #data <- data[data$Fees == input$fees[1]:input$fees[2],]
    #data <- data[data$Pointer %in% input$pointer[1]:input$pointer[2],]
    
    #input$goButton
    data
    
}
)

}
  
)

    # head(abc, n=88)
    
  
  
  #test <- eventReactive(input$goButton, {
  #  input$
  
  
  
 
  
  


