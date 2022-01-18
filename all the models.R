library(lavaan)
##############Population models######################
##CFA SMALL
##Model to fit
cfasmalltofit<-'
f1 =~ start(.6)*v1 + start(.7)*v2 + start(.5)*v3 + 0*v4
f2 =~ start(.7)*v4 + start(.8)*v5 + start(.7)*v6 

f1 ~~ start(.7)*f2

f1 ~~ 1*f1
f2 ~~ 1*f2

v1 ~~ start(.64)*v1
v2 ~~ start(.51)*v2
v3 ~~ start(.75)*v3
v4 ~~ start(.51)*v4
v5 ~~ start(.36)*v5
v6 ~~ start(.51)*v6'

##0%
Lambda <- matrix(c(0.6, 0,
                   0.7, 0,
                   0.5, 0,
                   0, 0.7,
                   0, 0.8,
                   0, 0.7), ncol=2, nrow=6, byrow=TRUE)
Phi <- matrix(c(1, 0.7, 
                0.7, 1), ncol=2, nrow=2)
Sigma <- Lambda %*% Phi %*% t(Lambda)
Psi <- 1-diag(Sigma)
diag(Sigma) <- 1
cfasmall0<-Sigma

##10%
Lambda <- matrix(c(0.6, 0,
                   0.7, 0,
                   0.5, 0,
                   0.114, 0.7,
                   0, 0.8,
                   0, 0.7), ncol=2, nrow=6, byrow=TRUE)
Phi <- matrix(c(1, 0.7, 
                0.7, 1), ncol=2, nrow=2)
Sigma <- Lambda %*% Phi %*% t(Lambda)
Psi <- 1-diag(Sigma)
diag(Sigma) <- 1
cfasmall10<-Sigma

##20%
Lambda <- matrix(c(0.6, 0,
                   0.7, 0,
                   0.5, 0,
                   0.172, 0.7,
                   0, 0.8,
                   0, 0.7), ncol=2, nrow=6, byrow=TRUE)
Phi <- matrix(c(1, 0.7, 
                0.7, 1), ncol=2, nrow=2)
Sigma <- Lambda %*% Phi %*% t(Lambda)
Psi <- 1-diag(Sigma)
diag(Sigma) <- 1
cfasmall20<-Sigma

##30%
Lambda <- matrix(c(0.6, 0,
                   0.7, 0,
                   0.5, 0,
                   0.204, 0.7,
                   0, 0.8,
                   0, 0.7), ncol=2, nrow=6, byrow=TRUE)
Phi <- matrix(c(1, 0.7, 
                0.7, 1), ncol=2, nrow=2)
Sigma <- Lambda %*% Phi %*% t(Lambda)
Psi <- 1-diag(Sigma)
diag(Sigma) <- 1
cfasmall30<-Sigma

##40%
Lambda <- matrix(c(0.6, 0,
                   0.7, 0,
                   0.5, 0,
                   0.229, 0.7,
                   0, 0.8,
                   0, 0.7), ncol=2, nrow=6, byrow=TRUE)
Phi <- matrix(c(1, 0.7, 
                0.7, 1), ncol=2, nrow=2)
Sigma <- Lambda %*% Phi %*% t(Lambda)
Psi <- 1-diag(Sigma)
diag(Sigma) <- 1
cfasmall40<-Sigma

##50%
Lambda <- matrix(c(0.6, 0,
                   0.7, 0,
                   0.5, 0,
                   0.249, 0.7,
                   0, 0.8,
                   0, 0.7), ncol=2, nrow=6, byrow=TRUE)
Phi <- matrix(c(1, 0.7, 
                0.7, 1), ncol=2, nrow=2)
Sigma <- Lambda %*% Phi %*% t(Lambda)
Psi <- 1-diag(Sigma)
diag(Sigma) <- 1
cfasmall50<-Sigma

##60%
Lambda <- matrix(c(0.6, 0,
                   0.7, 0,
                   0.5, 0,
                   0.268, 0.7,
                   0, 0.8,
                   0, 0.7), ncol=2, nrow=6, byrow=TRUE)
Phi <- matrix(c(1, 0.7, 
                0.7, 1), ncol=2, nrow=2)
Sigma <- Lambda %*% Phi %*% t(Lambda)
Psi <- 1-diag(Sigma)
diag(Sigma) <- 1
cfasmall60<-Sigma

##70%
#
Lambda <- matrix(c(0.6, 0,
                   0.7, 0,
                   0.5, 0,
                   0.287, 0.7,
                   0, 0.8,
                   0, 0.7), ncol=2, nrow=6, byrow=TRUE)
Phi <- matrix(c(1, 0.7, 
                0.7, 1), ncol=2, nrow=2)
Sigma <- Lambda %*% Phi %*% t(Lambda)
Psi <- 1-diag(Sigma)
diag(Sigma) <- 1
cfasmall70<-Sigma

##80%
Lambda <- matrix(c(0.6, 0,
                   0.7, 0,
                   0.5, 0,
                   0.306, 0.7,
                   0, 0.8,
                   0, 0.7), ncol=2, nrow=6, byrow=TRUE)
Phi <- matrix(c(1, 0.7, 
                0.7, 1), ncol=2, nrow=2)
Sigma <- Lambda %*% Phi %*% t(Lambda)
Psi <- 1-diag(Sigma)
diag(Sigma) <- 1
cfasmall80<-Sigma

##90%
Lambda <- matrix(c(0.6, 0,
                   0.7, 0,
                   0.5, 0,
                   0.331, 0.7,
                   0, 0.8,
                   0, 0.7), ncol=2, nrow=6, byrow=TRUE)
Phi <- matrix(c(1, 0.7, 
                0.7, 1), ncol=2, nrow=2)
Sigma <- Lambda %*% Phi %*% t(Lambda)
Psi <- 1-diag(Sigma)
diag(Sigma) <- 1
cfasmall90<-Sigma

##CFA LARGE
##Model to fit
cfalargetofit<-'
f1 =~ start(.7)*x1 + start(.7)*x2 + start(.8)*x3
f2 =~ start(.7)*x4 + start(.7)*x5 + start(.8)*x6
f3 =~ start(.7)*x7 + start(.7)*x8 + start(.75)*x9 + start(.8)*x10

f1 ~~ 1*f1
f2 ~~ 1*f2
f3 ~~ 1*f3

f1 ~~ start(0.5)*f2
f1 ~~ start(0.4)*f3
f2 ~~ start(0.3)*f3

x1 ~~ start(.51)*x1
x2 ~~ start(.51)*x2
x3 ~~ start(.36)*x3
x4 ~~ start(.51)*x4
x5 ~~ start(.51)*x5
x6 ~~ start(.36)*x6
x7 ~~ start(.51)*x7
x8 ~~ start(.51)*x8
x9 ~~ start(.4375)*x9
x10 ~~ start(.36)*x10
'

##0%
Lambda <- matrix(c(0.7,  0, 0,
                   0.7,  0, 0,
                   0.8, 0, 0,
                   0, 0.7, 0,
                   0, 0.7, 0,
                   0, 0.8, 0,
                   0, 0, 0.7,
                   0, 0, 0.7,
                   0, 0, 0.75,
                   0, 0, 0.8), ncol=3, nrow=10, byrow=TRUE)
Phi <- matrix(c(1, 0.5, 0.4, 
                0.5, 1, 0.3,
                0.4, 0.3, 1.), ncol=3, nrow=3)
Sigma <- Lambda %*% Phi %*% t(Lambda)
Psi <- 1-diag(Sigma)
diag(Sigma) <- 1
cfalarge0<-Sigma

##10%
Lambda <- matrix(c(0.7,  0, 0,
                   0.7,  0, 0,
                   0.8, 0, 0,
                   0.15, 0.7, 0,
                   0, 0.7, 0,
                   0, 0.8, 0,
                   0, 0, 0.7,
                   0, 0, 0.7,
                   0, 0, 0.75,
                   0, 0, 0.8), ncol=3, nrow=10, byrow=TRUE)
Phi <- matrix(c(1, 0.5, 0.4, 
                0.5, 1, 0.3,
                0.4, 0.3, 1.), ncol=3, nrow=3)
Sigma <- Lambda %*% Phi %*% t(Lambda)
Psi <- 1-diag(Sigma)
diag(Sigma) <- 1
cfalarge10<-Sigma

##20%
Lambda <- matrix(c(0.7,  0, 0,
                   0.7,  0, 0,
                   0.8, 0, 0,
                   0.218, 0.7, 0,
                   0, 0.7, 0,
                   0, 0.8, 0,
                   0, 0, 0.7,
                   0, 0, 0.7,
                   0, 0, 0.75,
                   0, 0, 0.8), ncol=3, nrow=10, byrow=TRUE)
Phi <- matrix(c(1, 0.5, 0.4, 
                0.5, 1, 0.3,
                0.4, 0.3, 1.), ncol=3, nrow=3)
Sigma <- Lambda %*% Phi %*% t(Lambda)
Psi <- 1-diag(Sigma)
diag(Sigma) <- 1
cfalarge20<-Sigma

##30%
Lambda <- matrix(c(0.7,  0, 0,
                   0.7,  0, 0,
                   0.8, 0, 0,
                   0.256, 0.7, 0,
                   0, 0.7, 0,
                   0, 0.8, 0,
                   0, 0, 0.7,
                   0, 0, 0.7,
                   0, 0, 0.75,
                   0, 0, 0.8), ncol=3, nrow=10, byrow=TRUE)
Phi <- matrix(c(1, 0.5, 0.4, 
                0.5, 1, 0.3,
                0.4, 0.3, 1.), ncol=3, nrow=3)
Sigma <- Lambda %*% Phi %*% t(Lambda)
Psi <- 1-diag(Sigma)
diag(Sigma) <- 1
cfalarge30<-Sigma

##40%
Lambda <- matrix(c(0.7,  0, 0,
                   0.7,  0, 0,
                   0.8, 0, 0,
                   0.283, 0.7, 0,
                   0, 0.7, 0,
                   0, 0.8, 0,
                   0, 0, 0.7,
                   0, 0, 0.7,
                   0, 0, 0.75,
                   0, 0, 0.8), ncol=3, nrow=10, byrow=TRUE)
Phi <- matrix(c(1, 0.5, 0.4, 
                0.5, 1, 0.3,
                0.4, 0.3, 1.), ncol=3, nrow=3)
Sigma <- Lambda %*% Phi %*% t(Lambda)
Psi <- 1-diag(Sigma)
diag(Sigma) <- 1
cfalarge40<-Sigma

##50%
Lambda <- matrix(c(0.7,  0, 0,
                   0.7,  0, 0,
                   0.8, 0, 0,
                   0.306, 0.7, 0,
                   0, 0.7, 0,
                   0, 0.8, 0,
                   0, 0, 0.7,
                   0, 0, 0.7,
                   0, 0, 0.75,
                   0, 0, 0.8), ncol=3, nrow=10, byrow=TRUE)
Phi <- matrix(c(1, 0.5, 0.4, 
                0.5, 1, 0.3,
                0.4, 0.3, 1.), ncol=3, nrow=3)
Sigma <- Lambda %*% Phi %*% t(Lambda)
Psi <- 1-diag(Sigma)
diag(Sigma) <- 1
cfalarge50<-Sigma

##60%
Lambda <- matrix(c(0.7,  0, 0,
                   0.7,  0, 0,
                   0.8, 0, 0,
                   0.326, 0.7, 0,
                   0, 0.7, 0,
                   0, 0.8, 0,
                   0, 0, 0.7,
                   0, 0, 0.7,
                   0, 0, 0.75,
                   0, 0, 0.8), ncol=3, nrow=10, byrow=TRUE)
Phi <- matrix(c(1, 0.5, 0.4, 
                0.5, 1, 0.3,
                0.4, 0.3, 1.), ncol=3, nrow=3)
Sigma <- Lambda %*% Phi %*% t(Lambda)
Psi <- 1-diag(Sigma)
diag(Sigma) <- 1
cfalarge60 <- Sigma

##70%
Lambda <- matrix(c(0.7,  0, 0,
                   0.7,  0, 0,
                   0.8, 0, 0,
                   0.347, 0.7, 0,
                   0, 0.7, 0,
                   0, 0.8, 0,
                   0, 0, 0.7,
                   0, 0, 0.7,
                   0, 0, 0.75,
                   0, 0, 0.8), ncol=3, nrow=10, byrow=TRUE)
Phi <- matrix(c(1, 0.5, 0.4, 
                0.5, 1, 0.3,
                0.4, 0.3, 1.), ncol=3, nrow=3)
Sigma <- Lambda %*% Phi %*% t(Lambda)
Psi <- 1-diag(Sigma)
diag(Sigma) <- 1
cfalarge70 <- Sigma

##80%
Lambda <- matrix(c(0.7,  0, 0,
                   0.7,  0, 0,
                   0.8, 0, 0,
                   0.368, 0.7, 0,
                   0, 0.7, 0,
                   0, 0.8, 0,
                   0, 0, 0.7,
                   0, 0, 0.7,
                   0, 0, 0.75,
                   0, 0, 0.8), ncol=3, nrow=10, byrow=TRUE)
Phi <- matrix(c(1, 0.5, 0.4, 
                0.5, 1, 0.3,
                0.4, 0.3, 1.), ncol=3, nrow=3)
Sigma <- Lambda %*% Phi %*% t(Lambda)
Psi <- 1-diag(Sigma)
diag(Sigma) <- 1
cfalarge80 <- Sigma

##90%
Lambda <- matrix(c(0.7,  0, 0,
                   0.7,  0, 0,
                   0.8, 0, 0,
                   0.394, 0.7, 0,
                   0, 0.7, 0,
                   0, 0.8, 0,
                   0, 0, 0.7,
                   0, 0, 0.7,
                   0, 0, 0.75,
                   0, 0, 0.8), ncol=3, nrow=10, byrow=TRUE)
Phi <- matrix(c(1, 0.5, 0.4, 
                0.5, 1, 0.3,
                0.4, 0.3, 1.), ncol=3, nrow=3)
Sigma <- Lambda %*% Phi %*% t(Lambda)
Psi <- 1-diag(Sigma)
diag(Sigma) <- 1
cfalarge90 <- Sigma

##Path Small
##Model to fit
pathsmalltofit<-'
x2 ~ 1 + start(0.6)*x1 + start(0.4)*x3
x4 ~ 1 + start(0.5)*x3

x6 ~ 1 + start(0.5)*x2 + start(0.4)*x4 + start(0.2)*x5

x1~~start(0.4)*x3
x1~~start(0.3)*x5
x3~~start(0.3)*x5

x1~~1*x1
x3~~1*x3
x5~~1*x5
'

##0%
modelh1<-'
x2 ~ 1 + 0.6*x1 + 0.4*x3
x4 ~ 1 + 0.5*x3

x6 ~ 1 + 0.5*x2 + 0.4*x4 + 0.2*x5

x1~~0.4*x3
x1~~0.3*x5
x3~~0.3*x5

x1~~1*x1
x3~~1*x3
x5~~1*x5
'
covpop<-fitted(sem(modelh1))$cov
pathsmall0<-cov2cor(covpop)

##10%
modelh1<-'
x2 ~ 1 + 0.6*x1 + 0.4*x3
x4 ~ 1 + 0.5*x3 + 0.122*x5

x6 ~ 1 + 0.5*x2 + 0.4*x4 + 0.2*x5

x1~~0.4*x3
x1~~0.2*x5
x3~~0.2*x5

x1~~1*x1
x3~~1*x3
x5~~1*x5
'

covpop<-fitted(sem(modelh1))$cov
pathsmall10<-cov2cor(covpop)

##20%
modelh1<-'
x2 ~ 1 + 0.6*x1 + 0.4*x3
x4 ~ 1 + 0.5*x3 + 0.195*x5

x6 ~ 1 + 0.5*x2 + 0.4*x4 + 0.2*x5

x1~~0.4*x3
x1~~0.2*x5
x3~~0.2*x5

x1~~1*x1
x3~~1*x3
x5~~1*x5
'

covpop<-fitted(sem(modelh1))$cov
pathsmall20<-cov2cor(covpop)

##30%
modelh1<-'
x2 ~ 1 + 0.6*x1 + 0.4*x3
x4 ~ 1 + 0.5*x3 + 0.241*x5

x6 ~ 1 + 0.5*x2 + 0.4*x4 + 0.2*x5

x1~~0.4*x3
x1~~0.2*x5
x3~~0.2*x5

x1~~1*x1
x3~~1*x3
x5~~1*x5
'
covpop<-fitted(sem(modelh1))$cov
pathsmall30<-cov2cor(covpop)

##40%
modelh1<-'
x2 ~ 1 + 0.6*x1 + 0.4*x3
x4 ~ 1 + 0.5*x3 + 0.278*x5

x6 ~ 1 + 0.5*x2 + 0.4*x4 + 0.2*x5

x1~~0.4*x3
x1~~0.2*x5
x3~~0.2*x5

x1~~1*x1
x3~~1*x3
x5~~1*x5
'
covpop<-fitted(sem(modelh1))$cov
pathsmall40<-cov2cor(covpop)

##50%
modelh1<-'
x2 ~ 1 + 0.6*x1 + 0.4*x3
x4 ~ 1 + 0.5*x3 + 0.312*x5

x6 ~ 1 + 0.5*x2 + 0.4*x4 + 0.2*x5

x1~~0.4*x3
x1~~0.2*x5
x3~~0.2*x5

x1~~1*x1
x3~~1*x3
x5~~1*x5
'
covpop<-fitted(sem(modelh1))$cov
pathsmall50<-cov2cor(covpop)

##60%
modelh1<-'
x2 ~ 1 + 0.6*x1 + 0.4*x3
x4 ~ 1 + 0.5*x3 + 0.345*x5

x6 ~ 1 + 0.5*x2 + 0.4*x4 + 0.2*x5

x1~~0.4*x3
x1~~0.2*x5
x3~~0.2*x5

x1~~1*x1
x3~~1*x3
x5~~1*x5
'
covpop<-fitted(sem(modelh1))$cov
pathsmall60<-cov2cor(covpop)

##70%
modelh1<-'
x2 ~ 1 + 0.6*x1 + 0.4*x3
x4 ~ 1 + 0.5*x3 + 0.381*x5

x6 ~ 1 + 0.5*x2 + 0.4*x4 + 0.2*x5

x1~~0.4*x3
x1~~0.2*x5
x3~~0.2*x5

x1~~1*x1
x3~~1*x3
x5~~1*x5
'
covpop<-fitted(sem(modelh1))$cov
pathsmall70<-cov2cor(covpop)

##80%
modelh1<-'
x2 ~ 1 + 0.6*x1 + 0.4*x3
x4 ~ 1 + 0.5*x3 + 0.423*x5

x6 ~ 1 + 0.5*x2 + 0.4*x4 + 0.2*x5

x1~~0.4*x3
x1~~0.2*x5
x3~~0.2*x5

x1~~1*x1
x3~~1*x3
x5~~1*x5
'
covpop<-fitted(sem(modelh1))$cov
pathsmall80<-cov2cor(covpop)

##90%
modelh1<-'
x2 ~ 1 + 0.6*x1 + 0.4*x3
x4 ~ 1 + 0.5*x3 + 0.481*x5

x6 ~ 1 + 0.5*x2 + 0.4*x4 + 0.2*x5

x1~~0.4*x3
x1~~0.2*x5
x3~~0.2*x5

x1~~1*x1
x3~~1*x3
x5~~1*x5
'
covpop<-fitted(sem(modelh1))$cov
pathsmall90<-cov2cor(covpop)

##Path Large
#model to fit
pathlargetofit<-'
x2 ~ 1 + start(0.6)*x1 + start(0.4)*x4
x3 ~ 1 + start(0.5)*x2 + start(0.5)*x5

x5 ~ 1 + start(0.5)*x4
x6 ~ 1 + start(0.4)*x5

x8 ~ 1 + start(0.6)*x7 + start(0.3)*x4
x9 ~ 1 + start(0.4)*x8 + start(0.4)*x5

x10 ~ 1 + start(0.3)*x3 + start(0.4)*x6 + start(0.4)*x9

x1~~start(0.5)*x4
x1~~start(0.5)*x7
x4~~start(0.6)*x7

x1~~1*x1
x4~~1*x4
x7~~1*x7'

#0%
modelh1<-'
x2 ~ 1 + 0.6*x1 + 0.4*x4
x3 ~ 1 + 0.5*x2 + 0.5*x5

x5 ~ 1 + 0.5*x4
x6 ~ 1 + 0.4*x5

x8 ~ 1 + 0.6*x7 + 0.3*x4
x9 ~ 1 + 0.4*x8 + 0.4*x5

x10 ~ 1 + 0.3*x3 + 0.4*x6 + 0.4*x9

x1~~0.5*x4
x1~~0.5*x7
x4~~0.6*x7

x1~~1*x1
x4~~1*x4
x7~~1*x7
'

covpop<-fitted(sem(modelh1))$cov
pathlarge0<-cov2cor(covpop)
#pathlarge0<-cor(covpop)

#10%
modelh1<-'
x2 ~ 1 + 0.6*x1 + 0.4*x4
x3 ~ 1 + 0.5*x2 + 0.5*x5

x5 ~ 1 + 0.5*x4
x6 ~ 1 + 0.4*x5

x8 ~ 1 + 0.6*x7 + 0.3*x4 + 0.203*x1
x9 ~ 1 + 0.4*x8 + 0.4*x5

x10 ~ 1 + 0.3*x3 + 0.4*x6 + 0.4*x9

x1~~0.5*x4
x1~~0.5*x7
x4~~0.6*x7

x1~~1*x1
x4~~1*x4
x7~~1*x7
'

covpop<-fitted(sem(modelh1))$cov
pathlarge10<-cov2cor(covpop)

#20%
modelh1<-'
x2 ~ 1 + 0.6*x1 + 0.4*x4
x3 ~ 1 + 0.5*x2 + 0.5*x5

x5 ~ 1 + 0.5*x4
x6 ~ 1 + 0.4*x5

x8 ~ 1 + 0.6*x7 + 0.3*x4 + 0.315*x1
x9 ~ 1 + 0.4*x8 + 0.4*x5

x10 ~ 1 + 0.3*x3 + 0.4*x6 + 0.4*x9

x1~~0.5*x4
x1~~0.5*x7
x4~~0.6*x7

x1~~1*x1
x4~~1*x4
x7~~1*x7
'
covpop<-fitted(sem(modelh1))$cov
pathlarge20<-cov2cor(covpop)

#30%
modelh1<-'
x2 ~ 1 + 0.6*x1 + 0.4*x4
x3 ~ 1 + 0.5*x2 + 0.5*x5

x5 ~ 1 + 0.5*x4
x6 ~ 1 + 0.4*x5

x8 ~ 1 + 0.6*x7 + 0.3*x4 + 0.384*x1
x9 ~ 1 + 0.4*x8 + 0.4*x5

x10 ~ 1 + 0.3*x3 + 0.4*x6 + 0.4*x9

x1~~0.5*x4
x1~~0.5*x7
x4~~0.6*x7

x1~~1*x1
x4~~1*x4
x7~~1*x7
'
covpop<-fitted(sem(modelh1))$cov
pathlarge30<-cov2cor(covpop)

#40%
modelh1<-'
x2 ~ 1 + 0.6*x1 + 0.4*x4
x3 ~ 1 + 0.5*x2 + 0.5*x5

x5 ~ 1 + 0.5*x4
x6 ~ 1 + 0.4*x5

x8 ~ 1 + 0.6*x7 + 0.3*x4 + 0.439*x1
x9 ~ 1 + 0.4*x8 + 0.4*x5

x10 ~ 1 + 0.3*x3 + 0.4*x6 + 0.4*x9

x1~~0.5*x4
x1~~0.5*x7
x4~~0.6*x7

x1~~1*x1
x4~~1*x4
x7~~1*x7
'
covpop<-fitted(sem(modelh1))$cov
pathlarge40<-cov2cor(covpop)

#50%
modelh1<-'
x2 ~ 1 + 0.6*x1 + 0.4*x4
x3 ~ 1 + 0.5*x2 + 0.5*x5

x5 ~ 1 + 0.5*x4
x6 ~ 1 + 0.4*x5

x8 ~ 1 + 0.6*x7 + 0.3*x4 + 0.489*x1
x9 ~ 1 + 0.4*x8 + 0.4*x5

x10 ~ 1 + 0.3*x3 + 0.4*x6 + 0.4*x9

x1~~0.5*x4
x1~~0.5*x7
x4~~0.6*x7

x1~~1*x1
x4~~1*x4
x7~~1*x7
'
covpop<-fitted(sem(modelh1))$cov
pathlarge50<-cov2cor(covpop)

#60%
modelh1<-'
x2 ~ 1 + 0.6*x1 + 0.4*x4
x3 ~ 1 + 0.5*x2 + 0.5*x5

x5 ~ 1 + 0.5*x4
x6 ~ 1 + 0.4*x5

x8 ~ 1 + 0.6*x7 + 0.3*x4 + 0.538*x1
x9 ~ 1 + 0.4*x8 + 0.4*x5

x10 ~ 1 + 0.3*x3 + 0.4*x6 + 0.4*x9

x1~~0.5*x4
x1~~0.5*x7
x4~~0.6*x7

x1~~1*x1
x4~~1*x4
x7~~1*x7
'
covpop<-fitted(sem(modelh1))$cov
pathlarge60<-cov2cor(covpop)


#70%
modelh1<-'
x2 ~ 1 + 0.6*x1 + 0.4*x4
x3 ~ 1 + 0.5*x2 + 0.5*x5

x5 ~ 1 + 0.5*x4
x6 ~ 1 + 0.4*x5

x8 ~ 1 + 0.6*x7 + 0.3*x4 + 0.589*x1
x9 ~ 1 + 0.4*x8 + 0.4*x5

x10 ~ 1 + 0.3*x3 + 0.4*x6 + 0.4*x9

x1~~0.5*x4
x1~~0.5*x7
x4~~0.6*x7

x1~~1*x1
x4~~1*x4
x7~~1*x7
'

covpop<-fitted(sem(modelh1))$cov
pathlarge70<-cov2cor(covpop)

#80%
modelh1<-'
x2 ~ 1 + 0.6*x1 + 0.4*x4
x3 ~ 1 + 0.5*x2 + 0.5*x5

x5 ~ 1 + 0.5*x4
x6 ~ 1 + 0.4*x5

x8 ~ 1 + 0.6*x7 + 0.3*x4 + 0.65*x1
x9 ~ 1 + 0.4*x8 + 0.4*x5

x10 ~ 1 + 0.3*x3 + 0.4*x6 + 0.4*x9

x1~~0.5*x4
x1~~0.5*x7
x4~~0.6*x7

x1~~1*x1
x4~~1*x4
x7~~1*x7
'

covpop<-fitted(sem(modelh1))$cov
pathlarge80<-cov2cor(covpop)

#90%
modelh1<-'
x2 ~ 1 + 0.6*x1 + 0.4*x4
x3 ~ 1 + 0.5*x2 + 0.5*x5

x5 ~ 1 + 0.5*x4
x6 ~ 1 + 0.4*x5

x8 ~ 1 + 0.6*x7 + 0.3*x4 + 0.734*x1
x9 ~ 1 + 0.4*x8 + 0.4*x5

x10 ~ 1 + 0.3*x3 + 0.4*x6 + 0.4*x9

x1~~0.5*x4
x1~~0.5*x7
x4~~0.6*x7

x1~~1*x1
x4~~1*x4
x7~~1*x7
'

covpop<-fitted(sem(modelh1))$cov
pathlarge90<-cov2cor(covpop)