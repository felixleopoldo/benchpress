## Simulate rblip
##
library(argparser)

library(RBGL)

source("lib/code_for_binary_simulations/algorithm_wrappers.R")

p <- arg_parser("A program for running gobnilp algorithm and save to file.")

p <- add_argument(p, "--filename", help = "output filename")
p <- add_argument(p, "--output_dir", help = "output dir", default = ".")
p <- add_argument(p, "--filename_dag", help = "DAGs filename") # This should not be here
p <- add_argument(p, "--filename_data", help = "Dataset filename")
p <- add_argument(p, "--seed", help = "Random seed", type = "numeric", default = 1)
p <- add_argument(p, "--palim", help = "Max number of parents", type = "numeric", default = 6)


argv <- parse_args(p)
print(argv)

directory <- argv$output_dir
filename <- file.path(argv$filename)
filename_dag <- argv$filename_dag
filename_data <- argv$filename_data
seed <- argv$seed
set.seed(seed)

dag <- readRDS(filename_dag)
data <- read.csv(filename_data, sep = " ")
res <- runGobnilp(filename_data, dag, palim = argv$palim)

write.csv(res, file = filename, row.names = FALSE)


