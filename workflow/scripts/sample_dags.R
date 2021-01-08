# Samples dags and saves to file
library(argparser)
library(BiDAG)
library(gRbase)
source("resources/binarydatagen/generate_DAG.R")
source("resources/code_for_binary_simulations/make_name.R")
p <- arg_parser("A program for generating a random directed acyclic graph.")

p <- add_argument(p, "--filename", help = "output filename", default = "dag.rds")
p <- add_argument(p, "--nodes", help = "Number of nodes", type = "numeric")
p <- add_argument(p, "--parents", help = "Average number of parents", type = "numeric")
p <- add_argument(p, "--seed", help = "Random seed", type = "numeric", default = 1)

argv <- parse_args(p)

dir <- argv$output_dir

filename <- file.path(argv$filename)

n <- argv$nodes
avParents <- argv$parents
seed_number <- argv$seed
set.seed(seed_number)
DAG <- generateDAGMaxParents(n = n, d = avParents)

adjmat <- graphNEL2adjMAT(DAG)

#varnames <- varnames.make(n)
#rownames(adjmat) <- seq(n)
#colnames(adjmat) <- seq(n)


write.csv(adjmat, file = filename, quote = FALSE, row.names = FALSE)

