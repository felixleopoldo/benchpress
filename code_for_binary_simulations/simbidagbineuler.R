n <- 100

simulationBiDAGvsBLIP <- function(i, n, DAGfile, datafile) {
  library(bnlearn)
  library(BiDAG)
  library(gRbase) # for is.DAG
  library(pcalg)
  source("makevarnames.R")
  source("bnlearnhelpfns.R")
  source("makename.R")

  DAGs <- readRDS(DAGfile)
  datas <- readRDS(datafile)
  DAG <- DAGs[[i]]$DAG
  data <- datas[[i]]
  DAGs <- NULL
  datas <- NULL

  sim <- list()
  sim$n <- n
  sim$sampsize <- nrow(data)
  sim$DAG <- DAG
  sim$nedges <- sum(dag2adjacencymatrix(DAG))
  # BiDAG part first we run iterative version for 2 search spaces one for PC and one for TABU
  starttime <- Sys.time()
  myscore <- scoreparameters(n, "bde", data, bdepar = list(chi = 1, edgepf = 1))
  itfit <- iterativeMCMCsearch(n, myscore)
  samplefit <- orderMCMC(n, myscore, startspace = itfit$endspace, MAP = FALSE, chainout = TRUE)
  endtime <- Sys.time()
  sim$totaltime <- endtime - starttime

  sim$MAPscore <- itfit$max$score
  sim$truescore <- DAGscore(n, myscore, dag2adjacencymatrix(DAG))
  DAG05 <- dag.threshold(n, samplefit$chain$incidence, pbarrier = 0.5, pdag = FALSE, burnin = 0.5)
  if (is.DAG(DAG05)) {
    sim$medianscore <- DAGscore(n, myscore, DAG05)
  } else {
    sim$medianscore <- 10
  }
  sim$iterativeMCMC <- iterations.check(itfit, DAG)
  sim$finalMCMC <- sample.check(n, samplefit$chain$incidence, DAG, pdag = TRUE)

  itfit <- NULL
  samplefit <- NULL

  # same with TABU
  # BiDAG part first we run iterative version for 2 search spaces one for PC and one for TABU

  # convert to a df for rblip and tabu search
  datadf <- data
  varnames <- varnames.make(n)
  colnames(datadf) <- varnames
  datadf <- as.data.frame(datadf)
  for (j in 1:ncol(datadf)) {
    datadf[, varnames[j]] <- as.factor(datadf[, varnames[j]])
  }

  starttime <- Sys.time()
  tabufit <- tabu(datadf, score = "bde")
  tabu.g <- bnarcs2dag(varnames, tabufit$arcs)
  myscore <- scoreparameters(n, "bde", data, bdepar = list(chi = 1, edgepf = 1))
  itfit <- iterativeMCMCsearch(n, myscore, startspace = dag2adjacencymatrix(tabu.g))
  maxit <- length(itfit$max)
  samplefit <- orderMCMC(n, myscore, startspace = itfit$endspace, MAP = FALSE, chainout = TRUE)
  endtime <- Sys.time()
  sim$TABUtotaltime <- endtime - starttime

  sim$TABUMAPscore <- itfit$max$score
  DAG05 <- dag.threshold(n, samplefit$chain$incidence, pbarrier = 0.5, pdag = FALSE, burnin = 0.5)
  if (is.DAG(DAG05)) {
    sim$TABUmedianscore <- DAGscore(n, myscore, DAG05)
  } else {
    sim$TABUmedianscore <- 10
  }
  sim$TABUiterativeMCMC <- iterations.check(itfit, DAG)
  sim$TABUfinalMCMC <- sample.check(n, samplefit$chain$incidence, DAG, pdag = TRUE)
  sim$i <- i
  save(sim, file = paste("simresults/blippower/BiDAGbinsimn", n, "s", sim$sampsize, "r", i, ".Rda", sep = ""))
  itfit <- NULL
  samplefit <- NULL
  return(sim)
}

library(parallel)

# test
# simulationBiDAGvsBLIP(1,100,"binBN.rds","bindata10n.rds")

for (indc in 0:9) {
  ind <- c(1:10 + indc * 10)
  cl <- makeCluster(10)
  outputClApply <- clusterApply(cl, ind, simulationBiDAGvsBLIP, n = n, "binBNpower.rds", "bindata10npower.rds")
  stopCluster(cl)
}

for (indc in 0:9) {
  ind <- c(1:10 + indc * 10)
  cl <- makeCluster(10)
  outputClApply <- clusterApply(cl, ind, simulationBiDAGvsBLIP, n = n, "binBNpower.rds", "bindata2npower.rds")
  stopCluster(cl)
}
