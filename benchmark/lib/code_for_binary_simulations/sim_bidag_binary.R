library(bnlearn)
library(BiDAG)
library(gRbase) # for is.DAG
library(pcalg)
source("lib/code_for_binary_simulations/make_var_names.R")
source("lib/code_for_binary_simulations/bnlearn_help_fns.R")
source("lib/code_for_binary_simulations/make_name.R")
source("lib/code_for_binary_simulations/df_fns.R")


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

simulationIterativeSearch <- function(i, n, DAG, data, scoretype = "bde", MAP = FALSE) {
  myscore <- scoreparameters(n, scoretype, data, bdepar = list(chi = 1, edgepf = 1))
  # This uses PC-alg as default starting search space.
  starttime <- Sys.time()
  iterative_search_res <- iterativeMCMCsearch(n, myscore, chainout = TRUE, MAP = MAP) # the number of MCMC steps is by default 3.5n^{2}\log{n}
  endtime <- Sys.time()
  totaltime <- endtime - starttime

  sim <- SummarizeIterativeSearchResults(i, myscore, iterative_search_res, DAG, totaltime, data, MAP)
  return(sim)
}

simulationOrderMCMC <- function(i, n, DAG, data, scoretype = "bde", MAP = FALSE) {
  myscore <- scoreparameters(n, scoretype, data, bdepar = list(chi = 1, edgepf = 1))
  # This uses PC-alg as default starting search space.
  starttime <- Sys.time()
  order_mcmc_res <- orderMCMC(n, myscore, startspace = iterative_search_res$endspace, MAP = FALSE, chainout = TRUE) # the number of MCMC steps is by default 5n^{2}\log{n}
  endtime <- Sys.time()
  totaltime <- endtime - starttime

  sim <- SummarizeBiDAGResults(i, myscore, iterative_search_res, order_mcmc_res, DAG, totaltime, data, MAP)
  sim$sampsize <- nrow(data)
  return(sim)
}


SummarizeIterativeSearchResults <- function(myscore, iterative_search_res, DAG,  MAP) {
  sim <- list()
  sim$true_nedges <- sum(dag2adjacencymatrix(DAG))
  
  # Iterative search
 
  sim$output <- iterations.check(iterative_search_res, DAG)
  sim$output <- cbind(sim$output, sim$output[, 2] / sim$true_nedges) # 2 is FP
  colnames(sim$output)[6] <- "FPRn"
  nit <- nrow(sim$output)

  
  sim$SHDMAP <- sim$output[nit, 4] # 4 is SHD
  sim$sampsize <- nrow(data)
  sim$n <- numNodes(DAG)
  return(sim)
}


SummarizeBiDAGResults <- function(i, myscore, iterative_search_res, order_mcmc_res, DAG, totaltime, data, MAP) {
  sim <- list()
  n <- numNodes(DAG)
  sim$n <- n
  sim$sampsize <- nrow(data)
  sim$DAG <- DAG
  sim$nedges <- sum(dag2adjacencymatrix(DAG))
  sim$i <- i

  sim$replicate <- i
  sim$ss <- sim$sampsize / sim$n

  sim$totaltime <- as.numeric(totaltime) * 60

  # True DAG
  sim$truescore <- DAGscore(n, myscore, dag2adjacencymatrix(DAG))

  # Iterative search
  sim$iterative_search <- list()
  sim$iterative_search$MAPscore <- iterative_search_res$max$score # should be separate
  sim$iterative_search$output <- iterations.check(iterative_search_res, DAG)
  sim$iterative_search$output <- cbind(sim$iterative_search$output, sim$iterative_search$output[, 2] / sim$nedges)
  colnames(sim$iterative_search$output)[6] <- "FPRn"
  nit <- nrow(sim$iterative_search$output)
  sim$iterative_search$SHDMAP <- sim$iterative_search$output[nit, 4]

  # DAG obtained from order MCMC with the space definced by the iterativeMCMCSearch
  sim$order_mcmc <- list()
  DAG05 <- dag.threshold(n, order_mcmc_res$chain$incidence, pbarrier = 0.5, pdag = FALSE, burnin = 0.5) # incidence is a chain of adjacency matrices
  if (is.DAG(DAG05)) {
    sim$order_mcmc$medianscore <- DAGscore(n, myscore, DAG05)
  } else {
    sim$order_mcmc$medianscore <- 10 # this is the "final MCMC" score
  }
  sim$order_mcmc$output <- sample.check(n, order_mcmc_res$chain$incidence, DAG, pdag = TRUE)
  sim$order_mcmc$output <- cbind(sim$order_mcmc$output, sim$order_mcmc$output[, 1] / sim$nedges, sim$order_mcmc$output[, 2] / sim$nedges)
  colnames(sim$order_mcmc$output)[c(5, 6)] <- c("TPR", "FPRn")
  sim$order_mcmc$SHDmdeian <- sim$order_mcmc$output[7, 3] #  TODO: bug? hardcoded?

  return(sim)
}

SummarizeOrderMCMCResults <- function(i, myscore, order_mcmc_res, DAG, totaltime, data, MAP) {
  sim <- list()
  n <- numNodes(DAG)
  sim$n <- n
  sim$sampsize <- nrow(data)
  sim$DAG <- DAG
  sim$nedges <- sum(dag2adjacencymatrix(DAG))
  sim$i <- i

  sim$replicate <- i
  sim$ss <- sim$sampsize / sim$n

  sim$totaltime <- as.numeric(totaltime) * 60

  # True DAG
  sim$truescore <- DAGscore(n, myscore, dag2adjacencymatrix(DAG))

  # DAG obtained from order MCMC with the space definced by the iterativeMCMCSearch
  sim$order_mcmc <- list()
  DAG05 <- dag.threshold(n, order_mcmc_res$chain$incidence, pbarrier = 0.5, pdag = FALSE, burnin = 0.5) # incidence is a chain of adjacency matrices
  if (is.DAG(DAG05)) {
    sim$order_mcmc$medianscore <- DAGscore(n, myscore, DAG05)
  } else {
    sim$order_mcmc$medianscore <- 10 # this is the "final MCMC" score
  }
  sim$order_mcmc$output <- sample.check(n, order_mcmc_res$chain$incidence, DAG, pdag = TRUE)
  sim$order_mcmc$output <- cbind(sim$order_mcmc$output, sim$order_mcmc$output[, 1] / sim$nedges, sim$order_mcmc$output[, 2] / sim$nedges)
  colnames(sim$order_mcmc$output)[c(5, 6)] <- c("TPR", "FPRn")
  sim$order_mcmc$SHDmdeian <- sim$order_mcmc$output[7, 3] #  TODO: bug? hardcoded?

  return(sim)
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

  DAG <- DAGs[[i]] # Should this be a sequence of DAGs / data? /Felix
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

  # Added
  sim$TABUiterativeMCMC <- cbind(sim$TABUiterativeMCMC, sim$TABUiterativeMCMC[, 2] / sim$nedges)
  colnames(sim$TABUiterativeMCMC)[6] <- "FPRn"
  sim$TABUfinalMCMC <- cbind(sim$TABUfinalMCMC, sim$TABUfinalMCMC[, 1] / sim$nedges, sim$TABUfinalMCMC[, 2] / sim$nedges)
  colnames(sim$TABUfinalMCMC)[c(5, 6)] <- c("TPR", "FPRn")

  nit <- nrow(sim$TABUiterativeMCMC)
  sim$SHDMAPtabu <- sim$TABUterativeMCMC[nit, 4]
  sim$SHDmediantabu <- sim$TABUfinalMCMC[7, 3]
  sim$TABUtotaltime <- as.numeric(sim$TABUtotaltime) * 60


  return(sim)
}
