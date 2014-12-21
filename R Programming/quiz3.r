# MKarp94
# Coursera - R Programming - Data Science Specialization
# Quiz 3

library(datasets)
data(iris)

# q1 - avg of sepal.length for species virginica
tapply(iris$Sepal.Length, iris$Species, mean)

#q2 - return colmeans of numeric vars in iris dataset
apply(iris[, 1:4], 2, mean)

data(mtcars)
# q3 - mean mpg by num cyl
with(mtcars, tapply(mpg, cyl, mean))

#q4 - difference in avg hp between 4 cyl cars and 8 cyl cars
mean(mtcars$hp[mtcars$cyl == 8]) - mean(mtcars$hp[mtcars$cyl == 4])