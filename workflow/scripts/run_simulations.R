## Simulate rblip
##
library(argparser)

library(RBGL)
library(r.blip)
source("resources/code_for_binary_simulations/rblip.R")
source("resources/code_for_binary_simulations/df_fns.R")
source("resources/code_for_binary_simulations/sim_bidag_binary_euler.R")
source("resources/code_for_binary_simulations/summarySE.R")

p <- arg_parser("A program for running r.blip and save to file.")

#p <- add_argument(p, "--filename", help = "output filename")
p <- add_argument(p, "--output_dir", help = "output dir", default = ".")
p <- add_argument(p, "--filename_dags", help = "DAGs filename", default = "dags.rds") # This should not be here
p <- add_argument(p, "--filename_datas", help = "Dataset filenames", nargs = Inf)
p <- add_argument(p, "--timesvec", help = "Timesvec", nargs = Inf, type = "numeric")
p <- add_argument(p, "--seed", help = "Random seed", type = "numeric", default = 1)

argv <- parse_args(p)

dir <- argv$output_dir
filename <- file.path(dir, argv$filename)
filename_dags <- argv$filename_dags
filename_datas <- argv$filename_datas
timesvec <- argv$timesvec

dags <- readRDS(filename_dags)

# This is since it did not work with cllusterApply for some reason?

scoredf <- scoredf.init()
ROCdf <- ROCdf.init()
SHDdf <- SHDdf.init()

for (filename_data in filename_datas) {
  print(filename_data)
  datasets <- readRDS(filename_data)  # This is a set of datasets.
  n_datasets <- length(datasets)
  blipsimlist <- list()
  for (j in 1:n_datasets) {
    dag <- dags[[j]]
    n <- numNodes(dag)
    blipsimlist[[j]] <- blipsim(n, dag, datasets[[j]], timesvec = timesvec, "bdeu", rep = j)

    scoredf <- scoredf.add(newrep = blipsimlist[[j]], scoredf = scoredf, algo = "blip", repl = j) # this does 2 things, add and puts in right format.
    ROCdf <- ROCdf.add(blipsimlist[[j]], ROCdf, "blip", repl = j)
    SHDdf <- SHDdf.add(blipsimlist[[j]], SHDdf, "blip", repl = j)
  }

  cl <- makeCluster(n_datasets)
  bidag_sim_list <- clusterApply(cl, c(1:n_datasets), simulationBiDAG, n = n, dags, datasets)
  stopCluster(cl)

  for (j in 1:n_datasets) {
    scoredf <- scoredf.add(newrep = bidag_sim_list[[j]], scoredf = scoredf, algo = "MCMC", repl = j)
    SHDdf <- SHDdf.add(newrep = bidag_sim_list[[j]], SHDdf = SHDdf, algo = "MCMC", repl = j)
    ROCdf <- ROCdf.add(newrep = bidag_sim_list[[j]], ROCdf = ROCdf, algo = "MCMC", repl = j)
  }
}

sumROCdf <- summarySE(ROCdf, "TPR", "FPRn", groupvars = c("ss", "algorithm", "threshold"))
sumROCdf$algorithm <- with(sumROCdf, factor(algorithm, levels = c("blip", "iterativeMCMC", "finalMCMC")))

write.csv(sumROCdf, file = "sumROC.csv", row.names = FALSE)
write.csv(scoredf, file = "scores.csv", row.names = FALSE)
write.csv(SHDdf, file = "SHD.csv", row.names = FALSE)
write.csv(ROCdf, file = "ROC.csv", row.names = FALSE)