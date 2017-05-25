
library(shiny)



shinyServer<-function(input, output) {
  
  abc<- read.table("ListOfFeesByUniversity.csv", header = TRUE, sep = ",")
  abc = abc[,apply(abc, 2, function(x){sum(!is.na(x))>0})]
  abc = abc[!apply(is.na(abc) | abc == "",1,all),]
  
  datasetInput = reactive({
    
    
    if(input$fees >= abc$Fees){
      abc = abc(abc$Fees < input$fees)
    }
      if (input$type == abc$Type){
        abc = abc(abc$Type == input$type)
      }   
        if (input$state == abc$Location){
          abc = abc(abc$Location == input$state)
        }   
          if (input$course == abc$Course){
            abc = abc(abc$Course == input$course)
          
          }
    head(abc, n=88)
      
  }
    )
  
  output$view = renderTable({
    
    
    head(abc,n=88)
  })
  

}
