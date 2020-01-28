simulationBiDAGvsBLIP <- function(i, n, DAGs, datas) {
  library(bnlearn)
  library(BiDAG)
  library(gRbase) # for is.DAG
  library(pcalg)
  source("lib/code_for_binary_simulations/make_var_names.R")
  source("lib/code_for_binary_simulations/bnlearn_help_fns.R")
  source("lib/code_for_binary_simulations/make_name.R")

  #DAGs <- list(readRDS(DAGfile)) # TODO: This is just temporary
  #datas <- list(readRDS(datafile))
  DAG <- DAGs[[i]]$DAG # Should this be a sequence of DAGs / data? /Felix
  data <- datas[[i]]
  DAGs <- NULL
  datas <- NULL

  sim <- list()
  sim$n <- n
  sim$sampsize <- nrow(data)
  sim$DAG <- DAG
  sim$nedges <- sum(dag2adjacencymatrix(DAG))
  # BiDAG part
  # first we run iterative version for 2 search spaces one
  # for PC and one for TABU
  starttime <- Sys.time()
  myscore <- scoreparameters(n, "bde", data, bdepar = list(chi = 1, edgepf = 1))

  # This uses PC-alg as default starting search space.
  itfit <- iterativeMCMCsearch(n, myscore, chainout = TRUE) # the number of MCMC steps is by default 3.5n^{2}\log{n}

  samplefit <- orderMCMC(n, myscore, startspace = itfit$endspace, MAP = FALSE, chainout = TRUE) # the number of MCMC steps is by default 5n^{2}\log{n}
  endtime <- Sys.time()
  sim$totaltime <- endtime - starttime

  sim$MAPscore <- itfit$max$score
  sim$truescore <- DAGscore(n, myscore, dag2adjacencymatrix(DAG))
  DAG05 <- dag.threshold(n, samplefit$chain$incidence, pbarrier = 0.5, pdag = FALSE, burnin = 0.5) # incidence is a chain of adjacency matrices
  if (is.DAG(DAG05)) {
    sim$medianscore <- DAGscore(n, myscore, DAG05)
  } else {
    sim$medianscore <- 10
  }
  # This function calculates the number of true and false positives, the true
  # positive rate, the structural Hamming distance and score for each iteration
  # in the search procedure implemented in the iterativeMCMCsearch function
  sim$iterativeMCMC <- iterations.check(itfit, DAG)
  print(sim$iterativeMCMC)
  # This function calculates the number of true and false positives and the
  # structural Hamming distance between a ground truth DAG and a directed graph
  # summarising a sample of DAGs obtained from an MCMC scheme, as the posterior
  # probability threshold is varied
  sim$finalMCMC <- sample.check(n, samplefit$chain$incidence, DAG, pdag = TRUE)
  print(sim$finalMCMC)
  itfit <- NULL
  samplefit <- NULL







  # same with TABU

  # convert to a df for rblip and tabu search
  datadf <- data
  varnames <- varnames.make(n)
  colnames(datadf) <- varnames
  datadf <- as.data.frame(datadf)
  for (j in 1:ncol(datadf)) {
    datadf[, varnames[j]] <- as.factor(datadf[, varnames[j]])
  }

  # Tabu search as starting space
  starttime <- Sys.time()

  tabufit <- tabu(datadf, score = "bde")

  tabu.g <- bnarcs2dag(varnames, tabufit$arcs)
  myscore <- scoreparameters(n, "bde", data, bdepar = list(chi = 1, edgepf = 1))

  itfit <- iterativeMCMCsearch(n, myscore, startspace = dag2adjacencymatrix(tabu.g), chainout = TRUE)
  maxit <- length(itfit$max)

  samplefit <- orderMCMC(n, myscore, startspace = itfit$endspace, MAP = FALSE, chainout = TRUE) # What is this? For the median score? /Felix
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
  #save(sim, file = paste("./myoutfile", n, "s", sim$sampsize, "r", i, ".Rda", sep = ""))
  output_path <- "./simresults/blippower"
  dir.create(output_path, showWarnings = FALSE, recursive = TRUE)
  output_filename <- paste("BiDAGbinsim", "n", n, "s", sim$sampsize, "r", i, ".Rda", sep = "_")
  save(sim, file = file.path(output_path, output_filename))
  itfit <- NULL
  samplefit <- NULL
 return(sim)
}


