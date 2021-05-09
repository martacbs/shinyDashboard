library(shiny)

########################################################

shinyServer(function(input, output, session) {
    
    USER <- reactiveValues(Logged = FALSE , session = session$user) 
    
    source("/Users/martasantos/Tese_Git/shinyDashboard/dashBoard/Login.R",  local = TRUE)
    
}
)

