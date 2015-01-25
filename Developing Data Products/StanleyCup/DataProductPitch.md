Stanley Cup Difference
===
author: Michael Karp
date: January 25 2015
transition: rotate

<small> 
Statistics from NHL.com  - data visualizations
</small>


The Stanley Cup Difference
===
- This is an application that will allow users to visualize the following
    - and on a season by season basis
    - broken up in the following ways
    - all team averages, playoff team averages, and stanley cup winner stats
    - for Goal & Shot Differentials as well as regular season points


Problem Motivation
===
- In trying to find a better way to predict who will win the stanely cup this
was an exploratory graph I've created. What this displays is where the stanley 
cup winner for each of the last 10 years falls in relation to the rest of the
league as well as against those that made the playoffs


Predictors
===
Goal Differential
- I would imagine that this would be a great predictor in determining 
stanley cup winners however there hasn't yet been a single feature that 
has been able to distinguish itself
- This was created by subtracting goals allowed from goals scored

Shot Differential
- Here too I'd think this variable would give a nice summary of a teams offensive
and defensive capabilities
- This was created by subtracting shots allowed from shots

Predictors cont...
===
Points
- While points seems to be a good predictor as confoudning with this feature
is that if a team has a lot of points than they'll get into the playoffs which
gives them a better chance of winning the cup.
- As a follow up and for next steps I'd like to come up with some measure of 
'clutchness', something like how many times did the team win after trailing 
going into the 3rd as well as how many leads did the team give up and how many
of thos lead to ot/shootout losses
