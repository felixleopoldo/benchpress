## Simulate 
library(argparser)
library(RBGL)
library(BiDAG)

source("lib/code_for_binary_simulations/rblip.R")
source("lib/code_for_binary_simulations/df_fns.R")
source("lib/code_for_binary_simulations/sim_bidag_binary.R")
source("lib/code_for_binary_simulations/summarySE.R")
source("lib/code_for_binary_simulations/algorithm_wrappers.R")

p <- arg_parser("A program for running iterativeMCMC and save to file.")

p <- add_argument(p, "--output_dir",    help = "output dir", default = ".")
p <- add_argument(p, "--title",         help = "Title")
p <- add_argument(p, "--filename",      help = "Filename")
p <- add_argument(p, "--filename_data", help = "Dataset filename")
p <- add_argument(p, "--seed",          help = "Random seed", type = "numeric", default = 1)
p <- add_argument(p, "--map",           help = "MAP parameter True False", )
p <- add_argument(p, "--scoretype",     help = "bde/bge/bic")
p <- add_argument(p, "--chi",           help = "score parameter")
p <- add_argument(p, "--edgepf",        help = "score parameter")
p <- add_argument(p, "--am",            help = "score parameter")
p <- add_argument(p, "--aw",            help = "score parameter") # fix null
p <- add_argument(p, "--posterior",     help = "parameter")
p <- add_argument(p, "--plus1it",       help = "parameter")

argv <- parse_args(p)
directory <- argv$output_dir
filename <- file.path(argv$filename)
filename_data <- argv$filename_data

seed <- argv$seed
map <- argv$map


set.seed(seed)
data <- read.csv(filename_data, sep=" ")
data <- data[-1,] # Remove range header
# Iterative search

plus1it <- NULL
if (argv$plus1it != "None") {
  plus1it <- as.numeric(argv$plus1it)
}

posterior <- NULL
if (argv$posterior != "None") {
  posterior <- as.numeric(argv$posterior)
}
chi <- NULL
if (argv$chi != "None") {
  chi <- as.numeric(argv$chi)
}

edgepf <- NULL
if (argv$edgepf != "None") {
  edgepf <- as.numeric(argv$edgepf)
}

aw <- NULL
if (argv$aw != "None") {
  aw <- as.numeric(argv$aw)
}

am <- NULL
if (argv$am != "None") {
  am <- as.numeric(argv$am)
}
if(argv$scoretype == "bdecat"){
    myscore <- scoreparameters(dim(data)[2], "bdecat", data, 
                                bdecatpar = list(chi = chi,
                                                 edgepf = edgepf))
} 
if(argv$scoretype == "bde"){
    myscore <- scoreparameters(dim(data)[2], "bde", data, bdepar = list(chi = chi,
                                                                        edgepf = edgepf))
} 
if(argv$scoretype == "bge"){
    myscore <- scoreparameters(dim(data)[2], "bge", data, bgepar = list(am = am,
                                                                        aw = aw))
}
itsearch_res <- iterativeMCMCsearch(dim(data)[2],
                                      myscore,
                                      chainout = TRUE,
                                      MAP = as.logical(map),
                                      posterior = posterior,
                                      scoreout = TRUE,
                                      plus1it = plus1it) # 1 and loop
# How to get number of iterations (it)?
# output a csv file with "additional statistics" eg

endspace <- itsearch_res$space$adjacency
colnames(endspace) <- names(data)

write.csv(endspace, file = filename, row.names = FALSE, quote = FALSE)
