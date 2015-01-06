# MKarp94 
# 1/5/15
# Coursera - Regression - Data Science Specialization
# quiz1.R

# q1 - Give the value of μ that minimizes the least squares equation ∑ni=1wi(xi−μ)2
x <- c(0.18, -1.54, 0.42, 0.95)
w <- c(2, 1, 3, 1)
# values of mu (1.077, 0.1471, 0.0025, 0.300)
x_ls1 <- sum(w*(x-1.077))
# -6.509
x_ls2 <- sum(w*(x-.1471))
# 3e-04
x_ls3 <- sum(w*(x-0.0025))
# 1.0125
x_ls4 <- sum(w*(x-.95))


mean(x*w)
# 0.2575

# q2 - slope of regression line?
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)
# fit regression line through the origin
lin_reg <- lm(formula = y ~ 0 + x)
# 0.8263  

# q3 - slope of regression line using weight as predictor?
data(mtcars)
mtcars_reg <- lm(data = mtcars, mpg ~ wt)
# -5.344

# q4 - Consider data with an outcome (Y) and a predictor (X). 
# The standard deviation of the predictor is one half that of the outcome. 
# The correlation between the two variables is .5. What value would the slope 
# coefficient for the regression model with Y as the outcome and X as the predictor?
sd_x <- 1
sd_y <- 2
cor_xy <- .5
b <- cor_xy*(sd_y/sd_x)
# b = 1

# q5 Students were given two hard tests and scores were normalized to have empirical 
# mean 0 and variance 1. The correlation between the scores on the two tests was 0.4. 
# What would be the expected score on Quiz 2 for a student who had a normalized score of 1.5 on Quiz 1?
mu <- 0
var <- 1
cor_t1t2 <- .4
t1 <- 1.5
ev_t2 <- mu+var*cor_t1t2*t1
# .6

# q6 - normalize vector have mean = 0, sd = 1
x <- c(8.58, 10.46, 9.01, 9.64, 8.86)
# subtract mean divide by standard deviation
x_norm2 <- (x-mean(x))/sd(x)
# -0.9718658  1.5310215 -0.3993969  0.4393366 -0.5990954

# q7 - Consider the following data set (used above as well). 
# What is the intercept for fitting the model with x as the predictor and y as the outcome?
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)
lin_reg <- lm(y~x)
# intercept = 1.567


# q8 - You know that both the predictor and response have mean 0. What can be said about 
# the intercept when you fit a linear regression?
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)
x_norm3 <- (x-mean(x))/sd(x)
y_norm3 <- (y-mean(y))/sd(y)
lin_reg <- lm(y_norm3~x_norm3)


# q9 - what value minimizes the sum of squared distances between these values and themselves
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
mean(x)
# .573



# q10 - Let the slope having fit Y as the outcome and X as the predictor be denoted as β1. 
# Let the slope from fitting X as the outcome and Y as the predictor be denoted as γ1. 
# Suppose that you divide β1 by γ1; in other words consider β1/γ1. What is this ratio always equal to?
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)
lin_regy <- lm(y~x)
lin_regx <- lm(x~y)

# beta1 = coeffecicent of target y linear regression
beta1 <- -1.713  
# gamma1 = coeffecicent of target x linear regression
gamma1 <- -0.04462   
q10 <- beta1/gamma1
# 38.39086

q10answer <- var(y)/var(x)
# 38.39077


