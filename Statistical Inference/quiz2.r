# MKarp94 
# 1/6/15
# Coursera - Statistical Inference - Data Science Specialization
# quiz2.R

# q1 - What is the variance of the distribution of the average an 
# IID draw of n observations from a population with mean μ and variance σ2.

# σ^2/n

# q2 - Suppose that diastolic blood pressures (DBPs) for men aged 35-44 are 
# normally distributed with a mean of 80 (mm Hg) and a standard deviation of 10. 
# About what is the probability that a random 35-44 year old has a DBP less than 70?

probDBP70 <- pnorm(70, mean = 80, sd = 10)
probDBP70
# 0.1586553

# q3 - Brain volume for adult women is normally distributed with a mean of about 1,100 
# cc for women with a standard deviation of 75 cc. What brain volume represents the 95th percentile?
Quant95Brain <- qnorm(.95, mean = 1100, sd = 75)
Quant95Brain
# 1123.364

# q4 - Refer to the previous question. Brain volume for adult women is about 1,100 cc for women with 
# a standard deviation of 75 cc. Consider the sample mean of 100 random adult women from this population. 
# What is the 95th percentile of the distribution of that sample mean?
sd1 <- 75
n <- 100
mu <- 1100
mean_sd <- ((sd1^2)/n)^.5
Quant95BrainMu <- qnorm(.95, mean = mu, sd = mean_sd)
Quant95BrainMu
# 1112.336

# q5 - You flip a fair coin 5 times, about what's the probability of getting 4 or 5 heads?
# same as asking for the probability of 1 or less tails since any given trial is .5 prob
morethan4heads <- pbinom(1, size = 5, prob = .5)
morethan4heads
# 0.1875

# q6 - The respiratory disturbance index (RDI), a measure of sleep disturbance, for a specific 
# population has a mean of 15 (sleep events per hour) and a standard deviation of 10. They are 
# not normally distributed. Give your best estimate of the probability that a sample mean RDI 
# of 100 people is between 14 and 16 events per hour?
sd1 <- 10
n <- 100
mu <- 15
mean_sd <- ((sd1^2)/n)^.5
RDI_mean <- pnorm(16, mean = mu, sd = mean_sd) - pnorm(14, mean = mu, sd = mean_sd)
RDI_mean
# 0.6826895

# q7 - Consider a standard uniform density. The mean for this density is .5 and the variance is 1 / 12. 
# You sample 1,000 observations from this distribution and take the sample mean, what value would you 
# expect it to be near?

# the ev of the mean would be .5



# q8 - The number of people showing up at a bus stop is assumed to be Poisson with a mean of 5 people per
# hour. You watch the bus stop for 3 hours. About what's the probability of viewing 10 or fewer people?
bus_mean <- ppois(10,lambda = 5*3)
bus_mean
# 0.1184644
