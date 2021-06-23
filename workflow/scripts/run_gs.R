library(pcalg)
library(bnlearn)
library(RBGL)

source("resources/code_for_binary_simulations/make_var_names.R")

filename <- file.path(snakemake@output[["adjmat"]])
filename_data <- snakemake@input[["data"]]
seed <- as.integer(snakemake@wildcards[["replicate"]])

data <- read.csv(filename_data, check.names = FALSE)

header <- names(data)
if (snakemake@wildcards[["test"]] %in% c("mi", "mi-adf", "mc-mi", "smc-mi",
                                         "sp-mi", "mi-sh", "x2", "x2-adf", "sp-x2",
                                         "jt", "mc-jt", "smc-jt")) {
  data <- data[-1,] # Remove range header
  data <- matrixToDataframe(data, header)
}

set.seed(seed)
B = NULL
if (snakemake@wildcards[["B"]] != "None") {
  B <- as.integer(snakemake@wildcards[["B"]])
}
max.sx = NULL
if (snakemake@wildcards[["maxsx"]] != "None") {
  max.sx <- as.integer(snakemake@wildcards[["maxsx"]])
}

start <- proc.time()[1]
output <- gs(data,
                     alpha = as.numeric(snakemake@wildcards[["alpha"]]),
                     test = snakemake@wildcards[["test"]],
                     B = B,
                     max.sx = max.sx,
                     debug = as.logical(snakemake@wildcards[["debug"]]),
                     undirected = as.logical(snakemake@wildcards[["undirected"]])
                     )
totaltime <- proc.time()[1] - start
## convert to graphneldag
gnel_dag <- as.graphNEL(output)

adjmat <- as(gnel_dag, "matrix")
colnames(adjmat) <- header

write.csv(adjmat, file = filename, row.names = FALSE, quote = FALSE)
write(totaltime, file = snakemake@output[["time"]])

