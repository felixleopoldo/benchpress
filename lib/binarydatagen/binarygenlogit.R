library(BiDAG)
source("lib/binarydatagen/generate_DAG.R")


#' generateBinData
#'
#' Generates the probabilities as a linear combination of the parents,
#' then inverse logit transforming.
#'
#' @param DAG
#' @param N
#'
#' @return
#' @export
#'
#' @examples
generateBinData <- function(DAG, N) {
  b_unif <- 1 # for the starting probability
  min_unif <- 0.5 # when the parent is on range
  max_unif <- 2
  n <- nrow(DAG) # number of nodes
  # N is number of observations
  binData <- matrix(NA, N, n)
  # get topological order from top (normally from bottom)
  permy <- rev(BiDAG:::DAGtopartition(n, DAG)$permy)
  for (ii in permy) {
    parents <- which(DAG[, ii] == 1)
    lp <- length(parents)
    if (lp == 0) {
      reg_local <- runif(1, -b_unif, b_unif)
      p_local <- 1 / (1 + exp(reg_local)) # sample and inverse logit transform
      binData[, ii] <- rbinom(N, 1, p_local)
    }
    if (lp == 1) {
      reg_local <- runif(1, -b_unif, b_unif) +
        runif(1, min_unif, max_unif) * sample(c(-1, 1), 1) * binData[, parents]
      p_local <- 1 / (1 + exp(reg_local)) # sample and inverse logit transform
      binData[, ii] <- rbinom(N, 1, p_local)
    }
    if (lp > 1) {
      reg_local <- runif(1, -b_unif, b_unif) +
        colSums(runif(lp, min_unif, max_unif) * sample(c(-1, 1), lp, replace = TRUE) * t(binData[, parents]))
      p_local <- 1 / (1 + exp(reg_local)) # sample and inverse logit transform
      binData[, ii] <- rbinom(N, 1, p_local)
    }
    # print(p_local)
  }
  return(binData)
}


