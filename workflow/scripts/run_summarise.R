library(argparser)
library(BiDAG)
library(pcalg)
library(bnlearn)


### This function extracts directed edges from an EG
EGdedges <- function(incidence) {
  incidence*(1 - t(incidence))
}

### This function extracts the skeleton from an EG
EGskel <- function(incidence) {
  1*(incidence|t(incidence))
}

### This function compares an estimated EG to the true one

compareEGs <- function (estEG, trueEG) {
  estSkel <- EGskel(estEG) # estimated skeleton
  trueSkel <- EGskel(trueEG) # true skeleton
  P <- sum(trueSkel)/2 # number of positives
  diffSkel <- estSkel - trueSkel
  extra_edges <- which(diffSkel > 0) # edges in estimated but not true EG
  FP <- length(extra_edges)/2 # count to FPs
  estEG[extra_edges] <- 0 # remove them from further comparisons
  missing_edges <- which(diffSkel < 0) # edges in true but not estimated EG
  FN <- length(missing_edges)/2 # count to FNs
  trueEG[missing_edges] <- 0 # remove them from further comparisons
#  if (sum(EGskel(estEG) != EGskel(trueEG)) > 0){
#    print("Skeletons should match now!")
#  }
  # modified graphs have the same skeletons, so now just need to count mismatches
  mismatches <- 1*(estEG != trueEG)
  wrong_order <- sum(EGskel(mismatches))/2 # number of wrongly oriented edges
  FP <- FP + wrong_order/2 # include half in FP
  FN <- FN + wrong_order/2 # and half in FN
  SHD <- FP + FN # shd is the sum of errors
  TP <- P - FN # true positives are without false negatives
  # TPR, FPR_P, FPR_N
  if (P == 0) { # true graph is empty
    if (FP >= 0) {
      TPR <- 0
      FPR_P <- 1
    } else {
      TPR <- 1
      FPR_P <- 0
    }
  } else { # true graph is non-empty
    TPR <- TP/P
    FPR_P <- FP/P
  }
  compEGs <- c(TP, FP, SHD, TPR, FPR_P)
  names(compEGs) <- c("TP","FP", "SHD", "TPR", "FPR_P")
  return(compEGs)
}

#########
## this function takes as parameter the adjacency matrix of a pdag (or cpdag)
## and returns the pattern of this pdag in the Meek sense, that is,
## it returns the adjacency matrix of the graph with the same skeleton where the only oriented
## edges are the v-structures (can be easily modified to work for MAGs/PAGs)
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

p <- arg_parser("A program for summarising and save to file.")
p <- add_argument(p, "--adjmat_true", help = "True adjacency filename")
p <- add_argument(p, "--adjmat_est", help = "Estimated adjacency matrix filename")
p <- add_argument(p, "--filename_data", help = "Dataset filename")
p <- add_argument(p, "--filename", help = "Output filename")
p <- add_argument(p,
                  "--range_header_data",
                  help = "1 if the second row of the data indicates the variable ranges.",
                  default = 0)
p <- add_argument(p,
                  "--adjmat_header",
                  help = "1 if the first row in the estimated adjaceny matrix are the variable names.",
                  default = 1)

argv <- parse_args(p)

data <- NULL
if (argv$range_header_data == 1) {
  data <- read.csv(argv$filename_data, sep = " ") # this is gobnilp data
  data <- data[-1,]
} else {
  data <- read.csv(argv$filename_data) # this is different with gobnilp data
}

n <- dim(data)[2]

true_adjmat <- as.matrix(read.csv(argv$adjmat_true))

estimated_adjmat <- NULL
if (argv$adjmat_header == 1) {
  estimated_adjmat <- as.matrix(read.csv(argv$adjmat_est))
} else {
  estimated_adjmat <- as.matrix(read.table(argv$adjmat_est, header = FALSE))
}

# print(dim(data))
#print("True adjmat")
#print(true_adjmat)
#print("Estimated adjmat")
#print(estimated_adjmat)

rownames(true_adjmat) <- seq(n)
colnames(true_adjmat) <- seq(n)
rownames(estimated_adjmat) <- seq(n)
colnames(estimated_adjmat) <- seq(n)

true_patterngraph <- adjacency2dag(getPattern(true_adjmat))
estimated_patterngraph <- adjacency2dag(getPattern(estimated_adjmat))
true_nedges <- sum(getPattern(true_adjmat))

logscore <- 100

# Statistics on getPattern graph
compres <- compareDAGs(estimated_patterngraph, true_patterngraph)
names(compres) <- c("SHD", "TP", "FP")
true_nedges <- sum(getPattern(true_adjmat))

df <- data.frame(TPR_pattern = compres["TP"] / true_nedges, # should be for all times
                 FPRn_pattern = compres["FP"] / true_nedges,
                 logscore = logscore,
                 SHD_pattern = compres["SHD"])



# Essential graph (CPDAG)
# true_dag <- as(t(true_adjmat), "graphNEL") # TODO: should it be transpose here?
# estimated_dag <- as(t(estimated_adjmat), "graphNEL")

# cpdag_true <- pcalg::dag2cpdag(true_dag)
# cpdag_est <- pcalg::dag2cpdag(estimated_dag) # bug here
# cpdag_adjmat_true = as(cpdag_true, "matrix") != 0
# cpdag_adjmat_est = as(cpdag_est, "matrix") != 0

# compres <- compareEGs(cpdag_adjmat_est, cpdag_adjmat_true)

# df["TPR_cpdag"] = compres["TPR"]
# df["FPRn_cpdag"] = compres["FPR_P"]
# df["SHD_cpdag"] = compres["SHD"]


write.csv(df, file = argv$filename, row.names = FALSE, quote = FALSE)


# Compute number of correct Markov blankets

# Cannot convert graphnel to bn. These functions are for grain networks.
# true_dag_bn.fit <- as.bn.fit(true_dag)
# est_dag_bn.fit <- as.bn.fit(estimated_dag)
