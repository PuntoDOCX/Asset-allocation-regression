library(dplyr)
library(lubridate)
library(ggplot2)
library(readr)
library(readxl)
factors <- read_csv("~/R/5_Factors.csv")
factors$Date <- as.Date(as.character(factors$Date), format = "%Y%m%d")
portfolio <- read_excel("~/Desktop/portfolio.xlsx")

start_date <- as.Date('2019-01-01')
end_date <- as.Date('2023-12-31')
factors <- factors[factors$Date >= start_date & factors$Date <= end_date, ]
portfolio <- portfolio[portfolio$Date >= start_date & portfolio$Date <= end_date, ]
data <- merge(portfolio, factors, by = "Date", all = FALSE)

Y <- data[, 2]
X <- data[, c(3,4,5,6,7)] #just bonds --> c(7,2,3,13)
X <- as.matrix(X)
Y <- unlist(Y)
Dmat <- t(X) %*% X #matrix appearing in the quadratic function to be minimized
dvec <- t(X) %*% Y #vector appearing in the quadratic function to be minimized
k <- ncol(X)
Aeq <- rep(1, k) #equality constraints
Aineq <- diag(k) #inequality constraints
Amat <- cbind(Aeq, Aineq) #constraint matrix
bvec <- c(100, rep(0, k)) #constraint vector
library(quadprog)
sol <- solve.QP(Dmat, dvec, Amat, bvec=bvec, meq = 1)