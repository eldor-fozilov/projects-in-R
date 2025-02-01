install.packages("wooldridge")
install.packages("car")
library(car)
library(wooldridge)
data(vote1, package = "wooldridge")
data(wage2, package = "wooldridge")

#Problem 1

# (iii)
regression1 <- lm(voteA ~ log(expendA) + log(expendB) + prtystrA, data=vote1)
summary(regression1)

# (iv)
var <-vote1$expendB/vote1$expendA 

regression2 <- lm(voteA ~ log(expendA)+log(var)+prtystrA, data=vote1)
summary(regression2)


# Problem 2

# (iii)

regression3 <-lm(log(wage)~educ*exper, data=wage2)
summary(regression3)

# (iv)

regression4 <- lm(log(wage)~educ+exper+educ:I(exper-10),data = wage2)
summary(regression4)
# 95% CI
confint(regression4)


# Problem 3

#(i)
regression5 <- lm(log(wage)~educ+exper+tenure+married+black+south+urban, data=wage2)
summary(regression5)

#(ii)
exper2 <- wage2$exper^2
tenure2 <- wage2$tenure^2

regresion6 <- lm(log(wage)~educ+exper+tenure+married+black+south+urban+exper2+tenure2, data=wage2)
summary(regresion6)


HO <- c("exper2","tenure2")
linearHypothesis(regresion6, HO)


#(iii)
regression7 <- lm(log(wage)~exper+tenure+married+educ*black+south+urban, data=wage2)
summary(regression7)


#(iv)
marr_black <- c(wage2$married == 1 & wage2$black == 1)
single_black <- c(wage2$married == 0 & wage2$black == 1)
single_nonblack <- c(wage2$married == 0 & wage2$black == 0)

regression8 <- lm(log(wage)~exper+tenure+educ+marr_black+single_black+single_nonblack+south+urban, data=wage2)
summary(regression8)






