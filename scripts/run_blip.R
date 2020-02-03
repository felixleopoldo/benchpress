## Simulate rblip
##
library(argparser)

library(RBGL)
library(r.blip)
source("lib/code_for_binary_simulations/rblip.R")
source("lib/code_for_binary_simulations/df_fns.R")

p <- arg_parser("A program for running r.blip and save to file.")

p <- add_argument(p, "--filename", help = "output filename")
p <- add_argument(p, "--output_dir", help = "output dir", default = ".")
p <- add_argument(p, "--filename_dags", help = "DAGs filename", default = "dags.rds")
p <- add_argument(p, "--filename_data", help = "Dataset filename", default = "data.rds")
p <- add_argument(p, "--timesvec", help = "Timesvec", nargs = Inf, type = "numeric")
p <- add_argument(p, "--seed", help = "Random seed", type = "numeric")

argv <- parse_args(p)

dir <- argv$output_dir
filename <- file.path(dir, argv$filename)
filename_dags <- argv$filename_dags
filename_data <- argv$filename_data
timesvec <- argv$timesvec

mydags <- readRDS(filename_dags)
dag <- mydags[[1]]
datasets <- readRDS(filename_data)
n_datasets <- length(datasets)

# This is since it did not work with cllusterApply for some reason?

scoredf <- scoredf.init()
ROCdf <- ROCdf.init()
SHDdf <- SHDdf.init()

blipsimlist <- list()
for (j in 1:n_datasets) {
  dag <- mydags[[j]]
  n <- numNodes(dag)
  blipsimlist[[j]] <- blipsim(n, dag, datasets[[j]], timesvec = timesvec, "bdeu", rep = j)

  scoredf <- scoredf.add(newrep = blipsimlist[[j]], scoredf = scoredf, algo = "blip", repl = j)
  ROCdf <- ROCdf.add(blipsimlist[[j]], ROCdf, "blip", repl = j)
  SHDdf <- SHDdf.add(blipsimlist[[j]], SHDdf, "blip", repl = j)
}

saveRDS(blipsimlist, file = filename)

write.csv(scoredf, file = "scores_blip.csv", row.names = FALSE)
write.csv(SHDdf, file = "SHD_blip.csv", row.names = FALSE)
write.csv(ROCdf, file = "ROC_blip.csv", row.names = FALSE)

