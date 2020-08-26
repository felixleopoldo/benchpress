## Simulate 
library(argparser)
library(rcausal)

TetradGetAdjmat <- function(tetradrunner) {
  p <- length(tetradrunner$nodes)
  adjmat <- matrix(0, p, p)
  for (e in edges) {
    edgevec <- unlist(strsplit(e, " "))
    i <- match(edgevec[1], tetradrunner$nodes)
    j <- match(edgevec[3], tetradrunner$nodes)
    if (edgevec[2] == '---') {
      edge <- c(edgevec[1], edgevec[3])
      adjmat[i, j] <- 1
      adjmat[j, i] <- 1
    } else if (edgevec[2] == "-->") {
      adjmat[i, j] <- 1
    }
  }
  return(adjmat)
}

p <- arg_parser("A program for running fast greedy equivalence sarch (FGES) and save the adjacenty matrix to file.")

p <- add_argument(p, "--output_dir", help = "output dir", default = ".")
p <- add_argument(p, "--filename", help = "Filename")
p <- add_argument(p, "--filename_data", help = "Dataset filename")
p <- add_argument(p, "--seed", help = "Random seed", type = "numeric", default = 1)
#p <- add_argument(p, "--score_type", help = "bde/..")
#p <- add_argument(p, "--bdecatpar_chi", help = "bde parameter", type = "numeric", default = 1)
#p <- add_argument(p, "--bdecatpar_edgepf", help = "bde parameter", type = "numeric", default = 1)
p <- add_argument(p, "--faithfulnessAssumed", help = "parameter", type = "numeric", default = 1)
#p <- add_argument(p, "--maxDegree", help = "parameter", type = "numeric", default = -1)

argv <- parse_args(p)

directory <- argv$output_dir
filename <- file.path(argv$filename)
filename_data <- argv$filename_data
seed <- argv$seed

set.seed(seed)
mydata <- read.csv(filename_data, sep=" ")
mydata <- mydata[-1,] # Remove range header

# fGES
tetradrunner <- tetradrunner(algoId = 'fges',
                             df = mydata,
                             scoreId = 'bdeu-score',
                             dataType = 'discrete',
                             faithfulnessAssumed = argv$faithfulnessAssumed && TRUE,
                             maxDegree = -1, #argv$maxDegree,
                             verbose = FALSE)
edges <- tetradrunner$edges

adjmat <- TetradGetAdjmat(tetradrunner)
write.csv(adjmat, file = filename, row.names = FALSE, quote = FALSE)
