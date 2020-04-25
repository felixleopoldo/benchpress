## Simulate rblip
##
library(argparser)

library(RBGL)

source("lib/code_for_binary_simulations/rblip.R")
source("lib/code_for_binary_simulations/df_fns.R")
source("lib/code_for_binary_simulations/sim_bidag_binary.R")
source("lib/code_for_binary_simulations/summarySE.R")
source("lib/code_for_binary_simulations/algorithm_wrappers.R")

p <- arg_parser("A program for running r.blip and save to file.")

p <- add_argument(p, "--output_dir", help = "output dir", default = ".")
p <- add_argument(p, "--title", help = "Title")
p <- add_argument(p, "--filename_dag", help = "DAGs filename") # This should not be here
p <- add_argument(p, "--filename_data", help = "Dataset filename")
p <- add_argument(p, "--seed", help = "Random seed", type = "numeric", default = 1)
p <- add_argument(p, "--replicate", help = "Replicate id", type = "numeric")
p <- add_argument(p, "--map", help = "MAP flag 0/1", type = "numeric")

argv <- parse_args(p)

directory <- argv$output_dir
filename <- file.path(directory, argv$filename)
filename_dag <- argv$filename_dag
filename_data <- argv$filename_data
replicate <- argv$replicate
seed <- argv$seed
map <- argv$map

set.seed(seed)
dag <- readRDS(filename_dag)
data <- read.csv(filename_data)
n <- dim(data)[1]
p <- dim(data)[2]
# Iterative search
title <- argv$title

# res <- None
# if (map == 1) {
#   res <- runItsearchMAP(data, dag, replicate, title)
# } else {
#   res <- runItsearchSample(data, dag, replicate, title)
# }

res <- runItsearch(data, dag, map, replicate, title)

write.csv(res$res, file = file.path(directory, paste("res_", title, "_n_", n, "_p_", p, "_map_", map, "_", replicate, ".csv", sep = "")), row.names = FALSE)
saveRDS(object = res$endspace, file.path(directory, paste("endspace_", title, "_n_", n, "_p_", p, "_map_", map, "_", replicate, ".rds", sep = "")))