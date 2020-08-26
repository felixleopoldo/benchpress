## Simulate rblip
##
library(argparser)
library(RBGL)
library(pcalg)
source("lib/code_for_binary_simulations/algorithm_wrappers.R")
source("lib/code_for_binary_simulations/bnlearn_help_fns.R")
source("lib/code_for_binary_simulations/make_name.R")


p <- arg_parser("A program for running PC algorithm and save to file.")
p <- add_argument(p, "--filename", help = "output filename")
p <- add_argument(p, "--output_dir", help = "output dir", default = ".")
#p <- add_argument(p, "--filename_dag", help = "DAGs filename") # This should not be here
p <- add_argument(p, "--filename_data", help = "Dataset filename")
p <- add_argument(p, "--seed", help = "Random seed", type = "numeric", default = 1)
p <- add_argument(p, "--alpha", help = "Alpha parameter", type = "numeric")

argv <- parse_args(p)

directory <- argv$output_dir
filename <- file.path(argv$filename)
#filename_dag <- argv$filename_dag
filename_data <- argv$filename_data
seed <- argv$seed
alpha <- argv$alpha

set.seed(seed)
data <- read.csv(filename_data, sep=" ")
data <- data[-1,] # Remove range header
n <- dim(data)[2]


pc.fit <- pc(suffStat = list(dm = data,
                               adaptDF = FALSE),
              indepTest = binCItest,
              alpha = alpha,
              labels = sapply(c(1:n), toString),
              fixedGaps = NULL,
              fixedEdges = NULL,
              NAdelete = TRUE,
              m.max = Inf,
              u2pd = c("relaxed", "rand", "retry"),
              skel.method = c("stable", "original", "stable.fast"),
              conservative = FALSE,
              maj.rule = FALSE,
              solve.confl = FALSE,
              numCores = 1,
              verbose = FALSE)

graph <- pc.fit@graph

adjmat <- as(graph, "matrix")
#blipadj <- bnfit2matrix(blipfit)
#blipadj <- rearrangeMatrix(blipadj, varnames)

write.csv(adjmat, file = filename, row.names = FALSE, quote = FALSE)

