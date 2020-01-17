varnames.make <- function(n) {
  return(paste("V", c(1:n), sep = ""))
}

blipsim <- function(n, DAG, data, timesvec, scorefunction) {
  res <- matrix(ncol = 8, nrow = length(timesvec))
  res[, 8] <- timesvec
  colnames(res) <- c("TP", "FP", "SHD", "TPR", "FPRn", "score", "bnscore", "time")

  sim$n <- n
  sim$sampsize <- nrow(data)
  sim$DAG <- DAG
  sim$nedges <- sum(dag2adjacencymatrix(DAG))

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
  save(sim, file = paste("simresults/blipsim/BLIPbinsimn", n, "s", sim$sampsize, "r", rep, ".Rda", sep = ""))
  return(sim)
}

blipsimlist10n <- list()
for (j in 1:100) {
  blipsimlist10n[[j]] <- blipsim(n, binBN[[j]]$DAG, bindata10n[[j]], timesvec = c(60, 120, 240), "bdeu", rep = j)
  save(blipsimlist10n, file = "blippower10n.Rda")
}
