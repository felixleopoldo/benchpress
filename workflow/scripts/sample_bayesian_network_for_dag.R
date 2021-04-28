# Samples dags and saves to file
library(argparser)

source("resources/binarydatagen/generatebinaryBNf.r")

p <- arg_parser("A program for generating a random directed acyclig graph.")

p <- add_argument(p, "--filename", help = "output filename")
p <- add_argument(p, "--filename_dag", help = "Filename for DAG")
p <- add_argument(p, "--seed", help = "Random seed", type = "numeric")
p <- add_argument(p, "--min", help = "Random seed", type = "numeric")
p <- add_argument(p, "--max", help = "Random seed", type = "numeric")

argv <- parse_args(p)

filename <- file.path(argv$filename)
seed_number <- argv$seed
filename_dag <- argv$filename_dag

adjmat <- read.csv(filename_dag, check.names=FALSE)
n <- dim(adjmat)[2]
rownames(adjmat) <- seq(n)
colnames(adjmat) <- seq(n)

DAG <- adjacency2dag(adjmat)
set.seed(seed_number)
binBN <- generateBinaryBN(DAG, c(argv$min, argv$max))

saveRDS(binBN, file = filename)

