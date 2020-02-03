# Samples dags and saves to file
library(argparser)

source("lib/binarydatagen/generate_DAG.R")

p <- arg_parser("A program for generating a random directed acyclig graph.")

p <- add_argument(p, "--filename", help = "output filename", default = "dags")
p <- add_argument(p, "--output_dir", help = "output dir", default = ".")
p <- add_argument(p, "--nodes", help = "Number of nodes", type = "numeric")
p <- add_argument(p, "--parents", help = "Average numer of parents", type = "numeric")
p <- add_argument(p, "--samples", help = "Number of DAGs to be generated", type = "numeric")
p <- add_argument(p, "--seed", help = "Random seed", type = "numeric")

argv <- parse_args(p)

dir <- argv$output_dir

filename <- file.path(dir, argv$filename)

n_datasets <- argv$samples
DAGs <- list()
n <- argv$nodes
avParents <- argv$parents
seed_number <- argv$seed

for (i in seq(n_datasets)) {
  DAGs[[i]] <- generateDAGMaxParents(n = n, d = avParents)
}

saveRDS(DAGs, file = filename)

