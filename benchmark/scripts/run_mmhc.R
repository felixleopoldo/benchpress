## Simulate rblip
##
library(argparser)
library(pcalg)
library(RBGL)

source("lib/code_for_binary_simulations/algorithm_wrappers.R")

p <- arg_parser("A program for running Max-Min hill-climbing algorithm and save to file.")

p <- add_argument(p, "--filename", help = "output filename")
p <- add_argument(p, "--output_dir", help = "output dir", default = ".")
p <- add_argument(p, "--filename_data", help = "Dataset filename")
p <- add_argument(p, "--seed", help = "Random seed", type = "numeric", default = 1)
p <- add_argument(p, "--alpha", help = "Alpha parameter", type = "numeric")

argv <- parse_args(p)

directory <- argv$output_dir
filename <- file.path(argv$filename)
filename_data <- argv$filename_data
seed <- argv$seed
alpha <- argv$alpha
data <- read.csv(filename_data)

set.seed(seed)

datanew <- matrixToDataframe(data, names(data))
mmoutput <- mmhc(datanew, restrict.args = list(alpha = argv$alpha))
## convert to graphneldag
gnel_dag <- as.graphNEL(mmoutput)

adjmat <- as(gnel_dag, "matrix")

write.csv(adjmat, file = filename, row.names = FALSE, quote = FALSE)


#write.csv(res, file = filename, row.names = FALSE)

# Instead of having explicit parameters in the filenames, ids should be taken from a database.


# pcalg input, orientation step, sum undirected from mcmc
# coult set alpha = 1 so all are rejected

# in the bidag package, takes a chain adds.. or so. flag skeleton.. 
# dag.threshold, instead of dag or cpdag, take dag transpose

# average skeleton and direct it using pcalg
