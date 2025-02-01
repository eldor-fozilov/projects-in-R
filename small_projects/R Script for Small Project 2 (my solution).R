install.packages("wooldridge")
data(attend, package = "wooldridge")

#Problem 1

# (i)
min(attend$atndrte);min(attend$priGPA);min(attend$ACT)
max(attend$atndrte);max(attend$priGPA);max(attend$ACT)
mean(attend$atndrte);mean(attend$priGPA);mean(attend$ACT)

# (ii)
regression1 <- lm(atndrte ~ priGPA + ACT, data=attend)
summary(regression1)

# (iv)
(atendrte_hat <- 75.7+17.261*3.65-1.717*20)

# (v)
A <- (75.7+17.261*3.1-1.717*21)
B <- (75.7+17.261*2.1-1.717*26)
(C <- A-B)

#Problem 2
data(meap93, package = "wooldridge")

#(i)
regression2 <- lm(math10 ~ log(expend) + lnchprg, data=meap93)
summary(regression2)

# (iii)
regression3 <- lm(math10 ~ log(expend), data=meap93)
summary(regression3)

# (iv)
cor(meap93$lexpend,meap93$lnchprg)