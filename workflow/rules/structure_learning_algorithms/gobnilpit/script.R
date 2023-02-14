library(pcalg)
library(graph)
source("workflow/rules/structure_learning_algorithms/gobnilpit/export_to_gobnilp_score_tables.R")

gobnilp <- function(scorefile, datafile, adjmatfile) {

    gobnilpset <- paste(
        'gobnilp/outputfile/adjacencymatrix = "', adjmatfile, '"
         gobnilp/delimiter = ","'
         ,
        sep = ""
    )
    print(gobnilpset)

    cat(gobnilpset, file = paste(adjmatfile, ".gobnilp.set", sep = ""), sep = "")

    system(paste("ADJMAT=", adjmatfile, "
         DATA=", datafile, "
         SCORES=", scorefile, "
         /myappdir/gobnilp/bin/gobnilp -g=$ADJMAT.gobnilp.set $SCORES
         sed --in-place 's/\ /,/g' $ADJMAT
         head -n 1 $DATA > $ADJMAT.header
         cat $ADJMAT >> $ADJMAT.header
         mv $ADJMAT.header $ADJMAT"
         , sep = ""))

}

#         awk '{{print $2}}' $ADJMAT.scoretime > ", timefile
# Read data
set.seed(as.integer(snakemake@wildcards[["replicate"]]))

filename <- snakemake@input[["data"]]

data <- read.csv(filename, check.names = FALSE) # [-1,]

mergetype <- snakemake@wildcards[["mergetype"]]

colnames(data) <- seq(0, ncol(data) - 1) # renaming data for some reason..
# Migth be a problem!


start <- proc.time()[1]

# PC estimate

# Just Gaussian atm
n <- dim(data)[1]
suffStat <- list(C = cor(data), n = n)


pc.fit <- pc(
    suffStat = suffStat,
    indepTest = gaussCItest,
    alpha = 0.05,
    labels = colnames(data)
)

pcg <- pc.fit@graph # need NOT to transpose the graph here

if (mergetype == "cpdag") {
    pc_cpdag <- dag2cpdag(pcg)
    pc_cpdag_adjmat <- as(pc_cpdag, "matrix")
    startspace <- pc_cpdag_adjmat
}
if (mergetype == "skeleton"){
    startspace <- 1*(as(pcg, "matrix") | t(as(pcg, "matrix")))
}

# Write pcalg startspace to file.

colnames(startspace) <- names(data)

## Getting the plus1 score tables as a by-product of iterativeMCMC
data <- data[-1, ]
am <- 0.1
aw <- NULL
scores <- scoreparameters("bge", data, bgepar = list(am = am, aw = aw))


# print("start itsearch")
# itfit <- iterativeMCMC(scores,
#     chainout = TRUE,
#     startspace = startspace,
#     plus1it = 1, scoreout = TRUE
# )
# print(itfit$score) # just for comparison, this is not used

# tables <- itfit$scoretable$tables
# adjmat <- itfit$scoretable$adjacency
scorefile <- paste(snakemake@output[["adjmat"]], ".scorefile", sep="")

# print("Saving scores in gobnilp format")
# write_gobnilp_scores(tables, adjmat, scorefile)


# # Running gobnilp ans saves DAG to file
# print("Running gobnilp")
# gobnilp(scorefile, filename, snakemake@output[["adjmat"]])

# Run gobnilp its times with plus1 expanded search space.
its <- as.integer(snakemake@wildcards[["plus1it"]])
for (i in seq(its)) {
    print("Iteration")
    print(i)
    # Get the new search space
    adjmatest <- read.csv(snakemake@output[["adjmat"]])
    gobnilp_g <- as(t(adjmatest), "graphNEL") ## convert to graph

    if (mergetype == "cpdag") {
        gobnilp_cpdag <- dag2cpdag(gobnilp_g)
        gobnilp_cpdag_adjmat <- t(as(gobnilp_cpdag, "matrix"))
        plus1_space <- startspace | gobnilp_cpdag_adjmat
    }
    if (mergetype == "skeleton") {
        plus1_space <- startspace | 1 * (adjmatest | t(adjmatest))
    }

    ## Get the plus1 score tables
    itfit <- iterativeMCMC(scores,
        chainout = TRUE, plus1it = 1,
        startspace = plus1_space,
        scoreout = TRUE, iterations=3, stepsave=1
    )
    print(itfit$score) # just for comparison, this is not used

    tables <- itfit$scoretable$tables
    adjmat <- itfit$scoretable$adjacency

    write_gobnilp_scores(tables, adjmat, scorefile)

    # Run gobnilp
    gobnilp(scorefile, filename, snakemake@output[["adjmat"]])
}

totaltime <- proc.time()[1] - start
write(totaltime, file = snakemake@output[["time"]])
