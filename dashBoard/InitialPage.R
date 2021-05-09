
#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
#install.packages("flexdashboard")
library(flexdashboard) # Flexdashboard to create a frame for the content
library(dplyr)         # tidy data manipulation
library(leaflet)       # Leaflet for the interactive map
library(DT)            # DT for the interactive table
library(crosstalk)     # Crosstalk for widget interactivity
library(shiny)
library(shinydashboard)
library(leaflet)
library(shinyjs)
library(rintrojs)
library(shinyBS)
library(rmarkdown) # render, pandoc_available
library(markdown)
library(png)
library(changepoint)
library(strucchange)

#install.packages("knitr")
#install.packages("DT")
ui <- dashboardPage(title = "Anomalie Detection",
                    dashboardHeader(
                      dropdownMenu(type="notifications",
                                   messageItem(from = "Alert",
                                               message = "You have a x alerts")
                                   
                      ),
                      dropdownMenu(type="messages",
                                   messageItem(from = "Notification",
                                               message = "You have a x messages")),
                      dropdownMenu(type="tasks",
                                   messageItem(from = "Logout",
                                               message = "You have a x messages"))
                      
                    ),
                    dashboardSidebar(
                      sidebarMenu(
                        menuItem("Inicio", tabName = "dashboard", icon = icon("dashboard")),
                        menuItem("Hospital Data", icon = icon("th"), tabName = "dadosHospital",
                                 menuSubItem("Data", tabName = "dataHospital"), 
                                 menuSubItem("Sazonality", tabName = "sazonality"), 
                                 menuSubItem("Stl decomposition", tabName = "stl"),
                                 menuSubItem(" Strucchange Detetion", tabName = "strucchangeHosp"),
                                 menuSubItem(" BinSeg Detetion", tabName = "binSegHospital")),
                        
                        menuItem("Hotel Data", icon = icon("th"), tabName = "dadosHotel",
                                 menuSubItem("Data", tabName = "data"), 
                                 menuSubItem("Sazonality", tabName = "sazonality"), 
                                 menuSubItem("Methods", tabName = "methods"), 
                                 menuSubItem("Bongaigaon"))
                      )
                    ),
                    dashboardBody(
                      
                      tabItems(
                        tabItem(tabName = "dashboard",
                                fluidRow(
                                  infoBox("Alerts", 10 * 2, icon = icon("far fa-exclamation-triangle"), color="red"),
                                  infoBox("Strucchange", 4, icon = icon("fas fa-database")),
                                  infoBox("Pelt (mean)", 235, icon = icon("credit-card"))
                                  
                                ),
                                fluidRow(
                                  # A static infoBox
                                  infoBox("BinSeg (mean", 5, icon = icon("credit-card")),
                                  infoBox("Pelt (variance)", 2, icon = icon("fas fa-database")),
                                  infoBox("BinSeg (variance)", 2, icon = icon("credit-card"))
                                  
                                ),
                                fluidRow(
                                  # A static infoBox
                                  infoBox("Lepage statistic", 29, icon = icon("credit-card")),
                                  infoBox("Kolmogorov-Sminorv", 24, icon = icon("credit-card")),
                                  infoBox("Cramer-von-Mises", 26, icon = icon("fas fa-database"))
                                  
                                ),
                                fluidRow(
                                  # A static infoBox
                                  infoBox("Mann-Whitney", 26, icon = icon("credit-card")),
                                  infoBox("Mood", 16, icon = icon("credit-card")),
                                  valueBoxOutput("box_01"),textOutput("print"),
                                  # useShinyalert(),  # Set up shinyalert
                                  #  actionButton("btn", "Click me")
                                ) 
                        ),
                        
                        
                        tabItem(tabName = "dataHospital",
                                fluidRow(column(12, div(
                                  #TODO:  FIX COLUMNS TO DISPLAY 8        
                                  dataTableOutput("dataHospital"))))),
                        
                        tabItem(tabName = "sazonality",
                                fluidRow(column(8, div(
                                  #TODO:  FIX COLUMNS TO DISPLAY 8        
                                  plotOutput("plot1"))))),
                        
                        tabItem(tabName = "stl",
                                fluidRow(column(8, div(
                                  #TODO:  FIX COLUMNS TO DISPLAY 8        
                                  plotOutput("stlPlot")))))
                      )
                    )
)



