## Simulate rblip
##
library(argparser)

library(RBGL)

source("lib/code_for_binary_simulations/algorithm_wrappers.R")

p <- arg_parser("A program for running Max-Min hill-climbing algorithm and save to file.")

#p <- add_argument(p, "--filename", help = "output filename")
p <- add_argument(p, "--output_dir", help = "output dir", default = ".")
p <- add_argument(p, "--title", help = "Title")
p <- add_argument(p, "--filename_dag", help = "DAGs filename") # This should not be here
p <- add_argument(p, "--filename_data", help = "Dataset filename")
#p <- add_argument(p, "--seed", help = "Random seed", type = "numeric", default = 1)
p <- add_argument(p, "--replicate", help = "Replicate id", type = "numeric")
p <- add_argument(p, "--alpha", help = "Alpha parameter", type = "numeric")

argv <- parse_args(p)

directory <- argv$output_dir
filename <- file.path(directory, argv$filename)
filename_dag <- argv$filename_dag
filename_data <- argv$filename_data
replicate <- argv$replicate
#seed <- argv$seed
alpha <- argv$alpha

#set.seed(seed)
dag <- readRDS(filename_dag)
data <- read.csv(filename_data)

# Iterative search
title <- argv$title
res <- runMMHC(data, dag, replicate, alpha, title)
write.csv(res$res, file = file.path(directory, paste("res_", title, "_alpha_", alpha, "_", replicate, ".csv", sep = "")), row.names = FALSE)

# Instead of having explicit parameters in the filenames, ids should be taken from a database.
