# Samples dags and saves to file
library(argparser)

source("lib/binarydatagen/generatebinaryBNf.r")

p <- arg_parser("A program for generating a random directed acyclig graph.")

p <- add_argument(p, "--filename", help = "output filename", default = "bn.rds")
p <- add_argument(p, "--filename_dag", help = "Filename for DAG", default = "dag.rds")
p <- add_argument(p, "--seed", help = "Random seed", type = "numeric", default = 1)

argv <- parse_args(p)


filename <- file.path(argv$filename)
seed_number <- argv$seed
filename_dag <- argv$filename_dag

DAG <- readRDS(filename_dag)

set.seed(seed_number)
binBN <- generateBinaryBN(DAG, c(0.1, 0.9))
saveRDS(binBN, file = filename)

