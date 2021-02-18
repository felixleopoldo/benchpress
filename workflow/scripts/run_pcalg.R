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
data <- read.csv(filename_data, sep=",")

suffStat = NULL
if (snakemake@wildcards[["indepTest"]] != "gaussCItest"){
  data <- data[-1,] # Remove range header
   suffStat <- list(dm = data,
            adaptDF = FALSE)
} else {
  n <- dim(data)[1]
  suffStat <- list(C = cor(data), n = n)

}

#print(data)
p <- dim(data)[2]

#print(p)
start <- proc.time()[1]

pc.fit <- pc(suffStat = suffStat,
            indepTest = indepTest,
            alpha = alpha,
            labels = sapply(c(1:p), toString),
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