## Simulate rblip
##
library(argparser)

library(RBGL)
library(r.blip)
source("lib/code_for_binary_simulations/rblip.R")
source("lib/code_for_binary_simulations/df_fns.R")
source("lib/code_for_binary_simulations/sim_bidag_binary.R")
source("lib/code_for_binary_simulations/summarySE.R")

p <- arg_parser("A program for running r.blip and save to file.")

p <- add_argument(p, "--filename", help = "output filename")
p <- add_argument(p, "--output_dir", help = "output dir", default = ".")
p <- add_argument(p, "--filename_dag", help = "DAGs filename", default = "dag.rds") # This should not be here
p <- add_argument(p, "--filename_data", help = "Dataset filename", nargs = Inf)
p <- add_argument(p, "--seed", help = "Random seed", type = "numeric", default = 1)

argv <- parse_args(p)

dir <- argv$output_dir
filename <- file.path(dir, argv$filename)
filename_dag <- argv$filename_dag
filename_data <- argv$filename_data

dag <- readRDS(filename_dag)
dataset <- read.csv(filename_data)

n <- numNodes(dag)

sim <- list()
n <- numNodes(DAG)
sim$n <- n
sim$sampsize <- nrow(data)
sim$DAG <- DAG
sim$nedges <- sum(dag2adjacencymatrix(DAG))

sim$ss <- sim$sampsize / sim$n

# Iterative search
scoretype <- "bde"
myscore <- scoreparameters(n, scoretype, data, bdepar = list(chi = 1, edgepf = 1))
starttime <- Sys.time()
iterative_search_res <- iterativeMCMCsearch(n, myscore, chainout = TRUE, MAP = FALSE) # the number of MCMC steps is by default 3.5n^{2}\log{n}
endtime <- Sys.time()
totaltime <- as.numeric(endtime - starttime) * 60

saveRDS(object = sim, filename)

