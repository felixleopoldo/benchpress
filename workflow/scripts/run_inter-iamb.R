library(argparser)
library(pcalg)
library(bnlearn)
library(RBGL)

source("resources/code_for_binary_simulations/make_var_names.R")

p <- arg_parser("A program for running Inter-IAMB algorithm and save to file.")

p <- add_argument(p, "--filename", help = "output filename")
p <- add_argument(p, "--output_dir", help = "output dir", default = ".")
p <- add_argument(p, "--filename_data", help = "Dataset filename")
p <- add_argument(p, "--seed", help = "Random seed", type = "numeric", default = 1)
p <- add_argument(p, "--alpha", help = "Parameter", type="numeric")

argv <- parse_args(p)

directory <- argv$output_dir
filename <- file.path(argv$filename)
filename_data <- argv$filename_data
seed <- argv$seed

data <- read.csv(filename_data, sep=" ")
data <- data[-1,] # Remove range header
set.seed(seed)

datanew <- matrixToDataframe(data, names(data))

output <- inter.iamb(datanew, alpha=argv$alpha)
## convert to graphneldag
gnel_dag <- as.graphNEL(output)

adjmat <- as(gnel_dag, "matrix")
colnames(adjmat) <- names(data)

write.csv(adjmat, file = filename, row.names = FALSE, quote = FALSE)

