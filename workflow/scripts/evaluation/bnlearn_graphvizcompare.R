library(argparser)
library(BiDAG)
library(pcalg)
library(bnlearn)

### This function extracts directed edges from an EG
EGdedges <- function(incidence) {
  incidence * (1 - t(incidence))
}

### This function extracts the skeleton from an EG
EGskel <- function(incidence) {
  1 * (incidence | t(incidence))
}

### This function compares an estimated EG to the true one
compareEGs <- function(estEG, trueEG) {
  estSkel <- EGskel(estEG) # estimated skeleton
  trueSkel <- EGskel(trueEG) # true skeleton
  P <- sum(trueSkel) / 2 # number of positives
  diffSkel <- estSkel - trueSkel
  extra_edges <- which(diffSkel > 0) # edges in estimated but not true EG
  FP <- length(extra_edges) / 2 # count to FPs
  estEG[extra_edges] <- 0 # remove them from further comparisons
  missing_edges <- which(diffSkel < 0) # edges in true but not estimated EG
  FN <- length(missing_edges) / 2 # count to FNs
  trueEG[missing_edges] <- 0 # remove them from further comparisons
  #  if (sum(EGskel(estEG) != EGskel(trueEG)) > 0){
  #    print("Skeletons should match now!")
  #  }
  # modified graphs have the same skeletons, so now just need to count mismatches
  mismatches <- 1 * (estEG != trueEG)
  wrong_order <- sum(EGskel(mismatches)) / 2 # number of wrongly oriented edges
  FP <- FP + wrong_order / 2 # include half in FP
  FN <- FN + wrong_order / 2 # and half in FN
  SHD <- FP + FN # shd is the sum of errors
  TP <- P - FN # true positives are without false negatives
  # TPR, FPR_P, FPR_N
  if (P == 0) {
    # true graph is empty
    if (FP >= 0) {
      TPR <- 0
      FPR_P <- 1
    } else {
      TPR <- 1
      FPR_P <- 0
    }
  } else {
    # true graph is non-empty
    TPR <- TP / P
    FPR_P <- FP / P
  }
  compEGs <- c(TP, FP, SHD, TPR, FPR_P)
  names(compEGs) <- c("TP", "FP", "SHD", "TPR", "FPR_P")
  return(compEGs)
}

#########
## this function takes as parameter the adjacency matrix of a pdag (or cpdag)
## and returns the pattern of this pdag in the Meek sense, that is,
## it returns the adjacency matrix of the graph with the same skeleton where the only oriented
## edges are the v-structures (can be easily modified to work for MAGs/PAGs)
## this is from the PC-alg package.
getPattern <- function(amat) {

  ## makes the whole graph undirected
  amat <- t(amat)

  tmp <- amat + t(amat)
  tmp[tmp == 2] <- 1

  ## find all v-structures i -> k <- j s.t. i not adj to k
  ## and make only those edges directed
  for (i in 1:(length(tmp[1, ]) - 1))
    for (j in (i + 1):length(tmp[1, ])) {
      if ((amat[j, i] == 0) & (amat[i, j] == 0) & (i != j)) {
        ## if i no adjacent with j in G

        possible.k <- which(amat[, i] != 0 & amat[i,] == 0) ## finds all k such that i -> k is in G

        if (length(possible.k) != 0) {
          ## if there are any such k's then check whether j -> k for any of them
          for (k in 1:length(possible.k)) {
            if ((amat[possible.k[k], j] == 1) & (amat[j, possible.k[k]] == 0)) {
              ## if j -> k add the v-struc orientation to tmp
              tmp[i, possible.k[k]] <- 0
              tmp[j, possible.k[k]] <- 0
            }
          }
        }
      }
    }

    t(tmp)
}

### This function turns an adjacancy matrix incidence DAG into an adjacancy matric of the EG
DAG2EG <- function(incidence) {
  as(dag2essgraph(as(incidence, "graphNEL")), "matrix")
}

myFun <- function(n = 5000) {
  a <- do.call(paste0, replicate(5, sample(LETTERS, n, TRUE), FALSE))
  paste0(a, sprintf("%04d", sample(9999, n, TRUE)), sample(LETTERS, n, TRUE))
}

benchmarks <- function(true_adjmat, estimated_adjmat){

    if (isSymmetric(estimated_adjmat) || isValidGraph(estimated_adjmat, type = "dag", verbose = FALSE) || isValidGraph(estimated_adjmat, type = "cpdag", verbose = FALSE)) {
       
        pattern_true = getPattern(true_adjmat)
        pattern_true_gnel = as(pattern_true, "graphNEL") ## convert to graph
        pattern_true_bn = as.bn(pattern_true_gnel)

        pattern_estimated = getPattern(estimated_adjmat) # already transposed here?
        pattern_estimated_gnel = as(pattern_estimated, "graphNEL") ## convert to graph.
        pattern_estimated_bn = as.bn(pattern_estimated_gnel)

        filename <- myFun(n=1)
        filename <- filename[1]        
        
        # true_graphnel <- as(t(true_adjmat), "graphNEL") ## convert to graph
        # true_cpdag <- dag2cpdag(true_graphnel)
        # true_cpdag_bn <- as.bn(true_cpdag) ## convert to graph
       
        # estimated_graphnel <- as(t(estimated_adjmat), "graphNEL") ## convert to graph
        # estimated_cpdag <- dag2cpdag(estimated_graphnel)
        # estimated_cpdag_bn <- as.bn(estimated_cpdag) ## convert to graph

        pdf(file=filename)
        graphviz.compare(pattern_true_bn, pattern_estimated_bn, layout="dot", 
                         main=c("True pattern graph","Estimated pattern graph"))
        dev.off()
        file.copy(filename, snakemake@output[["filename"]])
        unlink(filename)
    } else {
        file.create(snakemake@output[["filename"]])
    }
}

if (file.info(snakemake@input[["adjmat_est"]])$size > 0) {
    true_adjmat <- as.matrix(read.csv(snakemake@input[["adjmat_true"]], check.names=FALSE))
    estimated_adjmat <- as.matrix(read.csv(snakemake@input[["adjmat_est"]], check.names=FALSE))

    benchmarks(true_adjmat, estimated_adjmat)
} else {
    file.create(snakemake@output[["filename"]])
}

