library(argparser)
library(RBGL)
library(BiDAG)

source("resources/code_for_binary_simulations/df_fns.R")

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

filename <- file.path(snakemake@output[["adjmat"]])
filename_data <- snakemake@input[["data"]]

seed <- snakemake@wildcards[["replicate"]]
map <- snakemake@wildcards[["MAP"]]

set.seed(seed)
data <- read.csv(filename_data, sep=" ")
data <- data[-1,] # Remove range header
# Iterative search

plus1it <- NULL
if (snakemake@wildcards[["plus1it"]] != "None") {
  plus1it <- as.numeric(snakemake@wildcards[["plus1it"]])
}

posterior <- NULL
if (snakemake@wildcards[["posterior"]] != "None") {
  posterior <- as.numeric(snakemake@wildcards[["posterior"]])
}
chi <- NULL
if (snakemake@wildcards[["chi"]] != "None") {
  chi <- as.numeric(snakemake@wildcards[["chi"]])
}

edgepf <- NULL
if (snakemake@wildcards[["edgepf"]] != "None") {
  edgepf <- as.numeric(snakemake@wildcards[["edgepf"]])
}

aw <- NULL
if (snakemake@wildcards[["aw"]] != "None") {
  aw <- as.numeric(snakemake@wildcards[["aw"]])
}

am <- NULL
if (snakemake@wildcards[["am"]] != "None") {
  am <- as.numeric(snakemake@wildcards[["am"]])
}
if(snakemake@wildcards[["scoretype"]] == "bdecat"){
    myscore <- scoreparameters(dim(data)[2], "bdecat", data, 
                                bdecatpar = list(chi = chi,
                                                 edgepf = edgepf))
} 
if(snakemake@wildcards[["scoretype"]] == "bde"){
    myscore <- scoreparameters(dim(data)[2], "bde", data, bdepar = list(chi = chi,
                                                                        edgepf = edgepf))
} 
if(snakemake@wildcards[["scoretype"]] == "bge"){
    myscore <- scoreparameters(dim(data)[2], "bge", data, bgepar = list(am = am,
                                                                        aw = aw))
}

start <- proc.time()[1]
itsearch_res <- iterativeMCMCsearch(dim(data)[2],
                                      myscore,
                                      chainout = TRUE,
                                      MAP = as.logical(map),
                                      posterior = posterior,
                                      scoreout = TRUE,
                                      plus1it = plus1it) # 1 and loop
# How to get number of iterations (it)?
# output a csv file with "additional statistics" eg
totaltime <- proc.time()[1] - start
endspace <- itsearch_res$space$adjacency
colnames(endspace) <- names(data)

write.csv(endspace, file = filename, row.names = FALSE, quote = FALSE)
write(totaltime, file = snakemake@output[["time"]])