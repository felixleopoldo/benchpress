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
  N <- sum(1 - trueSkel) / 2 # number of negative
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
  # modified graphs have the same skeletons, so now just need to
  # count mismatches
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
      FPR <- FP / N
    } else {
      TPR <- 1
      FPR_P <- 0
      FPR <- 0
    }
  } else {
    # true graph is non-empty
    TPR <- TP / P
    FPR_P <- FP / P
    FPR <- FP / N
  }
  compEGs <- c(TP, FP, SHD, TPR, FPR_P, FPR)
  names(compEGs) <- c("TP", "FP", "SHD", "TPR", "FPR_P", "FPR")
  return(compEGs)
}

#########
## this function takes as parameter the adjacency matrix of a pdag (or cpdag)
## and returns the pattern of this pdag in the Meek sense, that is,
## it returns the adjacency matrix of the graph with the same
## skeleton where the only oriented
## edges are the v-structures (can be easily modified to work for MAGs/PAGs)
## this is from the PC-alg package.
getPattern <- function(amat) {

  ## makes the whole graph undirected
  amat <- t(amat)

  tmp <- amat + t(amat)
  tmp[tmp == 2] <- 1

  ## find all v-structures i -> k <- j s.t. i not adj to k
  ## and make only those edges directed
  for (i in 1:(length(tmp[1, ]) - 1)) {
    for (j in (i + 1):length(tmp[1, ])) {
      if ((amat[j, i] == 0) & (amat[i, j] == 0) & (i != j)) {
        ## if i no adjacent with j in G

        ## finds all k such that i -> k is in G
        possible.k <- which(amat[, i] != 0 & amat[i, ] == 0)

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
  }

  t(tmp)
}

### This function turns an adjacancy matrix incidence DAG
### into an adjacancy matric of the EG
DAG2EG <- function(incidence) {
  as(pcalg::dag2essgraph(as(incidence, "graphNEL")), "matrix")
}

p <- arg_parser("A program for summarising and save to file.")
p <- add_argument(p, "--adjmat_true", help = "True adjacency filename")
p <- add_argument(p, "--adjmat_est", help = "Estimated adjacency matrix")
p <- add_argument(p, "--filename", help = "Output filename")
argv <- parse_args(p)

benchmarks <- function(true_adjmat, estimated_adjmat) {
  skel_true <- (true_adjmat | t(true_adjmat)) * 1
  skel_est <- (estimated_adjmat | t(estimated_adjmat)) * 1
  n_nodes <- ncol(skel_true)

  ones <- matrix(1, n_nodes, n_nodes)
  diag(ones) <- 0


  TP <- sum(skel_true * skel_est) / 2
  TN <- sum((ones - skel_true) * (ones - skel_est)) / 2
  FP <- sum((ones - skel_true) * skel_est) / 2
  FN <- sum(skel_true * (ones - skel_est)) / 2

  n_edges <- sum(skel_true) / 2
  n_nonedges <- sum(ones - skel_true) / 2

  compres <- compareEGs(getPattern(estimated_adjmat), getPattern(true_adjmat))

  SHD_cpdag <- "None"

  graph_type <- "unknown"

  if (isSymmetric(unname(estimated_adjmat))) {
    graph_type <- "ug"
  }
  if (pcalg::isValidGraph(t(estimated_adjmat), type = "cpdag", verbose = FALSE)) {
    compres_cpdag <- BiDAG::compareDAGs(estimated_adjmat, true_adjmat, cpdag = TRUE)
    SHD_cpdag <- compres_cpdag["SHD"]
    graph_type <- "cpdag"
  } else if (pcalg::isValidGraph(t(estimated_adjmat),
    type = "dag",
    verbose = FALSE
  )) {
    compres_cpdag <- BiDAG::compareDAGs(estimated_adjmat, true_adjmat, cpdag = TRUE)
    SHD_cpdag <- compres_cpdag["SHD"]
    graph_type <- "dag"
  }
  df <- data.frame(
    TP_pattern = compres["TP"],
    FP_pattern = compres["FP"],
    FN_pattern = n_edges - compres["TP"], # shouldn't store simple calculations but anyway..
    TPR_pattern = compres["TPR"], 
    FPR_pattern = compres["FPR"],
    FPRn_pattern = compres["FPR_P"],
    SHD_pattern = compres["SHD"],
    SHD_cpdag = SHD_cpdag,
    FPR_skel = FP / n_edges,
    FNR_skel = FN / n_edges,
    TP_skel = TP,
    FN_skel = FN,
    FP_skel = FP,
    TN_skel = TN,
    n_nodes = n_nodes,
    true_n_edges_skel = n_edges,
    true_n_non_edges_skel = n_nonedges,
    graph_type = graph_type
  )
  return(df)
}

if (file.info(argv$adjmat_est)$size > 0) {
  true_adjmat <- as.matrix(read.csv(argv$adjmat_true, check.names = FALSE))
  estimated_adjmat <- as.matrix(read.csv(argv$adjmat_est, check.names = FALSE))
  df <- benchmarks(true_adjmat, estimated_adjmat)
} else {
  df <- data.frame(
    TP_pattern = "None",
    FP_pattern = "None",
    FN_pattern = "None",
    TPR_pattern = "None", # should be for all times
    FPR_pattern = "None",
    FPRn_pattern = "None",
    SHD_pattern = "None",
    SHD_cpdag = "None",
    FPR_skel = "None",
    FNR_skel = "None",
    TP_skel = "None",
    FN_skel = "None",
    FP_skel = "None",
    TN_skel = "None",
    n_nodes = "None",
    true_n_edges_skel = "None",
    true_n_non_edges_skel = "None",
    graph_type = "None"
  )
}

write.csv(df, file = argv$filename, row.names = FALSE, quote = FALSE)
