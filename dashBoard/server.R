library(shiny)

########################################################

shinyServer(function(input, output, session) {
    
    USER <- reactiveValues(Logged = FALSE , session = session$user) 
    
    source("/Users/martasantos/Desktop/SystemLogin/Login.R",  local = TRUE)
    
}
)

