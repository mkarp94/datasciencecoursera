# MKarp94 
# 1/22/15
# Coursera - Statistical Inference - Data Science Specialization
# quiz3.R

# q1 - In a population of interest, a sample of 9 men yielded a sample average 
# brain volume of 1,100cc and a standard deviation of 30cc. What is a 95% 
# Student's T confidence interval for the mean brain volume in this new population?
n = 9
mu = 1100
s = 30
p = .975
# (X' - mu}/(s/sqrt(n))
conf95 <- mu + c(-1,1)*qt(p,n-1)*s/sqrt(n)
conf95
# 1076.94 1123.06

# q2 - A diet pill is given to 9 subjects over six weeks. The average difference in
# weight (follow up - baseline) is -2 pounds. What would the standard deviation of 
# the difference in weight have to be for the upper endpoint of the 95% T confidence 
# interval to touch 0?
n = 9
mu = -2
p = .975
s <- sqrt(n)*(0 - mu)/qt(p,n-1)
s
#  2.601903


# q3 - In an effort to improve running performance, 5 runners were either given a 
# protein supplement or placebo. Then, after a suitable washout period, they were 
# given the opposite treatment. Their mile times were recorded under both the 
# treatment and placebo, yielding 10 measurements with 2 per subject. The researchers 
# intend to use a T test and interval to investigate the treatment. Should they use a 
# paired or independent group T test and interval?
# mu_y - mu_x
# conf_int <- X' +/- t_(n-1)*s/sqrt(n)
# df for 2 group <- t_(.975,n_x+n_y-2)
# pooled variance numerator <- (n_x-1)(S_x)^2+(n_y-1)(S_y)^2
# total df <- (n_x-1)+(n_y-1)
# sp <- pooled variance/total_df
# standard error <- sp*sqrt(sum 1/n_{oc} + 1/n_{c})
# 132.86-127.44+c(-1,1)*qt(.975,ns)*sp*sqrt(1/8+1/21)
# a paired t test

# q4 - In a study of emergency room waiting times, investigators consider a new and the standard triage systems.
# To test the systems, administrators selected 20 nights and randomly assigned the new triage system to be used
# on 10 nights and the standard system on the remaining 10 nights. They calculated the nightly median waiting
# time (MWT) to see a physician. The average MWT for the new system was 3 hours with a variance of 0.60 while
# the average MWT for the old system was 5 hours with a variance of 0.68. Consider the 95% confidence interval
# estimate for the differences of the mean MWT associated with the new system. Assume a constant variance. What
# is the interval? Subtract in this order (New System - Old System).
new_mean <- 3
new_var <- .6
old_mean <- 5
old_var <- .68
sp <- (9)*+(9)(.68)^2
total_df <- 18
standard error <- sqrt(((.6)^2)/9)+((.68)^2)/9))
num <- (.6^2/10 + .68^2/10)^2
den <- .6^4/10^2/9 + .68^4/10^2/9
mydf <- num/den
# X'_{oc}-X'_{c} +/- t_df * SE
se <- sqrt(new_var*new_var/10+old_var*old_var/10)
conf95 <- new_mean-old_mean+c(-1,1)*qt(.975,mydf)*se
conf95
# -2.603163 -1.396837



# q5 - Suppose that you create a 95% T confidence interval. You then create a 90% interval using the same data.
# What can be said about the 90% interval with respect to the 95% interval?

# it would be narrower

# q6 - To further test the hospital triage system, administrators selected 200 nights and randomly assigned
# a new triage system to be used on 100 nights and a standard system on the remaining 100 nights. They 
# calculated the nightly median waiting time (MWT) to see a physician. The average MWT for the new system was
# 4 hours with a standard deviation of 0.5 hours while the average MWT for the old system was 6 hours with a
# standard deviation of 2 hours. Consider the hypothesis of a decrease in the mean MWT associated with the new
# treatment. What does the 95% independent group confidence interval with unequal variances suggest vis a vis
# this hypothesis? (Because there's so many observations per group, just use the Z quantile instead of the T.)

# the entire confidence interval is above 0 suggesting the new system is effective









