install.packages("SmartEDA")
install.packages("car")
library(SmartEDA)
library(car)

# We will do the summary of binary/categorical variables
ExpCustomStat(meps_senior, Cvar=c("male","race_grp","marital","msa",
                                  "high_bp", "high_chol", "phy_lim",
                                  "diabetes", "chd", "srhealth",
                                  "mntl_hlth"),gpby=FALSE )

# We will do the summary of quantitative variables
summary(meps_senior)

#We will categorize study participants based on their BMI results

num <- 2970 # total number of observations in the sample  

underweight <- c(meps_senior$bmi < 18.5)
normal_weight <- c(meps_senior$bmi >= 18.5 & meps_senior$bmi < 25)
overweight <- c(meps_senior$bmi >= 25 & meps_senior$bmi < 30)
obese <- c(meps_senior$bmi >= 30)


# We will calculate the proportions

sum(underweight)/num # proportion of underwieght people in the sample
sum(normal_weight)/num # proportion of people who have normal weight in the sample
sum(overweight)/num # proportion of overwiehgt people in the sample
sum(obese)/num # proportion of obese people in the sample


# Average and median statistics based on BMI resutls

ExpCustomStat(meps_senior, Nvar=c("dr_visits","hosp_vis","totalexp"), stat = c('mean','median'),
              filt= 'bmi < 18.5' )
ExpCustomStat(meps_senior, Nvar=c("dr_visits","hosp_vis","totalexp"), stat = c('mean','median'),
              filt= 'bmi >= 18.5 & bmi < 25' )
ExpCustomStat(meps_senior, Nvar=c("dr_visits","hosp_vis","totalexp"), stat = c('mean','median'),
              filt= 'bmi >= 25 & bmi < 30' )
ExpCustomStat(meps_senior, Nvar=c("dr_visits","hosp_vis","totalexp"), stat = c('mean','median'),
              filt= 'bmi >= 30' )


#Check for relationship between totalexp, dr_visits and hosp_vis

check <- lm(totalexp ~ dr_visits + hosp_vis, data = meps_senior)
summary(check)

# Model

regression1 <- lm(log(totalexp) ~ obese + underweight + overweight, data = meps_senior)
summary(regression1)

regression2 <- lm(log(totalexp) ~ obese + underweight + overweight + log(income) + male, data = meps_senior)
summary(regression2)

regression3 <- lm(log(totalexp) ~ obese + underweight + overweight + chd, data = meps_senior)
summary(regression3)

regression4 <- lm(log(totalexp) ~ obese + underweight + overweight + diabetes, data = meps_senior)
summary(regression4)

regression5 <- lm(log(totalexp) ~ obese + underweight + overweight + chd + diabetes, data = meps_senior)
summary(regression5)

regression6 <- lm(log(totalexp) ~ obese + underweight + overweight + chd + diabetes
                                        + phy_lim, data = meps_senior)
summary(regression6)

regression7 <- lm(log(totalexp) ~ obese + underweight + overweight + chd + diabetes
                                  + phy_lim + high_bp + high_chol, data = meps_senior)
summary(regression7)


regression8 <- lm(log(totalexp) ~ obese + underweight + overweight ++ chd + diabetes
                  + phy_lim + high_bp + high_chol + log(income) + male ,
                               data = meps_senior)
summary(regression8)

vif(regression8)
