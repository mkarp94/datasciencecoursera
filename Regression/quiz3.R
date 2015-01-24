# MKarp94 
# 1/5/15
# Coursera - Regression - Data Science Specialization
# quiz3.R

# q1 - Consider the mtcars data set. Fit a model with mpg as the outcome that includes number of cylinders 
# as a factor variable and weight as confounder. Give the adjusted estimate for the expected change in mpg 
# comparing 8 cylinders to 4
str(mtcars)
mtcars$cyl_factor <- as.factor(mtcars$cyl)
lm_fit <- lm(data = mtcars, mpg~cyl_factor+wt)
summary(lm_fit)

# -6.071

# q2 - Consider the mtcars data set. Fit a model with mpg as the outcome that includes number of cylinders 
# as a factor variable and weight as a possible confounding variable. Compare the effect of 8 versus 4 cylinders 
# on mpg for the adjusted and unadjusted by weight models. Here, adjusted means including the weight variable as 
# a term in the regression model and unadjusted means the model without weight included. What can be said about 
# the effect comparing 8 and 4 cylinders after looking at models with and without weight included?.
summary(lm_fit)
lm_fit2 <- lm(data = mtcars, mpg~cyl_factor)
summary(lm_fit2)
# Holding weight constant, cylinder appears to have less of an impact on mpg than if weight is disregarded.

# q3 - Consider the mtcars data set. Fit a model with mpg as the outcome that considers number of cylinders as 
# a factor variable and weight as confounder. Now fit a second model with mpg as the outcome model that considers 
# the interaction between number of cylinders (as a factor variable) and weight. Give the P-value for the likelihood 
# ratio test comparing the two models and suggest a model using 0.05 as a type I error rate significance benchmark.
library(lmtest)
lrtest(lm_fit, lm_fit2)
# 6.533e-05 ***
# The P-value is larger than 0.05. So, according to our criterion, we would fail to reject, which suggests that the
# interaction terms may not be necessary.

# q4 - Consider the mtcars data set. Fit a model with mpg as the outcome that includes number of cylinders as a factor
# variable and weight inlcuded in the model as
q4_fit <- lm(mpg ~ I(wt * 0.5) + factor(cyl), data = mtcars)
# How is the wt coefficient interpretted?
summary(q4_fit)
# The estimated expected change in MPG per half ton increase in weight for the average number of cylinders.

# q5 - Consider the following data set
x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
y <- c(0.549, -0.026, -0.127, -0.751, 1.344)
# Give the hat diagonal for the most influential point
fit <- lm(y~x)
hatvalues(fit)
# 0.9946


# q6 - Consider the same data set, Give the slope dfbeta for the point with the highest hat value.
dfbetas(fit)
# -134

# q7 - Consider a regression relationship between Y and X with and without adjustment for a third 
# variable Z. Which of the following is true about comparing the regression coefficient between 
# Y and X with and without adjustment for Z.

# It is possible for the coefficient to reverse sign after adjustment. For example, it can be strongly
# significant and positive before adjustment and strongly significant and negative after adjustment.
