## Simulate rblip
##
library(argparser)
library(RBGL)
library(reticulate)

source("lib/code_for_binary_simulations/algorithm_wrappers.R")
numeric_labels <- function(gnel_dag) {
  ## The node labels from gobnilp are sorted alphabetically
  ## which is not desired. The they are sorted by the in value en the string.
  ## e.g. "1","2","13" and not "1", "13", "2"
  nodelist <- c()
  for (i in seq(length(nodes(gnel_dag)))) {
    nodelist <- c(nodelist, toString(i))
  }
  gR <- graphNEL(nodes = nodelist, edgemode = "directed")
  edL <- vector("list", length = length(nodes(gnel_dag)))
  for (node in ls(edges(gnel_dag))) {
    for (child in edges(gnel_dag)[[node]]) {
      gR <- addEdge(from = node, to = child, gR)
    }
  }
  return(gR)
}

p <- arg_parser("A program for running gobnilp algorithm and save to file.")

p <- add_argument(p, "--filename", help = "output filename")
p <- add_argument(p, "--output_dir", help = "output dir", default = ".")
p <- add_argument(p, "--filename_data", help = "Dataset filename")
p <- add_argument(p, "--seed", help = "Random seed", type = "numeric", default = 1)
p <- add_argument(p, "--palim", help = "Max number of parents", type = "numeric", default = 6)


argv <- parse_args(p)

directory <- argv$output_dir
filename <- file.path(argv$filename)
#filename_dag <- argv$filename_dag
filename_data <- argv$filename_data
seed <- argv$seed
set.seed(seed)

#dag <- readRDS(filename_dag)
#data <- read.csv(filename_data, sep = " ")
#data <- read.csv(filename_data, sep = ",")
#res <- runGobnilp(filename_data, dag, palim = argv$palim)
gob <- import("pygobnilp.gobnilp")
m <- gob$Gobnilp()


m$learn(filename_data,
          plot = FALSE,
          palim = argv$palim) # score=BGeu ? 

## convert to graphneldag
graphstring = m$learned_bn$bnlearn_modelstring()
gnel_dag <- as.graphNEL(model2network(graphstring))
gnel_dag <- numeric_labels(gnel_dag) # Corrects the node labels
adjmat <- as(gnel_dag, "matrix")

#print(adjmat)

write.csv(adjmat, file = filename, row.names = FALSE, quote = FALSE)

