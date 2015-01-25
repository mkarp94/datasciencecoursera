# MKarp94 
# 1/25/15
# Coursera - Developing Data Products - Data Science Specialization
# server.R


library(shiny)
# Read in data
hockey = read.csv("hockey.csv")
str(hockey)
# Compute Goal Difference
hockey$Goal_Differential = (hockey$G.GP - hockey$GA.GP)*82
# Compute Shot Difference
hockey$Shot_Differential = (hockey$S.GP-hockey$SA.GP) *82


# Allow user to determine which stat to graph as the difference between the
# stanley cup winner vs playoff teams vs all teams
# stats allowed for us use: Points, Goal_differential, shot_differential
shinyServer(function(input, output) {
  # Compute the forumla text in a reactive function since it is 
  # shared by the output$caption and output$mpgPlot functions
  formulaText <- reactive(function() {
    paste(input$variable)
  })
  
  # Return the formula text for printing as a caption
  output$caption <- renderText(function() {
    formulaText()
  })
  
  output$hockeyPlot <- renderPlot(function() {    

    # regular season averages
    seasons <- names(tapply(hockey[[input$variable]], hockey$Season, mean))
    season_avg <- as.vector(tapply(hockey[[input$variable]], hockey$Season, mean))
    # playoff averages
    playoff_avg <- as.vector(tapply(hockey[hockey$Playoffs == 1,][[input$variable]], hockey[hockey$Playoffs == 1,]$Season, mean))
    # stanley cup winner
    winners <- as.vector(tapply(hockey[hockey$StanleyCup == 1,][[input$variable]], hockey[hockey$StanleyCup == 1,]$Season, mean))
    averages_df <- as.data.frame(seasons)
    averages_df$season_avg <- season_avg
    averages_df$playoff_avg <- playoff_avg
    averages_df$winners <- winners  
    hockey_winners <- subset(hockey, hockey$StanleyCup == 1)
    SC_winners <- as.character(hockey_winners$Team); SC_winners[10] <- "Unknown"
    averages_df$SC_winners <- SC_winners
    str(averages_df)
    
    ylabel <- input$variable
    if(input$variable == "P") 
      ylabel <- "Points"
    else if (input$variable == "FO.") 
      ylabel <- "Face Off %"
    else if (input$variable == "PP.") 
      ylabel <- "Power Play %"
    else if (input$variable == "PK.") 
      ylabel <- "Penalty Kill %"
    else 
      ylabel <- input$variable
    
    library(ggplot2)

    plot <-  ggplot(data = averages_df, aes(x=seasons)) + xlab("Season") + ylab(ylabel) + 
      geom_point(aes(y=season_avg, shape="season_avg")) +
      geom_point(aes(y=playoff_avg, shape="playoff_avg")) + 
      geom_point(aes(y=winners, shape="winners", color =SC_winners))  
    print(plot)
  })
  
})
