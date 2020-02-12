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

#p <- add_argument(p, "--filename", help = "output filename")
p <- add_argument(p, "--start_space", help = "Start space", default = "itsearchdag.rds")
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

# Benchmark
#starttime <- Sys.time()

sim <- list()
n <- numNodes(DAG)
sim$n <- n
sim$sampsize <- nrow(data)
sim$DAG <- DAG
sim$nedges <- sum(dag2adjacencymatrix(DAG))
sim$i <- i

sim$replicate <- i
sim$ss <- sim$sampsize / sim$n

# Iterative search


# OrderMCMC
starttime <- Sys.time()
order_mcmc_res <- orderMCMC(n, myscore, startspace = iterative_search_res$endspace, MAP = FALSE, chainout = TRUE) # the number of MCMC steps is by default 5n^{2}\log{n}
endtime <- Sys.time()
totaltime <- endtime - starttime
sim <- SummarizeOrderMCMCResults(i, myscore, iterative_search_res, order_mcmc_res, DAG, totaltime, data, MAP)
scoredf <- BidagResultsToDf(bidag_sim)
ROCdf <- BidagResultsToROC(bidag_sim)
SHDdf <- BidagResultsToSHD(bidag_sim)

# These could be in the combine part
sumROCdf <- summarySE(ROCdf, "TPR", "FPRn", groupvars = c("ss", "algorithm", "threshold"))
sumROCdf$algorithm <- with(sumROCdf, factor(algorithm, levels = c("blip", "iterativeMCMC", "finalMCMC"))) # this coudl be in the combine file

write.csv(sumROCdf, file = file.path(dir, "sumROC.csv"), row.names = FALSE)
write.csv(scoredf, file = file.path(dir, "scores.csv"), row.names = FALSE)
write.csv(SHDdf, file = file.path(dir, "SHD.csv"), row.names = FALSE)
write.csv(ROCdf, file = file.path(dir, "ROC.csv"), row.names = FALSE)