install.packages("wooldridge")
data(hprice1, package = "wooldridge")
regression <- lm(price ~ sqrft+bdrms, data=hprice1)
summary(regression)
price.hat <- fitted(regression)
u.hat <- resid(regression)
cbind(hprice1$sqrft,hprice1$bdrms, hprice1$price, price.hat, u.hat)[1:1,]
