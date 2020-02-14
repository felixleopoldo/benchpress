library(RBGL)
library(r.blip)
library(argparser)

source("lib/code_for_binary_simulations/df_fns.R")
source("lib/code_for_binary_simulations/summarySE.R")
source("lib/code_for_binary_simulations/sim_bidag_binary.R")
source("lib/code_for_binary_simulations/algorithm_wrappers.R")

p <- arg_parser("A program for running r.blip and save to file.")
p <- add_argument(p, "--output_dir", help = "output dir", default = ".")
p <- add_argument(p, "--filename_dag", help = "DAG filename")
p <- add_argument(p, "--filename_data", help = "Dataset filename")
p <- add_argument(p, "--blip_max_time", help = "Time limit for blip", type = "numeric")
p <- add_argument(p, "--seed", help = "Random seed", type = "numeric", default = 1)
p <- add_argument(p, "--replicate", help = "Dag replicate id", type = "numeric", default = 1)

argv <- parse_args(p)
directory <- argv$output_dir

filename_dag <- argv$filename_dag
filename_data <- argv$filename_data
blip_max_time <- argv$blip_max_time
seed <- argv$seed
replicate <- argv$replicate

dag <- readRDS(filename_dag)
data <- read.csv(filename_data)

set.seed(seed)

# Each parameter setting the one wish to test should have a number instead of name
# Then one can pass fin the setting in the output instead

title <- "iterativeMCMC_map"
itsearch_map <- runItsearch(data, dag, TRUE, replicate, "iterativeMCMC_map")
write.csv(itsearch_map$scores, file = file.path(directory, paste("scores_", title, "_", replicate, ".csv", sep="")), row.names = FALSE)
write.csv(itsearch_map$SHD, file = file.path(directory, paste("SHD_", title, "_", replicate, ".csv", sep="")), row.names = FALSE)
write.csv(itsearch_map$ROC, file = file.path(directory, paste("ROC_", title, "_", replicate, ".csv", sep="")), row.names = FALSE)

title <- "iterativeMCMC_sample"
itsearch_sample <- runItsearch(data, dag, FALSE, replicate, "iterativeMCMC_sample")
write.csv(itsearch_sample$scores, file = file.path(directory, paste("scores_", title, "_", replicate, ".csv", sep="")), row.names = FALSE)
write.csv(itsearch_sample$SHD, file = file.path(directory, paste("SHD_", title, "_", replicate, ".csv", sep="")), row.names = FALSE)
write.csv(itsearch_sample$ROC, file = file.path(directory, paste("ROC_", title, "_", replicate, ".csv", sep="")), row.names = FALSE)

title <- "orderMCMC_itsearch_map"
order_mcmc <- runOrderMCMC(data, dag, replicate, itsearch_map$itsearch_res, title)
write.csv(order_mcmc$scores, file = file.path(directory, paste("scores_", title, "_", replicate, ".csv", sep="")), row.names = FALSE)
write.csv(order_mcmc$SHD, file = file.path(directory, paste("SHD_", title, "_", replicate, ".csv", sep="")), row.names = FALSE)
write.csv(order_mcmc$ROC, file = file.path(directory, paste("ROC_", title, "_", replicate, ".csv", sep="")), row.names = FALSE)

title <- "orderMCMC_itsearch_sample"
order_mcmc_sample <- runOrderMCMC(data, dag, replicate, itsearch_sample$itsearch_res, title)
write.csv(order_mcmc_sample$scores, file = file.path(directory, paste("scores_", title, "_", replicate, ".csv", sep="")), row.names = FALSE)
write.csv(order_mcmc_sample$SHD, file = file.path(directory, paste("SHD_", title, "_", replicate, ".csv", sep="")), row.names = FALSE)
write.csv(order_mcmc_sample$ROC, file = file.path(directory, paste("ROC_", title, "_", replicate, ".csv", sep="")), row.names = FALSE)

title <- "blip"
blip <- runBlip(data, dag, replicate, blip_max_time, title)
write.csv(blip$scores, file = file.path(directory, paste("scores_", title, "_", replicate, ".csv", sep="")), row.names = FALSE)
write.csv(blip$SHD, file = file.path(directory, paste("SHD_", title, "_", replicate, ".csv", sep="")), row.names = FALSE)
write.csv(blip$ROC, file = file.path(directory, paste("ROC_", title, "_", replicate, ".csv", sep="")), row.names = FALSE)




