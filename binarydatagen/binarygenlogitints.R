
generateDAG <- function(n, e) {
  # n is number of nodes
  # e is expected number of parents
  n_offdiag <- n*(n - 1)/2
  offdiag_vec <- rbinom(n_offdiag, 1, e*n/n_offdiag)
  
  DAG <- matrix(0, n, n)
  DAG[upper.tri(DAG)] <- offdiag_vec

  permy <- sample(1:n)
  
  DAG[permy, permy]
}

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
      p_local <- 1/(1 + exp(reg_local)) # sample and inverse logit transform
      binData[, ii] <- rbinom(N, 1, p_local)
    }
    if (lp == 1) {
      reg_local <- runif(1, -b_unif, b_unif) + 
        runif(1, min_unif, max_unif)*sample(c(-1, 1), 1)*binData[, parents]
      p_local <- 1/(1 + exp(reg_local)) # sample and inverse logit transform
      binData[, ii] <- rbinom(N, 1, p_local)
    }
    if (lp > 1) {
      x <- binData[, parents] # data, then add interactions and combine
      bin_with_ints <- rbind(t(x), apply(x, 1, combn, 2, prod)) # we transposed it
      n_terms <- nrow(bin_with_ints)
      signs <- sample(c(-1, 1), n_terms, replace = TRUE)
# in case we want to create signs which are more balanced
#      x <- rep(c(-1, 1), each = floor(n_terms/2))
#      signs[1:length(x)] <- x
#      signs <- sample(signs) # random order
      reg_local <- runif(1, -b_unif, b_unif) + 
        colSums(runif(n_terms, min_unif, max_unif)*signs*bin_with_ints)
      p_local <- 1/(1 + exp(reg_local)) # sample and inverse logit transform
      binData[, ii] <- rbinom(N, 1, p_local)
    }
    #print(p_local)
  }
  binData
}


library(BiDAG)

n <- 40
N <- 1e3 # need like 10k observations to get good graph!

set.seed(42)

trueDAG <- generateDAG(n, 2)

binData <- generateBinData(trueDAG, N)

scorepar <- scoreparameters(n, scoretype = "bde", data = binData, bdepar = list(chi = 1, edgepf = 1))

itMCMC <- iterativeMCMCsearch(n, scorepar)

itMCMC
DAGscore(n, scorepar, trueDAG)
# number of true edges
sum(trueDAG)

# check DAGs?

BiDAG::compareDAGs(BiDAG::adjacency2dag(itMCMC$max$DAG), BiDAG::adjacency2dag(trueDAG))

