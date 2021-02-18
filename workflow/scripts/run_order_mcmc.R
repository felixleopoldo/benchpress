library(BiDAG)
library(rjson)

filename <- file.path(snakemake@output[["adjvecs"]])
filename_data <- snakemake@input[["data"]]

seed <- snakemake@wildcards[["replicate"]]

set.seed(seed)
data <- read.csv(filename_data, sep=",")

startspace <- read.csv(snakemake@input[["startspace"]])
rownames(startspace) <- seq(dim(data)[2])
colnames(startspace) <- seq(dim(data)[2])
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

alpha <- NULL
if (snakemake@wildcards[["alpha"]] != "None") {
  alpha <- as.numeric(snakemake@wildcards[["alpha"]])
}

iterations <- NULL
if (snakemake@wildcards[["iterations"]] != "None") {
  iterations <- as.numeric(snakemake@wildcards[["iterations"]])
}

stepsave <- NULL
if (snakemake@wildcards[["stepsave"]] != "None") {
  stepsave <- as.numeric(snakemake@wildcards[["stepsave"]])
}

if(snakemake@wildcards[["scoretype"]] == "bdecat"){
  data <- data[-1,] # Remove range header
    myscore <- scoreparameters(dim(data)[2], "bdecat", data, bdecatpar = list(chi = chi,
                            edgepf = edgepf))
} 
if(snakemake@wildcards[["scoretype"]] == "bde"){
  data <- data[-1,] # Remove range header
    myscore <- scoreparameters(dim(data)[2], "bde", data, bdepar = list(chi = chi,
                                                                        edgepf = edgepf))
} 
if(snakemake@wildcards[["scoretype"]] == "bge"){
    myscore <- scoreparameters(dim(data)[2], "bge", data, bgepar = list(am = am,
                                                                        aw = aw))
}
start <- proc.time()[1]
order_mcmc_res <- orderMCMC(dim(data)[2], myscore,
                              startspace = startspace,
                              plus1 = as.logical(snakemake@wildcards[["plus1"]]),
                              MAP = as.logical(snakemake@wildcards[["MAP"]]),
                              chainout = TRUE,
                              scoreout = TRUE,
                              alpha=alpha,
                              iterations=iterations,
                              stepsave=stepsave,
                              gamma=as.numeric(snakemake@wildcards[["gamma"]]),
                              cpdag=as.logical(snakemake@wildcards[["cpdag"]])
                              )

totaltime <- proc.time()[1] - start
endspace <- order_mcmc_res$space$adjacency # This might not be what we want

# This returns a string which is a list of flattened adjacency matrices.
adjvecliststr <- rjson::toJSON(order_mcmc_res$chain$incidence)

write(adjvecliststr, file = filename)

write(totaltime, file = snakemake@output[["time"]])
