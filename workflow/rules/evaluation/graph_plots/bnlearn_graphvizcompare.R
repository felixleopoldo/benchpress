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

#########
## this function takes as parameter the adjacency matrix of a pdag (or cpdag)
## and returns the pattern of this pdag in the Meek sense, that is,
## it returns the adjacency matrix of the graph with the
## same skeleton where the only oriented
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
##  into an adjacancy matric of the EG
DAG2EG <- function(incidence) {
  as(dag2essgraph(as(incidence, "graphNEL")), "matrix")
}

# This is a bad hack to create tmp files with unique names
# that are not too long for pdf.
myFun <- function(n = 5000) {
  a <- do.call(paste0, replicate(5, sample(LETTERS, n, TRUE), FALSE))
  paste0(a, sprintf("%04d", sample(9999, n, TRUE)), sample(LETTERS, n, TRUE))
}

benchmarks <- function(true_adjmat, estimated_adjmat) {
  if (isSymmetric(unname(estimated_adjmat)) ||
    isValidGraph(estimated_adjmat, type = "dag", verbose = FALSE) ||
    isValidGraph(estimated_adjmat, type = "cpdag", verbose = FALSE)) {
    pattern_true <- getPattern(true_adjmat)
    pattern_true_gnel <- as(pattern_true, "graphNEL") ## convert to graph
    pattern_true_bn <- as.bn(pattern_true_gnel)

    # already transposed here?
    pattern_estimated <- getPattern(estimated_adjmat)
    # convert to graph.
    pattern_estimated_gnel <- as(pattern_estimated, "graphNEL")
    pattern_estimated_bn <- as.bn(pattern_estimated_gnel)
    # Since pdf seems to have trouble with long filenames
    filename <- myFun(n = 1)
    filename <- paste(filename[1], ".pdf", sep = "")

    
    pdf(file = filename)
    
    graphviz.compare(pattern_true_bn, pattern_estimated_bn,
      layout = "dot",
      main = c(
        paste("True pattern graph", sep = ""),
        paste("Estimated pattern graph (correct=black, incorrect=red, ",
          "missing=blue)\nAlgorithm: (see adjmat plot with the same number)",
          sep = ""
        )
      )
    )
    dev.off()
    file.copy(filename, snakemake@output[["filename"]])
    unlink(filename)
  } else {
    file.create(snakemake@output[["filename"]])
  }
  
}

if (file.info(snakemake@input[["adjmat_est"]])$size > 0) {
  true_adjmat <- as.matrix(read.csv(snakemake@input[["adjmat_true"]],
    check.names = FALSE
  ))
  estimated_adjmat <- as.matrix(read.csv(snakemake@input[["adjmat_est"]],
    check.names = FALSE
  ))

  silent <- benchmarks(true_adjmat, estimated_adjmat)
} else {
  file.create(snakemake@output[["filename"]])
}
