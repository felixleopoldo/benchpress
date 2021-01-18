library(RBGL)
library(BiDAG)

source("resources/code_for_binary_simulations/df_fns.R")

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
                                      plus1it = plus1it,
                                      hardlimit=as.integer(snakemake@wildcards[["hardlimit"]]),
                                      softlimit=as.integer(snakemake@wildcards[["softlimit"]]),
                                      alpha=as.numeric(snakemake@wildcards[["alpha"]]),
                                      gamma=as.numeric(snakemake@wildcards[["gamma"]]),
                                      cpdag=as.boolean(snakemake@wildcards[["cpdag"]]),
                                      mergetype=snakemake@wildcards[["mergetype"]]
                                      ) # 1 and loop
# How to get number of iterations (it)?
# output a csv file with "additional statistics" eg
totaltime <- proc.time()[1] - start

adjmat <- NULL

if (snakemake@wildcards[["estimate"]] == "map"){
  adjmat <- itsearch_res$max$DAG
}
if (snakemake@wildcards[["estimate"]] == "endspace"){
  adjmat <- itsearch_res$space$adjacency # this is the space, not the estimate
}

colnames(adjmat) <- names(data)

write.csv(adjmat, file = filename, row.names = FALSE, quote = FALSE)
write(totaltime, file = snakemake@output[["time"]])