library(BiDAG)
source("lib/binarydatagen/generate_DAG.R")

SampleBinaryVec <- function(theta, vecSize){
  binarySample <- stats::rbinom(vecSize, 1, theta)
  return(binarySample)
}

BinarySampleFromDAGcore <- function(j, parentNodes, n, DAGparams, binarySample){
  # sample one variable for a set of binary vectors from a DAG with parameters

  sampleNode <- rep(NA, nrow(binarySample)) # store the sampled values

  lp <- length(parentNodes) # number of parents
  noParams <- 2^lp # number of binary states of the parents

  switch(as.character(lp),
         "0" = {# no parents
           theta <- DAGparams$pmeans[[j]] # the probability of each state
           sampleNode <- SampleBinaryVec(theta, nrow(binarySample))
         },
         "1" = {# one parent
           summysfull <- binarySample[, parentNodes]

           for (i in 1:noParams - 1) {
             theta <- DAGparams$pmeans[[j]][i + 1] # the probability of each state
             toScore <- which(summysfull == i)
             sampleNode[toScore] <- SampleBinaryVec(theta, length(toScore))
           }
         },
         {# more parents
           summysfull <- colSums(2^(c(0:(lp - 1)))*t(binarySample[, parentNodes]))

           Ns <- tabulate(summysfull + 1,noParams) # can use tabulate instead of collectC, but we need to add one
           tempScoreVec <- rep(NA, length(summysfull))
           localCounter <- 0

           for (i in 1:noParams) { # we run over the data size once
             if (Ns[i] > 0) { # only if there are states to consider
               theta <- DAGparams$pmeans[[j]][i] # the probability of each state
               tempScoreVec[(localCounter + 1):(localCounter + Ns[i])] <- SampleBinaryVec(theta, Ns[i])
               localCounter <- localCounter + Ns[i]
             }
           }
           sampleNode <- tempScoreVec[rank(summysfull, ties.method = "first")] # use the rank function to map scores to entries
         }
  )

  return(sampleNode)
}

DAGparameters <- function(incidence) {
  # add parameters to an incidence matrix

  n <- nrow(incidence)
  allpmeans <- vector("list", n)

  for (j in 1:n) {
    parentNodes <- which(incidence[, j] == 1)
    allpmeans[[j]] <- runif(2^length(parentNodes))
  }

  posteriorParams <- list()
  posteriorParams$DAG <- incidence
  posteriorParams$pmeans <- allpmeans

  return(posteriorParams)
}

#' BinarySampleFromDAG
#'
#' Generates a uniform probability for each parent state
#' independently (like the BDe score imagines).
#' @param DAGparams
#' @param sampleSize
#'
#' @return
#' @export
#'
#' @examples
BinarySampleFromDAG <- function(DAGparams, sampleSize){
  # sample a set of binary vectors from a DAG with parameters
  n <- nrow(DAGparams$DAG)
  binarySample <- matrix(NA, sampleSize, n)
  nodeOrder <- BiDAG:::DAGtopartition(n, DAGparams$DAG)$permy # get topological order

  for (j in rev(nodeOrder)) { # start with outpoints etc
    parentNodes <- which(DAGparams$DAG[, j] == 1)
    binarySample[, j] <- BinarySampleFromDAGcore(j, parentNodes, n, DAGparams, binarySample)
  }

  return(binarySample)
}


