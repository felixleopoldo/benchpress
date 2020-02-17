## Simulate rblip
##
library(argparser)
library(tools)

library(RBGL)
source("lib/code_for_binary_simulations/rblip.R")
source("lib/code_for_binary_simulations/df_fns.R")
source("lib/code_for_binary_simulations/sim_bidag_binary.R")
source("lib/code_for_binary_simulations/summarySE.R")
source("lib/code_for_binary_simulations/algorithm_wrappers.R")

p <- arg_parser("A program for running porder MCMC and save results to file.")

p <- add_argument(p, "--filename_startspace", help = "Start space")
p <- add_argument(p, "--output_dir", help = "output dir", default = ".")
p <- add_argument(p, "--filename_dag", help = "DAGs filename") # This should not be here
p <- add_argument(p, "--filename_data", help = "Dataset filename")
p <- add_argument(p, "--seed", help = "Random seed", type = "numeric", default = 1)
p <- add_argument(p, "--replicate", help = "Replicate id", type = "numeric")

argv <- parse_args(p)

directory <- argv$output_dir
filename <- file.path(directory, argv$filename)

seed <- argv$seed
replicate <- argv$replicate

set.seed(seed)
dag <- readRDS(argv$filename_dag)
data <- read.csv(argv$filename_data)
startspace <- readRDS(argv$filename_startspace)

#start_space_name = basename(argv$filename_startspace)
#start_space_name = tools::file_path_sans_ext(argv$filename_startspace)
startspace_name = sub(pattern = "(.*)\\..*$", replacement = "\\1", basename(argv$filename_startspace))

title <- "orderMCMC"

# append filename of startspace to the titles

order_mcmc_sample <- runOrderMCMC(data, dag, replicate, startspace, title)
write.csv(order_mcmc_sample$scores, file = file.path(directory, paste("scores_", title, "_", replicate, "_startspace_", startspace_name, ".csv", sep="")), row.names = FALSE)
write.csv(order_mcmc_sample$SHD, file = file.path(directory, paste("SHD_", title, "_", replicate, "_startspace_", startspace_name, ".csv", sep="")), row.names = FALSE)
write.csv(order_mcmc_sample$ROC, file = file.path(directory, paste("ROC_", title, "_", replicate, "_startspace_", startspace_name, ".csv", sep="")), row.names = FALSE)