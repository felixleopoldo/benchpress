## Simulate rblip
##

library(argparser)

library(RBGL)
library(r.blip)
source("lib/code_for_binary_simulations/rblip.R")
source("lib/code_for_binary_simulations/df_fns.R")
source("lib/code_for_binary_simulations/algorithm_wrappers.R")

p <- arg_parser("A program for running r.blip and save to file.")

p <- add_argument(p, "--title", help = "Title")
p <- add_argument(p, "--output_dir", help = "output dir", default = ".")
p <- add_argument(p, "--filename_dag", help = "DAGs filename")
p <- add_argument(p, "--filename_data", help = "Dataset filename")
p <- add_argument(p, "--replicate", help = "Replicate id", type = "numeric")
p <- add_argument(p, "--max_time", help = "Blip max time", type = "numeric")

argv <- parse_args(p)

directory <- argv$output_dir
dir.create(directory)
filename <- file.path(directory, argv$filename)
filename_dag <- argv$filename_dag
filename_data <- argv$filename_data
replicate <- argv$replicate
max_time <- argv$max_time

dag <- readRDS(filename_dag)
data <- read.csv(filename_data)

#title <- "blip"
title <- argv$title
blip <- runBlip(data, dag, replicate, max_time, title)
write.csv(blip$scores, file = file.path(directory, paste("scores_", title, "_time_", max_time, "_", replicate, ".csv", sep="")), row.names = FALSE)
write.csv(blip$SHD, file = file.path(directory, paste("SHD_", title, "_time_", max_time, "_", replicate, ".csv", sep="")), row.names = FALSE)
write.csv(blip$ROC, file = file.path(directory, paste("ROC_", title, "_time_", max_time, "_", replicate, ".csv", sep="")), row.names = FALSE)

