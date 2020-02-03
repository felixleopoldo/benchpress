# TODO
JoinResultsAndSettingBiDAG <- function(sim_results){
  sim <- list()
  for (i in seq(n_datasets)) {
    # Summarising statistics (could this be made when we call this function instead? / Felix)
    DAG <- binBN[[i]]$DAG
    sim$n <- n
    sim$sampsize <- nrow(data)
    sim$DAG <- DAG
    sim$nedges <- sum(dag2adjacencymatrix(DAG))

    sim$MAPscore <- bidag_simple_sim_list_2nitfit$max$score
    sim$truescore <- DAGscore(n, myscore, dag2adjacencymatrix(DAG))
    DAG05 <- dag.threshold(n, samplefit$chain$incidence, pbarrier = 0.5, pdag = FALSE, burnin = 0.5) # incidence is a chain of adjacency matrices
    if (is.DAG(DAG05)) {
      sim$medianscore <- DAGscore(n, myscore, DAG05)
    } else {
      sim$medianscore <- 10
    }

    sim$iterativeMCMC <- iterations.check(itfit, DAG)
    sim$finalMCMC <- sample.check(n, samplefit$chain$incidence, DAG, pdag = TRUE)
    sim$i <- i
  }
}


simulationBiDAG <- function(i, n, DAGs, datas) {
  library(bnlearn)
  library(BiDAG)
  library(gRbase) # for is.DAG
  library(pcalg)
  source("lib/code_for_binary_simulations/make_var_names.R")
  source("lib/code_for_binary_simulations/bnlearn_help_fns.R")
  source("lib/code_for_binary_simulations/make_name.R")
  source("lib/code_for_binary_simulations/df_fns.R")

  #DAG <- DAGs[[i]]$DAG # Should this be a sequence of DAGs / data? /Felix
  DAG <- DAGs[[i]] # Should this be a sequence of DAGs / data? /Felix
  data <- datas[[i]]
  sim <- list()

  # Benchmark
  starttime <- Sys.time()
  myscore <- scoreparameters(n, "bde", data, bdepar = list(chi = 1, edgepf = 1))
  # This uses PC-alg as default starting search space.
  itfit <- iterativeMCMCsearch(n, myscore, chainout = TRUE) # the number of MCMC steps is by default 3.5n^{2}\log{n}

  samplefit <- orderMCMC(n, myscore, startspace = itfit$endspace, MAP = FALSE, chainout = TRUE) # the number of MCMC steps is by default 5n^{2}\log{n}
  endtime <- Sys.time()
  sim$totaltime <- endtime - starttime

  # Summarising statistics (could this be made when we call this function instead? / Felix)
  sim$n <- n
  sim$sampsize <- nrow(data)
  sim$DAG <- DAG
  sim$nedges <- sum(dag2adjacencymatrix(DAG))

  sim$MAPscore <- itfit$max$score
  sim$truescore <- DAGscore(n, myscore, dag2adjacencymatrix(DAG))
  DAG05 <- dag.threshold(n, samplefit$chain$incidence, pbarrier = 0.5, pdag = FALSE, burnin = 0.5) # incidence is a chain of adjacency matrices
  if (is.DAG(DAG05)) {
    sim$medianscore <- DAGscore(n, myscore, DAG05)
  } else {
    sim$medianscore <- 10
  }

  sim$iterativeMCMC <- iterations.check(itfit, DAG)
  sim$finalMCMC <- sample.check(n, samplefit$chain$incidence, DAG, pdag = TRUE)
  sim$i <- i

  sim$n <- n
  sim$sampsize <- nrow(data)
  sim$DAG <- DAG
  sim$nedges <- sum(dag2adjacencymatrix(DAG))

  # convert to a df for rblip and tabu search
  varnames <- varnames.make(n)
  datadf <- matrixToDataframe(data, varnames = varnames)

  # Tabu search as starting space
  starttime <- Sys.time()


  tabufit <- tabu(datadf, score = "bde")
  tabu.g <- bnarcs2dag(varnames, tabufit$arcs)
  myscore <- scoreparameters(n, "bde", data, bdepar = list(chi = 1, edgepf = 1))

  itfit <- iterativeMCMCsearch(n, myscore, startspace = dag2adjacencymatrix(tabu.g), chainout = TRUE)

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


  return(extendBidagSimResult(sim))
}

simulationBiDAGSimple <- function(i, n, DAGs, datas) {
  library(bnlearn)
  library(BiDAG)
  library(gRbase) # for is.DAG
  library(pcalg)
  source("lib/code_for_binary_simulations/make_var_names.R")
  source("lib/code_for_binary_simulations/bnlearn_help_fns.R")
  source("lib/code_for_binary_simulations/make_name.R")

  data <- datas[[i]]

  # Benchmark
  starttime <- Sys.time()
  myscore <- scoreparameters(n, "bde", data, bdepar = list(chi = 1, edgepf = 1))
  # This uses PC-alg as default starting search space.
  itfit <- iterativeMCMCsearch(n, myscore, chainout = TRUE) # the number of MCMC steps is by default 3.5n^{2}\log{n}

  samplefit <- orderMCMC(n, myscore, startspace = itfit$endspace, MAP = FALSE, chainout = TRUE) # the number of MCMC steps is by default 5n^{2}\log{n}
  endtime <- Sys.time()
  totaltime <- endtime - starttime

  sim <- list(itfit = itfit,
              samplefit = samplefit,
              totaltime = totaltime)
  return(sim)
}

simulationBiDAGTabu <- function(i, n, DAGs, datas) {
  library(bnlearn)
  library(BiDAG)
  library(gRbase) # for is.DAG
  library(pcalg)
  source("lib/code_for_binary_simulations/make_var_names.R")
  source("lib/code_for_binary_simulations/bnlearn_help_fns.R")
  source("lib/code_for_binary_simulations/make_name.R")

  DAG <- DAGs[[i]]$DAG # Should this be a sequence of DAGs / data? /Felix
  data <- datas[[i]]

  sim <- list()
  sim$n <- n
  sim$sampsize <- nrow(data)
  sim$DAG <- DAG
  sim$nedges <- sum(dag2adjacencymatrix(DAG))

  # convert to a df for rblip and tabu search
  varnames <- varnames.make(n)
  datadf <- matrixToDataframe(data, varnames = varnames)

  # Tabu search as starting space
  starttime <- Sys.time()

  tabufit <- tabu(datadf, score = "bde")
  tabu.g <- bnarcs2dag(varnames, tabufit$arcs)
  myscore <- scoreparameters(n, "bde", data, bdepar = list(chi = 1, edgepf = 1))

  itfit <- iterativeMCMCsearch(n, myscore, startspace = dag2adjacencymatrix(tabu.g), chainout = TRUE)

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
  #itfit <- NULL
  #samplefit <- NULL

  return(sim)
}
