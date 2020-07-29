library(argparser)
library(BiDAG)
library(pcalg)

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

p <- arg_parser("A program for running iterativeMCMC and save to file.")
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

#p <- add_argument(p, "--score_type", help = "bde/..")
p <- add_argument(p, "--bdecatpar_chi", help = "bde parameter", type = "numeric", default = 1)
p <- add_argument(p, "--bdecatpar_edgepf", help = "bde parameter", type = "numeric", default = 1)

argv <- parse_args(p)

#print(argv)

data <- NULL
if (argv$range_header_data == 1) {
  data <- read.csv(argv$filename_data, sep = " ") # this is gobnilp data
} else {
  data <- read.csv(argv$filename_data) # this is different with gobnilp data
}

n <- dim(data)[2]

true_adjmat <- as.matrix(read.csv(argv$adjmat_true))
#estimated_adjmat <- as.matrix(read.csv(argv$adjmat_est))

estimated_adjmat <- NULL
if (argv$adjmat_header == 1) {
  estimated_adjmat <- as.matrix(read.csv(argv$adjmat_est))
} else {
  estimated_adjmat <- as.matrix(read.table(argv$adjmat_est, header = FALSE))
}

# print(dim(data))
# print("True adjmat")
# print(true_adjmat)
# print("Estimated adjmat")
# print(estimated_adjmat)

rownames(true_adjmat) <- seq(n)
colnames(true_adjmat) <- seq(n)

rownames(estimated_adjmat) <- seq(n)
colnames(estimated_adjmat) <- seq(n)

true_dag <- adjacency2dag(true_adjmat)
estimated_dag <- adjacency2dag(estimated_adjmat)
true_nedges <- sum(true_adjmat)

true_cpdag <- pcalg::dag2cpdag(true_dag)
estimated_cpdag <- pcalg::dag2cpdag(estimated_dag)

true_patterngraph <- adjacency2dag(getPattern(true_adjmat))
estimated_patterngraph <- adjacency2dag(getPattern(estimated_adjmat))

true_nedges <- sum(getPattern(true_adjmat))

#compres <- compareDAGs(estimated_cpdag, true_cpdag)


# Scoring DAG
myscore_tmp <- scoreparameters(ncol(data), "bdecat", data,
                              bdecatpar = list(chi = argv$bdecatpar_chi,
                                               edgepf = argv$bdecatpar_edgepf))

logscore <- DAGscore(ncol(data), myscore_tmp, estimated_adjmat) # this was bnscore, dont know why...

# Statistics on getPattern graph
compres <- compareDAGs(estimated_patterngraph, true_patterngraph)
names(compres) <- c("SHD", "TP", "FP")
true_nedges <- sum(getPattern(true_adjmat))

#res <- list()
df <- data.frame(TPR = compres["TP"] / true_nedges, # should be for all times
                            FPRn = compres["FP"] / true_nedges,
                            logscore = logscore,
                            SHD = compres["SHD"])

# Statistics on getPattern graph
compres <- compareDAGs(estimated_cpdag, true_cpdag)
names(compres) <- c("SHD", "TP", "FP")
df$TPR_cpdag <- compres["TP"] / true_nedges, # should be for all times





write.csv(df, file = argv$filename, row.names = FALSE, quote = FALSE)