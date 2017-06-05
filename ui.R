library(shiny)

abc <- read.csv("ListOfFeesByUniversity.csv", header = TRUE, sep = ",")
abc = abc[,apply(abc, 2, function(x){sum(!is.na(x))>0}),]
abc = abc[!apply(is.na(abc) | abc == "",1,all),]

shinyUI(fluidPage(
  titlePanel("University Finder"),
  
  sidebarLayout(
    sidebarPanel(
      
      selectInput("type",
                  "Type of University :",
                  c("All", 
                  unique(as.character(abc$Type)))),
                  
      selectInput("state", 
                  "State :",
                  c("All",
                  unique(as.character(abc$Location)))),

      selectInput("course",
                  "Course :",
                  c("All",
                  unique(as.character(abc$Course))))
      
      
      
      #actionButton("goButton", "Submit")
    
  
    
    ),
    mainPanel(
       tableOutput("table")
       )
    )
)
)





  
       

