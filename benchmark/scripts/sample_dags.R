# Samples dags and saves to file
library(argparser)

source("lib/binarydatagen/generate_DAG.R")

p <- arg_parser("A program for generating a random directed acyclic graph.")

p <- add_argument(p, "--filename", help = "output filename", default = "dag.rds")
p <- add_argument(p, "--output_dir", help = "output dir", default = ".")
p <- add_argument(p, "--nodes", help = "Number of nodes", type = "numeric")
p <- add_argument(p, "--parents", help = "Average number of parents", type = "numeric")
p <- add_argument(p, "--seed", help = "Random seed", type = "numeric", default = 1)

# p <- add_argument(p, "filename", help = "output filename", default = "dag.rds")
# p <- add_argument(p, "output_dir", help = "output dir", default = ".")
# p <- add_argument(p, "nodes", help = "Number of nodes", type = "numeric")
# p <- add_argument(p, "parents", help = "Average number of parents", type = "numeric")
# p <- add_argument(p, "seed", help = "Random seed", type = "numeric", default = 1)
#
argv <- parse_args(p)

dir <- argv$output_dir

filename <- file.path(dir, argv$filename)

n <- argv$nodes
avParents <- argv$parents
seed_number <- argv$seed

DAG <- generateDAGMaxParents(n = n, d = avParents)

saveRDS(DAG, file = filename)

