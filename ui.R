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
                  unique(as.character(abc$Course)))),
      
       sliderInput("fees",
                  "Range of fees in Ringgit Malaysia (RM) :",
                   min = 1000,
                   max = 50000,
                   value = c(1000,5000),
                   width = 4000),
      
      sliderInput("pointer",
                  "CGPA :",
                  min = 2.0,
                  max = 4.0,
                  value = 0.5,
                  step = 0.1)
      
      #actionButton("goButton", "Submit")
    
  
    
    ),
    mainPanel(
       tableOutput("table")
       )
    )
)
)





  
       

