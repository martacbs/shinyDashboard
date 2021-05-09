#### Log in module ###

PASSWORD <- data.frame(
  Brukernavn = c("admin"), 
  Passord = c("admin")
)

output$uiLogin <- renderUI({
  if (USER$Logged == FALSE) {
    wellPanel(
      textInput("userName", "UserName:"),
      passwordInput("passwd", "Password:"),
      br(),
      actionButton("Login", "Login")
    )
  }
})

output$pass <- renderText({  
  if (USER$Logged == FALSE) {
    USER$pass
  }  
})

# Login info during session ----
output$userPanel <- renderUI({
  if (USER$Logged == TRUE) {
    source("/Users/martasantos/Desktop/SystemLogin/InitialPage.R",  local = TRUE)
  }  
})


# control login
observeEvent(input$Login , {
  Username <- isolate(input$userName)
  Password <- isolate(input$passwd)
  Id.username <- which(PASSWORD$Brukernavn == Username)
  Id.password <- which(PASSWORD$Passord    == Password)
  if (length(Id.username) > 0 & length(Id.password) > 0) {
    if (Id.username == Id.password) {
      USER$Logged <- TRUE
      USER$name <- Username      
    } 
  } else {
    USER$pass <- "Username or password failed!"
  }
})

