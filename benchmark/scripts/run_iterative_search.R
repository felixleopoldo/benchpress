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
#p <- add_argument(p, "--filename", help = "Filename") 
p <- add_argument(p, "--avparents", help = "Average number of parents in DAG")
p <- add_argument(p, "--filename_dag", help = "DAGs filename") # This should not be here
p <- add_argument(p, "--filename_data", help = "Dataset filename")
p <- add_argument(p, "--seed", help = "Random seed", type = "numeric", default = 1)
p <- add_argument(p, "--map", help = "MAP parameter 0/1", type = "numeric")
p <- add_argument(p, "--score_type", help = "bde/..")
p <- add_argument(p, "--bdepar_chi", help = "bde parameter", type = "numeric")
p <- add_argument(p, "--bdepar_edgepf", help = "bde parameter", type = "numeric")
p <- add_argument(p, "--posterior", help = "parameter")
p <- add_argument(p, "--plus1it", help = "parameter")

argv <- parse_args(p)

print(argv)
directory <- argv$output_dir
#filename <- file.path(argv$filename)
filename_dag <- argv$filename_dag
filename_data <- argv$filename_data

seed <- argv$seed
map <- argv$map
avparents <- argv$avparents

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

plus1it <- NULL
if (argv$plus1it != "None") {
  plus1it <- as.numeric(argv$plus1it)
}

posterior <- NULL
if (argv$posterior != "None") {
  posterior <- as.numeric(argv$posterior)
}

res <- runItsearch(data, dag,
                            MAP = map && TRUE,
                            plus1it = plus1it,
                            posterior = posterior)

write.csv(res$res, file = file.path(directory, paste(
    "res_itsearch", #title,
    "_n_", n,
    "_p_", p,
    "_avpar_", avparents,
    "_map_", map,
    "_score_type_", argv$score_type,
    "_bdepar_chi_", argv$bdepar_chi,
    "_bdepar_edgepf_", argv$bdepar_edgepf,
    "_plus1it_", argv$plus1it,
    "_posterior_", argv$posterior,
    "_", seed,
    ".csv", sep = "")), row.names = FALSE)

saveRDS(object = res$endspace, file.path(directory,
paste("endspace_itsearch", #title,
    "_n_", n,
    "_p_", p,
    "_avpar_", avparents,
    "_map_", map,
    "_score_type_", argv$score_type,
    "_bdepar_chi_", argv$bdepar_chi,
    "_bdepar_edgepf_", argv$bdepar_edgepf,
    "_plus1it_", argv$plus1it,
    "_posterior_", argv$posterior,
    "_", seed,
    ".rds", sep = "")))