## Simulate rblip

library(argparser)
library(RBGL)
library(r.blip)
#source("lib/code_for_binary_simulations/rblip.R")
source("resources/code_for_binary_simulations/df_fns.R")
#source("lib/code_for_binary_simulations/algorithm_wrappers.R")
source("resources/code_for_binary_simulations/make_var_names.R")
source("resources/code_for_binary_simulations/bnlearn_help_fns.R")

p <- arg_parser("A program for running r.blip and save to file.")

p <- add_argument(p, "--output_dir", help = "output dir", default = ".")
p <- add_argument(p, "--filename", help = "Output filename")
p <- add_argument(p, "--filename_data", help = "Dataset filename")
p <- add_argument(p, "--seed", help = "Random seed", type = "numeric", default = 1)
p <- add_argument(p, "--time", help = "Blip max time", type = "numeric")
p <- add_argument(p, "--scorer.method", help = "scorer.method", default = "is")
p <- add_argument(p, "--solver.method", help = "solver.method", default = "winasobs")
p <- add_argument(p, "--indeg", help = "in degree", type = "numeric", default = 5)
p <- add_argument(p, "--cores", help = "cores", type = "numeric", default = 1)
p <- add_argument(p, "--allocated", help = "allocated", type = "numeric", default = 80)
p <- add_argument(p, "--scorefunction", help = "score function", default = "bic")
p <- add_argument(p, "--alpha", help = "alpha", type = "numeric", default = 1.0)
p <- add_argument(p, "--verbose", help = "see r.blip doc", type = "numeric", default = 0)

argv <- parse_args(p)

directory <- argv$output_dir
dir.create(directory, showWarnings=FALSE)
filename <- file.path(argv$filename)
filename_data <- argv$filename_data

data <- read.csv(filename_data, sep=",")
data <- data[-1,] # Remove range header
data_dim <- dim(data)[2]

seed <- argv$seed
set.seed(seed)

varnames <- varnames.make(data_dim)
datadf <- matrixToDataframe(data, varnames = varnames)

blipfit <- blip.learn(datadf,
                        scorer.method = argv$scorer.method,
                        solver.method = argv$solver.method,
                        indeg = argv$indeg,
                        cores = argv$cores,
                        time = argv$time,
                        allocated = argv$allocated,
                        scorefunction = argv$scorefunction,
                        alpha = argv$alpha,
                        verbose = argv$verbose)

blipadj <- bnfit2matrix(blipfit)
blipadj <- rearrangeMatrix(blipadj, varnames)
colnames(blipadj) <- names(data)
write.csv(blipadj, file = filename, row.names = FALSE, quote = FALSE)