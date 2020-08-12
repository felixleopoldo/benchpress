library(argparser)
library(rjson)

p <- arg_parser("A program for estimating a graphs from a trajectory of adjacencymatrices by threholding.")
p <- add_argument(p, "--filename", help = "Filename")
p <- add_argument(p, "--adjvectraj", help = "Trajactory of flattened adjacency matrices.", default = ".")
p <- add_argument(p, "--threshold", help = "Threshold", type = "numeric", default = 0.5)

argv <- parse_args(p)

filename <- file.path(argv$filename)

adjvectraj <- fromJSON(file = argv$adjvectraj)

p <- sqrt(length(adjvectraj[[1]]))
adjmat_est <- matrix(0,
                     nrow = p,
                     ncol = p)

adjmats <- list()
i <- 1
for (adjvec in adjvectraj) {
  #print(sqrt(length(adjvec)))
  adjmat <- matrix(data = adjvec, nrow = p,
                    ncol = p)
  adjmats[[i]] <- adjmat

  adjmat_est <- adjmat_est + adjmat
  i <- i + 1
}

#print(adjmat_est)
adjmat_est <- ((adjmat_est / i) > argv$threshold) * 1

#print(argv$threshold)
#print(adjmat_est)
write.csv(adjmat_est, file = argv$filename, row.names = FALSE, quote = FALSE)

