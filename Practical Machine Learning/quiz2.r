# MKarp94 
# 1/1415
# Coursera - Practical Machine Learning - Data Science Specialization
# quiz2.R

# q1 - Load the Alzheimer's disease data using the commands:
library(AppliedPredictiveModeling)
library(caret)
data(AlzheimerDisease)
# Which of the following commands will create training and test sets with about 
# 50% of the observations assigned to each?

adData = data.frame(diagnosis,predictors)
trainIndex = createDataPartition(diagnosis,p=0.5,list=FALSE)
training = adData[trainIndex,]
testing = adData[trainIndex,]

# This one!
adData = data.frame(diagnosis,predictors)
trainIndex = createDataPartition(diagnosis, p = 0.50,list=FALSE)
training = adData[trainIndex,]
testing = adData[-trainIndex,]

adData = data.frame(predictors)
trainIndex = createDataPartition(diagnosis,p=0.5,list=FALSE)
training = adData[trainIndex,]
testing = adData[-trainIndex,]

adData = data.frame(diagnosis,predictors)
train = createDataPartition(diagnosis, p = 0.50,list=FALSE)
test = createDataPartition(diagnosis, p = 0.50,list=FALSE)


# q2 - Load the cement data using the commands:
data(concrete)
library(caret)
set.seed(975)
inTrain = createDataPartition(mixtures$CompressiveStrength, p = 3/4)[[1]]
training = mixtures[ inTrain,]
testing = mixtures[-inTrain,]
# Make a plot of the outcome (CompressiveStrength) versus the index of the samples. 
# Color by each of the variables in the data set (you may find the cut2() function 
# in the Hmisc package useful for turning continuous covariates into factors). What do you notice in these plots?
library(Hmisc)
library(ggplot2)
cutCement <- cut2(training$Cement, g = 4)
cutFlyAsh <- cut2(training$FlyAsh, g = 4)
cutAge <- cut2(training$Age, g = 4)
qplot(training$CompressiveStrength, 1:nrow(training), colour = training$Age)
qplot(training$CompressiveStrength, 1:nrow(training), colour = training$FlyAsh)
# there may be a variable missing, looks step like for all variable plots


# q3 - Make a histogram and confirm the SuperPlasticizer variable is skewed. Normally you might use the log 
# transform to try to make the data more symmetric. Why would that be a poor choice for this variable?
hist(mixtures$Superplasticizer)
hist(log(mixtures$Superplasticizer))
hist(sqrt(mixtures$Superplasticizer))
#There are values of zero so when you take the log() transform those values will be -Inf.

# q4 - Load the Alzheimer's disease data using the commands:
library(caret)
library(AppliedPredictiveModeling)
set.seed(3433)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]
# Find all the predictor variables in the training set that begin with IL. Perform principal components on these 
# variables with the preProcess() function from the caret package. Calculate the number of principal components 
# needed to capture 80% of the variance. How many are there?
str(training)
training_IL <- grep("IL{1}", names(training)) 
training_IL_nums <- training_IL[1:12] 
training_IL <- training[training_IL_nums, ]
pca_training_IL <- preProcess(x = training_IL, method = "pca", thresh = 0.80)
pca_training_IL
# 7 components needed to capture 80% of variance

#q5 - Load the Alzheimer's disease data using the commands:
library(caret)
library(AppliedPredictiveModeling)
set.seed(3433)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]

# Create a training data set consisting of only the predictors with variable names beginning with IL and the diagnosis.
# Build two predictive models, one using the predictors as they are and one using PCA with principal components 
# explaining 80% of the variance in the predictors. Use method="glm" in the train function. What is the accuracy of each 
# method in the test set? Which is more accurate?
training_IL_names <- grep("IL{1}", names(training)) 
training_IL <- training[training_IL_names[1:12]]
training_IL$diagnosis <- training$diagnosis

M <- abs(cor(training_IL[,-1]))
diag(M) <- 0
which(M > 0.8, arr.ind = T)

# alz_glm <- glm(diagnosis~., data = training_IL, family = binomial)
# summary(alz_glm)
# alz_pred1 = predict(alz_glm, type="response", newdata = testing)
# table(testing$diagnosis, alz_pred1 > 0.5)

modelFit <- train(diagnosis~., method = "glm", data = training_IL)
confusionMatrix(testing$diagnosis, predict(modelFit, testing))
# Accuracy =  53/82 = 0.6463415


training_IL2$diagnosis <- NULL
pca_training_IL <- preProcess(x = training_IL2, method = "pca", thresh = 0.80)
trainPC2 <- predict(pca_training_IL, training_IL2)
modelFit2 <- train(training$diagnosis~., method = "glm", data = trainPC2)

testing_IL_names <- grep("IL{1}", names(testing)) 
testing_IL <- testing[testing_IL_names[1:12]]
testPC2 <- predict(pca_training_IL, testing_IL)
confusionMatrix(testing$diagnosis, predict(modelFit2, testPC2))
# Accuracy = 59/82 = 0.7195   
