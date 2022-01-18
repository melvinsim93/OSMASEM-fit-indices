packs<-c("devtools","OpenMx","lavaan","stringi","pdqr")

devtools::install_github("mikewlcheung/metasem")

library(lavaan)
library(metaSEM)
library(stringi)
library(stringr)
library(plyr)
library(pdqr)
library(parallel)

mxOption(key='Number of Threads', value=parallel::detectCores()-2)

##Distribution of Ns from a brief survey of studies that have used meta-analytic SEM
dist<-c(1000,997,974,969,968,968,965,959,952,949,937,932,927,927,925,900,900,885,885,866,862,862,848,844,839,831,831,830,827,825,823,818,816,812,802,788,782,782,782,781,776,774,772,770,767,765,764,762,760,755,755,749,740,733,730,726,723,723,717,710,710,709,707,707,707,706,706,696,696,680,679,667,661,657,656,655,653,643,641,629,627,627,
        623,621,616,614,614,612,612,603,602,600,598,588,586,584,583,581,571,569,569,567,566,564,561,551,550,547,545,543,541,541,537,532,530,529,526,524,523,523,521,521,520,520,519,519,517,517,515,514,510,506,503,503,500,498,495,494,491,490,490,489,487,487,487,485,484,480,479,479,476,473,469,469,468,468,467,466,464,464,461,461,461,460,
        459,458,455,454,454,447,447,445,442,440,439,436,436,432,431,430,430,429,428,427,427,424,424,423,422,418,416,416,414,414,414,411,409,406,405,404,403,400,400,400,396,396,396,395,390,389,389,387,385,385,384,383,383,381,380,373,370,370,368,366,366,362,360,360,359,356,355,354,352,351,351,351,349,349,347,347,346,345,344,343,343,342,
        340,339,338,336,335,335,334,334,334,333,333,333,332,330,330,330,328,327,326,326,323,321,320,319,318,317,317,316,316,316,314,314,313,312,312,311,311,310,310,310,310,309,307,306,304,304,303,302,302,302,302,301,301,301,300,300,300,300,299,299,298,297,297,295,295,293,293,292,290,289,286,286,285,285,285,283,282,282,281,281,280,280,
        280,279,279,277,277,277,277,276,276,275,274,272,272,271,271,269,269,269,269,268,266,266,266,265,265,263,263,262,261,261,260,260,259,259,258,257,257,256,255,255,255,255,255,254,254,252,252,252,252,251,251,250,249,249,249,248,248,247,247,246,246,245,244,244,244,243,242,242,242,241,241,240,240,240,239,239,239,239,238,238,237,236,
        236,236,235,235,234,234,234,234,233,233,233,233,231,230,230,229,229,229,229,229,229,227,227,227,226,226,226,225,225,225,224,223,223,223,223,222,222,222,222,221,221,221,221,220,220,220,219,219,218,218,217,216,215,215,215,215,214,213,213,213,213,213,212,212,211,211,211,209,209,208,208,208,207,207,207,207,206,206,206,206,206,206,206,
        205,205,205,205,205,205,204,204,204,203,203,203,202,202,202,202,201,201,201,201,200,200,200,200,200,200,200,200,200,200,200,199,199,199,198,198,198,197,197,196,195,194,194,194,193,193,193,193,192,192,191,190,189,188,187,185,185,185,185,184,184,184,183,183,183,182,182,182,181,180,180,180,180,179,179,179,179,179,177,176,176,175,175,
        174,174,174,173,173,173,173,173,171,169,169,169,169,169,168,167,164,163,163,163,163,162,161,161,160,160,160,159,159,159,159,158,158,158,157,157,157,157,157,156,155,154,154,154,153,152,152,151,150,150,150,150,150,149,149,149,149,149,149,149,148,148,148,147,146,146,146,146,146,145,145,145,145,145,145,145,145,144,144,144,144,143,143,
        143,142,141,141,141,140,140,139,139,139,138,138,137,136,136,136,136,136,135,135,134,133,133,133,132,132,132,131,131,131,131,131,131,130,130,130,129,129,129,129,129,128,127,127,127,127,126,126,126,125,125,125,125,124,124,123,123,123,123,122,122,122,122,122,122,120,120,120,120,119,119,119,119,118,118,118,118,117,117,117,116,116,116,
        115,115,115,114,114,114,114,113,113,112,112,111,111,111,110,110,110,109,109,109,109,109,109,109,108,108,108,108,108,107,107,107,106,106,106,106,105,105,105,104,104,104,104,104,104,104,104,103,103,103,102,102,102,102,101,101,101,101,101,100,100,100,100,100,100,99,99,99,99,98,98,98,98,98,98,97,97,97,96,95,94,94,93,93,93,92,92,92,92,
        92,92,92,92,92,91,91,91,91,90,90,90,88,87,87,87,87,86,86,86,86,86,86,85,84,84,84,84,83,83,82,82,82,81,81,81,80,80,80,80,80,80,80,79,79,79,79,79,79,79,78,78,78,77,77,76,76,76,76,76,75,75,74,74,74,73,73,73,72,72,71,70,70,70,70,70,69,69,69,69,68,68,66,66,66,66,65,65,65,65,64,64,64,64,64,64,63,63,62,62,62,62,62,62,61,61,61,60,60,60,
        59,59,59,58,58,58,58,58,57,57,56,56,56,56,56,55,55,54,54,54,54,53,53,52,52,51,51,50,50,50,49,48,48,48,48,48,47,47,47,46,46,46,46,46,45,44,44,44,44,44,43,43,43,42,42,42,42,41,41,41,40,40,40,40,40,40,40,40,40,40,39,38,38,37,37,36,36,35,34,34,34,34,33,32,32,32,32,31,31,31,29,29,28,26,25,21,21,20,20,19,18,17,15,13)
##Creates a function r_n that randomly samples from the distribution given an N, from pqdr package
r_n<-new_r(dist, type = "continuous", cut = 0)

##Simulate function
simulate.it<-function(model.type, model.size, k, model.misspecification,
                      missingstud, missingvar, hetero, simulate.no, cond.no) {
  
  #Get the population correlation matrix and its corresponding misspecification level
  Sigma <- get(paste0(model.type,model.size,model.misspecification))
  print(paste("I got the",paste0(model.type,model.size,model.misspecification), "model"))
  
  #Produce the sigma_v matrix
  Sigma_V <- sigmavmat(sigma = Sigma, v = hetero)
  print("I produced the sigma v matrix")
  
  # Model for fitting
  model<- get(paste0(model.type,model.size,"tofit"))
  #Turn the model into RAM notation, because it is needed later
  RAM <- lavaan2RAM(model, A.notation = "on", S.notation = "with")
  
  ## Get Variable names depending on model type
  if(model.type == "path"){
    varnimsov<-lavNames(model, type = "ov")
    ##Sorts the variables according to their numeral, so V1, then V2, V3 etc
    varnimsov<-stri_sort(varnimsov, numeric = T)
    ## Calculate the number of observed variables
    numbofobsvar<-length(varnimsov)
    
    #Reorder the Sigma matrix so that V1 will be the first in the row and column, then V2, then V3, etc
    Sigma<-Sigma[varnimsov,varnimsov]
    
    #Reorder the RAM notations in ascending order so that V1 will be the first in the row and column, then V2, then V3, etc
    RAM$A<-RAM$A[varnimsov,varnimsov]
    RAM$S<-RAM$S[varnimsov,varnimsov]
    RAM$F<-RAM$F[varnimsov,varnimsov]
    RAM$M<-RAM$M[,varnimsov]
    
  } else if(model.type == "cfa"){
    varnimsov<-lavNames(model, type = "ov")
    varnimslv<-lavNames(model, type = "lv")
    
    ##Sorts the variables according to their numeral, so V1, then V2, V3 etc
    varnimsov<-stri_sort(varnimsov, numeric = T)
    varnimslv<-stri_sort(varnimslv, numeric = T)
    varnims<-c(varnimsov, varnimslv)
    
    ##Calculate the number of observed variables
    numbofobsvar<-length(varnimsov)
    numboflatvar<-length(varnimslv)
    
    #Reorder the Sigma matrix so that V1 will be the first in the row and column, then V2, then V3, etc
    Sigma<-rename.matrix(Sigma, varnimsov, varnimsov)
    Sigma<-Sigma[varnimsov,varnimsov]
    
    #Reorder the RAM notations in ascending order so that V1 will be the first in the row and column, then V2, then V3, etc
    RAM$A<-RAM$A[varnims,varnims]
    RAM$S<-RAM$S[varnims,varnims]
    RAM$F<-RAM$F[varnimsov,varnims]
    RAM$M<-RAM$M[,varnims]
    
  }
  
  #For loop that repeats the simulation as specified by "simulate.no". Simulation will run that many times with each set of experimental conditions
  estim.total<-list()
  fitind.total<-list()
  n.total <- list()
  for(i in 1:simulate.no){
    repetition.no <- i
    cat("Beginning repetition: ", cond.no, ":", i, " out of ", simulate.no, ".\n", sep="")
    #Vector of sample sizes randomly sampled from a predefined distribution
    n <- round(r_n(n = k))
    ##Generate and fit the models to the various analyses
    estim.fitind<- trycatch(genandfit(Sigma = Sigma,  V = Sigma_V, hetero = hetero, k = k, n = n, miss.stud = missingstud, miss.var = missingvar,
                             num.of.obs.var = numbofobsvar, model = model, RAM = RAM, model.type = model.type, varnimsov = varnimsov, repetition.no = repetition.no),
                              error = function(e){
                                ##Create a dataframe to replace estimates
                                norm.estim <- c(NA,NA,"norm",NA , NA, NA, NA, NA, NA)
                                unir.estim <- c(NA,NA,"unir",NA , NA, NA, NA, NA, NA)
                                tssem.estim <- c(NA,NA,"tssem",NA , NA, NA, NA, NA, NA)
                                osmasem.estim <- c(NA,NA,"osmasem",NA , NA, NA, NA, NA, NA)
                                
                                estimates <- data.frame(norm.estim, unir.estim, tssem.estim, osmasem.estim)
                                
                                ##Create a dataframe to replace fit indices
                                norm.fitind <- c(NA, NA, NA, NA, NA, NA, NA)
                                unir.fitind <- c(NA, NA, NA, NA, NA, NA, NA)
                                tssem.fitind <- c(NA, NA, NA, NA, NA, NA, NA)
                                osmasem.fitind <- c(NA, NA, NA, NA, NA, NA, NA)
                                
                                fitind <- data.frame(norm.fitind, unir.fitind, tssem.fitind, osmasem.fitind)
                                
                                estim.fitind <- list(estimates, fitind)
                                return(estim.fitind)
                              })
    estim.total[[i]] <- estim.fitind[[1]]
    fitind.total[[i]] <- estim.fitind[[2]]
    n.total[[i]] <- c(repetition.no, n)
    cat("Completed repetition: ", cond.no, ":", i, " out of ", simulate.no, ".\n", sep="")
  }
  
  ##Combine the estimates and fit indices lists into dataframes
  estim.total2<-do.call("rbind", estim.total)
  fitind.total2<-do.call("rbind", fitind.total)
  n.total2<-as.data.frame(do.call("rbind", n.total))
  
  #Create dataframe of conditions under which the data was generated and analysis run
  simulate.cond<-c(model.type, model.size, k, model.misspecification, missingstud, missingvar, hetero)
  
  ##Create one for estimates and fit indices each
  simulate.cond.est<-as.data.frame(t(replicate(n = nrow(estim.total2), expr = simulate.cond)))
  simulate.cond.fitind<-as.data.frame(t(replicate(n = nrow(fitind.total2), expr = simulate.cond)))
  simulate.cond.n <- as.data.frame(t(replicate(n = nrow(n.total2), expr = simulate.cond)))
  
  ##Combine the dataframe of conditions with the results dataframes
  estim.total3 <- cbind(simulate.cond.est, estim.total2)
  fitind.total3 <- cbind(simulate.cond.fitind, fitind.total2)
  n.total3 <- cbind(simulate.cond.n, n.total2)
  
  ##Rename the new estimates and fit indices dataframes
  names.est.fitind.n<-c("model.type", "model.size", "k", "model.misspecification", "missing.stud", "missing.var", "hetero")
  names(estim.total3)[1:7] <- names.est.fitind.n
  names(fitind.total3)[1:7] <- names.est.fitind.n
  names(n.total3)[1:7] <- names.est.fitind.n
  
  ##Generate a vector of names for the 1:nth study N's 
  ##Create a list
  n.names <- list()
  ##For loop to generate a list of variable names
  for(i in 1:k){
    n.names[i] <- paste0("K",i)
  }
  ##Convert the list into a vector
  assign(x = "n.names2", c(do.call("cbind", n.names)))
  ##Rename the variables in n.df with the vector new names
  names(n.total3)[-1:-8] <- n.names2
  
  ##Create a list of estimates, fit indices and N and return that list
  return(list(estim.total3, fitind.total3, n.total3))
}

#Generate a matrix to be used to generate heterogeneity
sigmavmat<-function(sigma, v) {
  ##Number of Correlations
  numofcorr <- as.numeric(table(lower.tri(sigma))[2])
  ## Heterogeneity of correlation: SD_rho=0.1
  Sigma_V <- diag(rep(x = (v^2), 'times' = numofcorr))
}

#Generate data and introduce missing data
generate.data <- function(Sigma, V, k, n, miss.stud, miss.var, num.of.obs.var, hetero) {
  print(paste("I am generating the population covariance matrix",
              "with", paste(hetero), "heterogeneity now"))
  ##Generate heterogeneous population correlations matrices 
  P<-rCorPop(Sigma = Sigma, V = V, k = k, corr = T, nonPD.pop = "replace")
  P<-P[1:k]
  print("Done generating")
  
  ##Use population correlation matrices to generate raw data and then generate sample correlation matrices from the raw data
  print("Generating raw data from the population correlation matrices")
  rawdat<-list()
  R<-list()
  
  for(i in 1:k){
    mat<-P[[i]]
    mat<-matrix(data = mat, ncol = ncol(mat), nrow = nrow(mat))
    
    df<-mvtnorm::rmvnorm(n = n[i], mean = rep(0, ncol(mat)) , sigma = mat)
    #R[[i]]<-cor(df)
    df<-as.data.frame(df)
    rawdat[[i]]<-df
  }
  
  if(!miss.stud == 0|!miss.var == 0) {
    print(paste("Introducing missing data with", paste0(miss.stud), "percent of studies missing and",
                paste0(miss.var), "percent of variables missing"))
    ##Introduce missing data to raw data
    ## No. of studies with missing variables
    missing.studies <- round(k*(miss.stud/100))
    ## Index of studies with missing variables. Studies on the top are missing.
    missing.studies.index <- rep(c(TRUE, FALSE), times=c(missing.studies, k-missing.studies))
    
    ## No. of variables are missing: Either 2 or 3 
    missing.variables <- round(num.of.obs.var*(miss.var/100))
    ## Index of variables are missing
    missing.variables.index <- rep(c(TRUE, FALSE), times = c(missing.variables, num.of.obs.var-missing.variables))  
    
    ## Create a list where the missing variables index is just repeated
    missvarlist<-list()
    for(i in 1:k){
      missvarlist[[i]] <- missing.variables.index
    }
    
    ## Introduce missing variables with MCAR
    missrawdat<-mapply(intro.mcar, rawdat, missing.studies.index, missvarlist, SIMPLIFY = FALSE)
    print("Done introducing missing data")
    #show(missrawdat)
    return(missrawdat)
  } else {
    return(rawdat)
  }
}

## Introduce missing variables with MCAR
## x: raw simulated participant data
## index: missing.studies.index or what studies should have missing data
## If TRUE, introduce missing variables with MCAR
## Randomly sample missing.variables.index
intro.mcar<-function(x, what.study.missing, what.var.missing){
  if(what.study.missing == T){
    #If True introduce missing data CAR
    index <- sample(what.var.missing)
    x[, index] <- NA
    x
  } else {
    #if False return the dataframe
    x
  }
}

#Rename the dataframes names
rename.matrix <- function(x, rownim, colnim){
  rownames(x)<-rownim
  colnames(x)<-colnim
  x
}

#Normal CFA
norm.sem <- function(model.to.fit, data){
  print("fitting normal sem model")
  normal <- sem(model = model.to.fit, data = data, std.lv = T)
  norm.summ<-summary(normal)
  ##Extract estimates and fit indices
  norm.estim <- norm.summ$PE
  norm.fitind <- fitMeasures(normal, fit.measures = c("chisq","df","cfi","tli","RMSEA"))
  
  ##Removing columns from the estimates dataframe that are not wanted
  norm.estim <- norm.estim[,c(-4,-7)]
  ##Rename the columns with a standard naming scheme
  names(norm.estim)<- c("var1", "op", "var2", "Estimate", "Std.Error", "Pr(>|z|)")
  
  ##Create a vector that indicates what analysis the estimates were obtained from and combine it with the estimates dataframe
  analysis.type <- rep("norm", times = nrow(norm.estim))
  norm.estim<-cbind(analysis.type, norm.estim)
  
  norm.sem.return<-list(norm.estim, norm.fitind)
  
  return(norm.sem.return)
}

#Univariate R
unir.masem <- function(model.to.fit.ram, data, n, k, hetero, model.type) {
  print("fitting unir model")
  stage1<-uniR1(Cor = data, n = n)
  stage2<-uniR2mx(stage1, RAM = model.to.fit.ram, intervals = TRUE)
  print("unir fitted fine")
  stage2.fit<-summary(stage2, fitIndices = TRUE)
  #Extract the estimates and fit indices
  unir.estim<-stage2.fit$parameters
  unir.fitind<-c(stage2.fit$Chi, stage2.fit$ChiDoF, stage2.fit$CFI, stage2.fit$TLI ,stage2.fit$RMSEA)
  
  #Assign names to the fit indices because the vector does not extract with names for them
  names(unir.fitind) <- c("chisq", "df", "cfi", "tli", "rmsea")
  
  #Function that changes the names for each estimate from the metaSEM scheme to the lavaan scheme
  unir.estim2<-meta.to.lavaan.names(estimates.df = unir.estim, analysis = "unir", model.type = model.type, hetero = hetero)
  
  ##Function that calculates p.values since unir does not provide it
  unir.pval <- calc.p.value(Estimate = unir.estim2$Estimate, unir.estim2$Std.Error)
  
  #Combine the p values vector and the estimates dataframe 
  unir.estim3 <- cbind (unir.estim2, unir.pval)
  #Rename the p values vector in the new estimates dataframe
  names(unir.estim3) <-c(names(unir.estim3)[-6], "Pr(>|z|)")
  
  ##Include a column indicating what type of analysis was run
  analysis.type <- rep("unir", times = nrow(unir.estim3))
  unir.estim4<-cbind(analysis.type, unir.estim3)
  
  ##List of stuff to return
  unir.masem.return<-list(unir.estim4, unir.fitind)
  
  return(unir.masem.return)
}

#TSSEM
tssem.masem<-function(model.to.fit.ram, data, n, k, hetero, model.type) {
  print("fitting TSSEM model")
  if(hetero > 0){
    ##Random effect TSSEM
    tssem.stage1<-tssem1REM(Cov = data, n = n, acov= "weighted") }
  else if(hetero == 0){
    ##Fixed effect TSSEM
    tssem.stage1<- tssem1FEM(Cov = data, n = n)  
  }
  if(tssem.stage1$mx.fit$output$status$code > 1){
    print("Problems with TSSEM, retrying 10 times")
    i <- 0
    tssem.stage1<-rerun(tssem.stage1, autofixtau2 = TRUE, extraTries = 10)
  }
  
  #If still non-convergent, keep trying to fit
  if(tssem.stage1$mx.fit$output$status$code > 1){
    i <- i + 1
    while (tssem.stage1$mx.fit$output$status$code > 1 & i < 5) {
      tssem.stage1<-rerun(tssem.stage1, autofixtau2 = TRUE, extraTries = 10)
      i <- i + 1
      print("rerunning TSSEM", paste0(i))
    }
  }
  
  #If still non-convergent after trying for 50 times
  if(tssem.stage1$mx.fit$output$status$code > 1){
    print("still non-convergent")
    tssem.estim <- c(NA, NA, NA, NA, NA, NA, NA)
    tssem.fitind<-c(NA, NA, NA, NA, NA)
  } else {
    print("No problems with TSSEM")
    tssem.stage2<-tssem2(tssem.stage1, RAM = model.to.fit.ram)
    stage2summ.tssem <- summary(tssem.stage2)
    ##Extract the estimates and fit indices
    tssem.estim <- stage2summ.tssem$coefficients
    tssem.fitind<-c(stage2summ.tssem$stat[2], stage2summ.tssem$stat[3], stage2summ.tssem$stat[14], stage2summ.tssem$stat[13], stage2summ.tssem$stat[9])
  }
  ##Rename the fit indices 
  names(tssem.fitind) <- c("chisq", "df", "cfi", "tli", "rmsea")
  #Function that changes the names for each estimate from the metaSEM scheme to the lavaan scheme
  tssem.estim2 <- meta.to.lavaan.names(estimates.df = tssem.estim, analysis = "tssem", model.type = model.type, hetero = hetero)
  
  ##Include a column indicating what type of analysis was run
  analysis.type <- rep("tssem", times = nrow(tssem.estim2))
  tssem.estim3<-cbind(analysis.type, tssem.estim2)
  
  ##List of estimate and fit indices to return
  tssem.masem.return <- list(tssem.estim3, tssem.fitind)
  return(tssem.masem.return)
}

#OSMASEM
osmasem.masem<-function(model.to.fit.ram, data, n, k, hetero, model.type) {
  print("Fitting OSMASEM model")
  M0 <- create.vechsR(A0= model.to.fit.ram$A, S0=model.to.fit.ram$S, F0=model.to.fit.ram$F)
  if(hetero > 0){
    T0 <- create.Tau2(RAM=model.to.fit.ram, RE.type="Diag")
  } else {
    T0 <- create.Tau2(RAM=model.to.fit.ram, RE.type="Zero")
  }
  df11<- Cor2DataFrame(data, n)
  
  fit<- osmasem(Mmatrix = M0, Tmatrix=T0, data = df11)
  if(fit$mx.fit$output$status$code > 1) {
    print("Oh no we gotta problem with OSMASEM")
    i <- 0
    fit<-rerun(fit, autofixtau2 = TRUE, extraTries = 10)
    
    ##If it is still non-convergent
    i <- i + 1
    while (fit$mx.fit$output$status$code > 1 & i < 3) {
      fit<-rerun(fit, autofixtau2 = TRUE, extraTries = 10)
      i <- i + 1
      print("rerunning OSMASEM", paste0(i))
    }
    
    ##If still non-convergent after trying to refit
    if(fit$mx.fit$output$status$code > 1) {
      osmasem.estim <- c(NA, NA, NA, NA, NA, NA, NA)
      osmasem.fitind<-c(NA, NA, NA, NA, NA)
    } else {
      osmasemsumm <- summary(fit, fitIndices = TRUE)
    }
    
  } else {
    print("OSMASEM is all good")
    osmasemsumm <- summary(fit, fitIndices = TRUE)
  }
  ##Extract the estimates and fit indices
  osmasem.estim <- osmasemsumm$parameters
  osmasem.fitind<-c(osmasemsumm$Chi, osmasemsumm$ChiDoF, osmasemsumm$CFI, osmasemsumm$TLI , osmasemsumm$RMSEA)
  ##Rename the fit indices
  names(osmasem.fitind) <- c("chisq", "df", "cfi", "tli", "rmsea")
  
  #Function that changes the names for each estimate from the metaSEM scheme to the lavaan scheme
  osmasem.estim2<-meta.to.lavaan.names(estimates.df = osmasem.estim, analysis = "osmasem", model.type = model.type, hetero = hetero)
  
  ##Include a column indicating what type of analysis was run
  analysis.type <- rep("osmasem", times = nrow(osmasem.estim2))
  osmasem.estim3<-cbind(analysis.type, osmasem.estim2)
  
  ##List of estimate and fit indices to return
  osmasem.masem.return <- list(osmasem.estim3, osmasem.fitind)
  return(osmasem.masem.return)
}


##Function that runs all the tests, with try catch functionality, any error or warning will not stop the simulation from running
run.da.tests <- function(model, RAM, masem.data, norm.data, n, k, hetero, model.type){
  norm.sem.return <- tryCatch(norm.sem(model = model, data = norm.data),
                              warning = function(w){
                                w <- list(c("norm", NA, NA, NA, NA, NA, NA), c(NA, NA, NA, NA, NA))
                                return(w)},
                              error = function(e){
                                print("norm.sem encountered an error that resulted in termination")
                                e <- list(c("norm", NA, NA, NA, NA, NA, NA), c(NA, NA, NA, NA, NA))
                                return(e)})
  unir.masem.return <- tryCatch(unir.masem(model.to.fit.ram = RAM, data = masem.data, n = n, k = k, hetero = hetero, model.type = model.type),
                                warning = function(w){
                                  w <- list(c("unir", NA, NA, NA, NA, NA, NA), c(NA, NA, NA, NA, NA))
                                  return(w)},
                                error = function(e){
                                  print("unir.masem encountered an error that resulted in termination")
                                  e <- list(c("unir", NA, NA, NA, NA, NA, NA), c(NA, NA, NA, NA, NA))
                                  return(e)})
  tssem.masem.return <- tryCatch(tssem.masem(model.to.fit.ram = RAM, data = masem.data, n = n, k = k, hetero = hetero, model.type = model.type),
                                 warning = function(w){
                                   w <- list(c("tssem", NA, NA, NA, NA, NA, NA), c(NA, NA, NA, NA, NA))
                                   return(w)},
                                 error = function(e){
                                   print("tssem.masem encountered an error that resulted in termination")
                                   e <- list(c("tssem", NA, NA, NA, NA, NA, NA), c(NA, NA, NA, NA, NA))
                                   return(e)})
  osmasem.masem.return <- tryCatch(osmasem.masem(model.to.fit.ram = RAM, data = masem.data, n = n, k = k, hetero = hetero, model.type = model.type),
                                   warning = function(w){
                                     w <- list(c("osmasem", NA, NA, NA, NA, NA, NA), c(NA, NA, NA, NA, NA))
                                     return(w)},
                                   error = function(e){
                                     print("osmasem.masem encountered an error that resulted in termination")
                                     e <- list(c("osmasem", NA, NA, NA, NA, NA, NA), c(NA, NA, NA, NA, NA))
                                     return(e)})
  
  #Combine the estimates and fit indices from the various tests into two seperate dataframes
  estimates<-do.call("rbind", list(norm.sem.return[[1]], unir.masem.return[[1]], tssem.masem.return[[1]], osmasem.masem.return[[1]]))
  fitind<-as.data.frame(do.call("rbind", list(norm.sem.return[[2]], unir.masem.return[[2]], tssem.masem.return[[2]], osmasem.masem.return[[2]])))
  
  ##Create a vector of what analysis generated what fit indices
  analysis.type<-c("norm", "unir", "tssem", "osmasem")
  ##Combine the vector with the fit indices dataframe
  fitind2<-cbind(analysis.type, fitind)
  
  ##Combine the estimates and fit indices into a dataframe
  return(list(estimates, fitind2))
}

genandfit<-function(Sigma, V, hetero, k, n, miss.stud, miss.var, num.of.obs.var,
                    model, RAM, model.type, varnimsov, repetition.no){
  
  missrawdat <- generate.data(Sigma = Sigma, V = V, hetero = hetero, k = k, n = n, 
                                       miss.stud = miss.stud, miss.var = miss.var,
                                       num.of.obs.var = num.of.obs.var)
  
  ##Get the correlations of each dataframe
  missR<-lapply(FUN = cor, missrawdat)
  
  ##Reassign R list to masem.df
  masem.df<-missR
  masem.df<-lapply(masem.df, rename.matrix, rownim = varnimsov, colnim = varnimsov)
  
  ##Transform rawdat list to a full dataframe
  norm.df<-do.call("rbind", missrawdat)
  names(norm.df)<-varnimsov
  
  ##Fit the models to the data 
  estim.fitind<-run.da.tests(model = model, RAM = RAM, masem.data = masem.df, norm.data = norm.df, n = n, k = k, hetero = hetero, model.type = model.type)
  
  ##Add the repetition number and mean of N
  estimates<-estim.fitind[[1]]
  fitind<-estim.fitind[[2]]
  
  ##Generate vectors that are the number of rows for the estimates and fit indices dataframes
  est.rep.no<-rep(repetition.no, times = nrow(estimates))
  fitind.rep.no<-rep(repetition.no, times = nrow(fitind))
  
  est.meanofn <- rep(mean(n), times = nrow(estimates))
  fitind.meanofn<-rep(mean(n), times = nrow(fitind))
  
  ##Column bind the vectors to the dataframes
  estimates2<-cbind(est.meanofn, est.rep.no, estimates)
  fitind2<- cbind(fitind.meanofn, fitind.rep.no, fitind)
  
  ##Rename the new columns to repetition.no
  names(estimates2)[1:2]<- c("mean.of.n", "rep.no")
  names(fitind2)[1:2]<- c("mean.of.n", "rep.no")
  
  ##Recombine the two dataframes into a list and return
  estim.fitind2<-list(estimates2, fitind2)
  return(estim.fitind2)
}


##Function that converts the a data frame with MetaSEM paramater naming conventions into Lavaan naming conventions
meta.to.lavaan.names<-function(estimates.df, analysis, model.type, hetero){
  ###Extract the names of the estimates in the dataframe
  if(analysis == "tssem"){
    vecofnames <- rownames(estimates.df)
  } else if (analysis == "unir"){
    vecofnames <- estimates.df[,1]
  } else if (analysis == "osmasem"){
    vecofnames <- estimates.df[,1]
  }
  
  ##Create an index of which row holds regression/loading estimates and which hold correlation/variance estimates
  amatrix.index<-grepl(stringr::regex("on"),vecofnames)
  smatrix.index<-grepl(stringr::regex("with"),vecofnames)
  
  ##Use the index to create a vector only holding the names of regression/loading estimates and correlation/variance estimates each
  amatrix<-vecofnames[amatrix.index]
  smatrix<-vecofnames[smatrix.index]
  
  ###Extract the variable names from the original vector of names, because the names hold both the variables eg. v2onv3, I want to get v2 and v3 seperately 
  amatrixvariables<-stringr::str_split(amatrix, "on", simplify = T)
  smatrixvariables<-stringr::str_split(smatrix, "with", simplify =T)
  
  ###If it is an OSMASEM analysis, repeat the above but for the tau estimates
  if(analysis == "osmasem" & hetero > 0){
    tau.index <- grepl(stringr::regex("Tau"),vecofnames)
    tau<-vecofnames[tau.index]
    tauvariables<-str_split(tau, "_", simplify =T)
  }
  
  ###Create a dataframe using Lavaan naming conventions
  ##Create one column for the variable on the left (col1a) and one for the right (col2a)
  col1a<-amatrixvariables[,1]
  col2a<-amatrixvariables[,2]
  ##Create vectors with an operator that represents the relationship between the two variables, for CFA =~ for loadings. For path analysis, ~ for regression
  if(model.type == "cfa"){
    opa<-rep("=~",times = length(col1a))
  } else if (model.type == "path") {
    opa<-rep("~",times = length(col1a))
  }
  ##Create vectors with an operator that represents the relationship between the two variables with ~~ representing variance
  col1s<-smatrixvariables[,1]
  col2s<-smatrixvariables[,2]
  ops<-rep("~~", times = length(col1s))
  
  if(analysis == "osmasem" & hetero > 0){
    ##Create vectors with an operator that just for the tau variables, since the tau variables do not relate to anything the - is just a filler
    col1t<-tauvariables[,1]
    col2t<-tauvariables[,2]
    opt<-rep("-", times = length(col1t))
    
    #Seperately, combine the right(1s), left(2s), and operator vectors together, depending on whether it is OSMASEM or not, the tau variable columns are included
    var1<-c(col1a, col1s, col1t)
    var2<-c(col2a, col2s, col2t)
    op<-c(opa,ops,opt)
  } else {
    var1<-c(col1a,col1s)
    var2<-c(col2a,col2s)
    op<-c(opa,ops)
  }
  
  ##Combine the right(1s), left(2s), and operator vectors together to create a data frame of names for the estimates using the lavaan convention
  df.of.lavaan.names<-data.frame(var1,op,var2)
  
  ##Extract the estimates, standard error and p values from the estimates dataframe only
  indexofstuffwanted<-grep("Estimate|Std.Error|Pr(>|z|)", names(estimates.df))
  estimates.with.lavaan.names<-cbind(df.of.lavaan.names, estimates.df[ ,indexofstuffwanted])
  ##Remove the rownames that come with some dataframes
  rownames(estimates.with.lavaan.names) <- NULL 
  return(estimates.with.lavaan.names)
}

##Just to calculate p.values since unir does not provide it (there was originally another method to calculate it but has since been removed)
calc.p.value <- function(Estimate, SE){
  z <- Estimate/SE
  method2<-round((pnorm(z, lower.tail = FALSE))*2, digits = 3)
  return(method2)
}