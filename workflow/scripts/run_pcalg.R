library(RBGL)
library(pcalg)
source("resources/code_for_binary_simulations/bnlearn_help_fns.R")
source("resources/code_for_binary_simulations/make_name.R")

filename <- file.path(snakemake@output[["adjmat"]])
filename_data <- snakemake@input[["data"]]

seed <- as.integer(snakemake@wildcards[["replicate"]])
alpha <- as.numeric(snakemake@wildcards[["alpha"]])
NAdelete <- as.logical(snakemake@wildcards[["NAdelete"]])
mmax <- as.numeric(snakemake@wildcards[["mmax"]])
u2pd <- snakemake@wildcards[["u2pd"]]
skelmethod <- snakemake@wildcards[["skelmethod"]]
conservative <- as.logical(snakemake@wildcards[["conservative"]])
majrule <- as.logical(snakemake@wildcards[["majrule"]])
solveconfl <- as.logical(snakemake@wildcards[["solveconfl"]])
numCores <- as.integer(snakemake@wildcards[["numCores"]])
verbose <- as.logical(snakemake@wildcards[["verbose"]])
indepTest = match.fun(snakemake@wildcards[["indepTest"]])

set.seed(seed)
data <- read.csv(filename_data, sep=" ")
data <- data[-1,] # Remove range header
n <- dim(data)[2]

start <- proc.time()[1]



pc.fit <- pc(suffStat = list(dm = data,
            adaptDF = FALSE),
            indepTest = indepTest,
            alpha = alpha,
            labels = sapply(c(1:n), toString),
            fixedGaps = NULL,
              fixedEdges = NULL,
              NAdelete = NAdelete,
              m.max = mmax,
              u2pd = u2pd,
              skel.method = skelmethod,
              conservative = conservative,
              maj.rule = majrule,
              solve.confl = solveconfl,
              numCores = numCores,
              verbose = verbose)

totaltime <- proc.time()[1] - start

graph <- pc.fit@graph

adjmat <- as(graph, "matrix")
colnames(adjmat) <- names(data)

#blipadj <- bnfit2matrix(blipfit)
#blipadj <- rearrangeMatrix(blipadj, varnames)

write.csv(adjmat, file = filename, row.names = FALSE, quote = FALSE)

write(totaltime, file = snakemake@output[["time"]])