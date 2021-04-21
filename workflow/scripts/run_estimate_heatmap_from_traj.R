library(argparser)
library(rjson)

p <- arg_parser("A program for estimating a graphs from a trajectory of adjacencymatrices by threholding.")
p <- add_argument(p, "--filename", help = "Filename")
p <- add_argument(p, "--adjvectraj", help = "Trajactory of flattened adjacency matrices.", default = ".")
p <- add_argument(p, "--tosymmetric", help = "1/0 ", default=0, type="numeric")

argv <- parse_args(p)

print(argv)
filename <- file.path(argv$filename)

adjvectraj <- fromJSON(file = argv$adjvectraj)

p <- sqrt(length(adjvectraj[[1]]))
adjmat_est <- matrix(0,
                     nrow = p,
                     ncol = p)

#adjmats <- list()
i <- 0
for (adjvec in adjvectraj) {
  #print(sqrt(length(adjvec)))
  adjmat <- matrix(data = adjvec, 
                   nrow = p,
                   ncol = p)

  # This operates on the skeleton instead
  if(argv$tosymmetric == 1){
      adjmat <- adjmat | t(adjmat)
  }

  adjmat_est <- adjmat_est + adjmat
  i <- i + 1
}

#print(adjmat_est)
heatmap <- (adjmat_est / i) * 1

#print(argv$threshold)
#print(adjmat_est)
write.csv(heatmap, file = argv$filename, row.names = FALSE, quote = FALSE)

