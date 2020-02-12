## Simulate rblip
##

library(argparser)

library(RBGL)
library(r.blip)
source("lib/code_for_binary_simulations/rblip.R")
source("lib/code_for_binary_simulations/df_fns.R")

p <- arg_parser("A program for running r.blip and save to file.")

p <- add_argument(p, "--filename", help = "output filename", default = "blipsim.rds")
p <- add_argument(p, "--output_dir", help = "output dir", default = ".")
p <- add_argument(p, "--filename_dags", help = "DAGs filename", default = "dag.rds")
p <- add_argument(p, "--filename_data", help = "Dataset filename", default = "data.csv")
p <- add_argument(p, "--timesvec", help = "Timesvec", nargs = Inf, type = "numeric", default = c(5, 6, 7))
p <- add_argument(p, "--seed", help = "Random seed", type = "numeric", default = 1)

argv <- parse_args(p)

dir <- argv$output_dir
dir.create(dir)
filename <- file.path(dir, argv$filename)
filename_dag <- argv$filename_dag
filename_data <- argv$filename_data
timesvec <- argv$timesvec

dag <- readRDS(filename_dag)

dataset <- read.csv(filename_data)

n <- numNodes(dag)
blip_sim <- blipsim(n, dag, dataset, timesvec = timesvec, "bdeu")

scoredf <- BlipScoresToDf(blip_sim, 1)
ROCdf <- BlipResultsToROC(blip_sim, 1)
SHDdf <- BlipResultsToSHD(blip_sim, 1)

saveRDS(blipsim, file = filename)

write.csv(scoredf, file = file.path(dir, "scores_blip.csv"), row.names = FALSE)
write.csv(SHDdf, file = file.path(dir, "SHD_blip.csv"), row.names = FALSE)
write.csv(ROCdf, file = file.path(dir, "ROC_blip.csv"), row.names = FALSE)

