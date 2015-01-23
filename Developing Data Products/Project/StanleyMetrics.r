# mkarp94
# 2015 Stanley Cup Champion Predictions
# Using Regular Season Statistics to predict Stanley Cup Winner
# Model data - 2005-2006 -> 2013-2014
# Prediction data - 2014-2015
# maybe look into seasonal factors predicting playoff factors and then using seasonal factors 
# and playoff estimated predictors to predict stanley cup winner
# Data pulled from nhl.com


# Predictors - Team, League, Division, Year, GS, GA, W, L, T, OTL, Shootout loss
# PP %, PK %, Shots, steals, turnovers, Shots Allowed, Blocks, Hits
# Playoffs?(0/1)
# Target - StanleyCup?(0/1)


# Read in data
hockey = read.csv("hockey.csv")
str(hockey)

# Compute Goal Difference
hockey$GD.GP = hockey$G.GP - hockey$GA.GP
hockey$Goals = hockey$G.GP*82
hockey$GoalsAgainst = hockey$GA.GP*82
hockey$Shots = hockey$S.GP*82
hockey$Playoffs <- as.factor(hockey$Playoffs)
hockey$StanleyCup <- as.factor(hockey$StanleyCup)


current_season <- hockey[hockey$Season == "2014-2015",]
hockey_old <- hockey[hockey$Season != "2014-2015",]

# Logistic Regression Model to predict Stanley Cup Winner
Stanley_reg <- glm(StanleyCup~Goals+GoalsAgainst+Shots+Conference+Team+FO.+PP.+PK.+P+OT+Playoffs, data = hockey_old, family=binomial)

# Regression model to predict wins
WinsReg = lm(W ~ G.GP+GA.GP+PP.+PK.+S.GP+SA.GP+FO.+Team+Conference, data=hockey_old)
summary(WinsReg)

WinsReg2 = lm(W ~ Goals+GoalsAgainst, data=hockey_old)
summary(WinsReg2)
# VIDEO 3

# Regression model to predict goals scored
Goals_scored_reg = lm(GS ~ Shots + PP + Hits, data=hockey)
summary(RunsReg)

Goals_allowed_reg = lm(GA ~ Shots_allowed + PK + Hits + Blocks, data=hockey)
summary(RunsAllowed)




baseball_playoffs = which(baseball$Playoffs == 1)
summary(baseball_playoffs)

nrow(baseball_playoffs)

baseball_playoffs = subset(baseball, baseball$Playoffs == 1)
PlayoffTable = table(baseball_playoffs$Year)
baseball_playoffs$NumCompetitors = PlayoffTable[as.character(baseball_playoffs$Year)]
baseball_playoffs$WorldSeries = as.numeric(baseball_playoffs$RankPlayoffs == 1)
table(baseball_playoffs$WorldSeries)
BBallLog1 = glm(Top10 ~ ., data=SongsTrain, family=binomial)
bballLog2 = glm(WorldSeries ~ Year, data=baseball_playoffs, family=binomial)

bballLog0 = glm(WorldSeries ~ Year + RA + RankSeason + League, data=baseball_playoffs, family=binomial)

bballLog2 = glm(WorldSeries ~ Year, data=baseball_playoffs, family=binomial)
bballLog3 = glm(WorldSeries ~ RA, data=baseball_playoffs, family=binomial)
bballLog4 = glm(WorldSeries ~ RankSeason, data=baseball_playoffs, family=binomial)
bballLog5 = glm(WorldSeries ~ NumCompetitors, data=baseball_playoffs, family=binomial)
bballLog6 = glm(WorldSeries ~ Year + RA, data=baseball_playoffs, family=binomial)
bballLog7 = glm(WorldSeries ~ Year + RankSeason, data=baseball_playoffs, family=binomial)
bballLog8 = glm(WorldSeries ~ Year + NumCompetitors, data=baseball_playoffs, family=binomial)
bballLog9 = glm(WorldSeries ~ RA + RankSeason, data=baseball_playoffs, family=binomial)
bballLog10 = glm(WorldSeries ~ RA + NumCompetitors, data=baseball_playoffs, family=binomial)
bballLog11 = glm(WorldSeries ~ RankSeaso + NumCompetitors, data=baseball_playoffs, family=binomial)
bballLog11 = glm(WorldSeries ~ RankSeason + NumCompetitors, data=baseball_playoffs, family=binomial)



# also at some point will automate data scrubbing from the nhl tables



