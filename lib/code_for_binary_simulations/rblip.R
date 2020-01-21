library(BiDAG)
library(bnlearn)

source("lib/code_for_binary_simulations/make_var_names.R")
source("lib/code_for_binary_simulations/bnlearn_help_fns.R")
source("lib/code_for_binary_simulations/make_name.R")

blipsim <- function(n, DAG, data, timesvec, scorefunction = "bdeu", rep) {
  sim <- list()
  sim$n <- n
  sim$sampsize <- nrow(data)
  sim$DAG <- DAG
  sim$nedges <- sum(dag2adjacencymatrix(DAG))
  res <- matrix(ncol = 8, nrow = length(timesvec))
  res[, 8] <- timesvec
  colnames(res) <- c("TP", "FP", "SHD", "TPR", "FPRn", "score", "bnscore", "time")

  # convert to a df for rblip and tabu search
  datadf <- data
  varnames <- varnames.make(n)
  colnames(datadf) <- varnames
  datadf <- as.data.frame(datadf)
  for (i in 1:ncol(datadf)) {
    datadf[, varnames[i]] <- as.factor(datadf[, varnames[i]])
  }
  data <- datadf

  k <- 1
  nedges <- sum(dag2adjacencymatrix(DAG))
  for (i in timesvec) {
    varnames <- colnames(data)
    blipfit <- blip.learn(data, time = i, scorefunction = scorefunction, verbose = 0)
    blipadj <- bnfit2matrix(blipfit)
    blipadj <- rearrangeMatrix(blipadj, varnames)
    compres <- compareDAGs(adjacency2dag(blipadj), DAG)
    res[k, 1] <- compres[2]
    res[k, 2] <- compres[3]
    res[k, 3] <- compres[1]
    res[k, 4] <- compres[2] / nedges
    res[k, 5] <- compres[3] / nedges
    bnblip <- as.bn(modelstring(blipfit))
    res[k, 6] <- bnlearn::score(bnblip, data, type = "bde")
    myscore <- scoreparameters(ncol(data), "bdecat", data, bdecatpar = list(chi = 1, edgepf = 1))
    res[k, 7] <- DAGscore(ncol(data), myscore, blipadj)
    k <- k + 1
  }
  sim$blip <- list()
  sim$blip$res <- res
  sim$blip$DAG <- adjacency2dag(blipadj)
  sim$i <- rep

  #dir.create(file.path(mainDir, subDir), showWarnings = FALSE)
  #save(sim, file = paste("simresults/blipsim/BLIPbinsimn", n, "s", sim$sampsize, "r", rep, ".Rda", sep = ""))
  return(sim)
}

