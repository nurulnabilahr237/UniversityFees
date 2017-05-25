


library(shiny)


shinyUI(fluidPage(
  titlePanel("University Fees"),
  sidebarLayout(
    sidebarPanel(
      
       sliderInput("fees",
                  h3 ("Range of fees in Ringgit Malaysia (RM) :"),
                   min = 1000,
                   max = 50000,
                   value = 1000),
       radioButtons("type",
                    h3("Type of University : "),
                    list ("Public","Private"),
                    " "),
       selectInput("state", 
                   h3 ("State :"),
                   #"Select a state ",
                   c("Johor", "Melaka","Kuala Lumpur", "Selangor", "Neger Sembilan", "Pahang", "Penang", "Perak", "Kedah", "Perlis", "Kelantan", "Terengganu", "Sabah", "Sarawak")),
       
      # selectizeInput("pointer",
       #               h3("Pointer"),
        #              c("4.00 - 3.50","3.49 - 3.00","2.99 - 2.50","2.49 - 2.00"),
         #             " "),
       selectInput("course", 
                  h3 ("Course :"),
                  #"Select a state ",
                  c("Medic", "Law", "Engineering","Computer Science","Education"),
                  " "),
       submitButton(text  = "Submit")
      
    
    ),
    
   

    
   
    mainPanel(
       h3("University"),
       tableOutput("view"))
       )
    )
  )
       

