# MKarp94 
# 1/25/15
# Coursera - Developing Data Products - Data Science Specialization
# ui.R

library(shiny)

# UI for Stanley Cup Winner Stats application
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("The Stanley Cup Difference"),
  
  # Sidebar with controls to select the variable to plot against seasons
  sidebarPanel(
    selectInput("variable", "Variable:",
                list("Goal Difference" = "Goal_Differential", 
                     "Shot Difference" = "Shot_Differential", 
                     "Points" = "P"))
  ),
  
  # Show the caption and plot of the requested variable against seasons
  mainPanel(
    h3(textOutput("caption")),
    
    plotOutput("hockeyPlot")
  )
))


