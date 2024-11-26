# If you have a Docker image with files to source you can source them here.
# Be careful to use the absolute path in the Docker image.
# R.utils is needed for the timeout so make sure this is installed.
source("workflow/scripts/utils/helpers.R")
# source("/path/in/dockerimage/filetosource.R")

src_path <- "/MVPC/src"
source(paste(src_path, "/CITest.R", sep = ""))
source(paste(src_path, "/Evaluation.R", sep = ""))
source(paste(src_path, "/MissingValuePC.R", sep = ""))
source(paste(src_path, "/SyntheticDataGeneration.R", sep = ""))


myalg <- function() {
    # The algorithm should be in this function.

    data <- read.csv(snakemake@input[["data"]], check.names = FALSE)
    # TODO: remove the first row if it is a range header


    num_var <- ncol(data)
    p <- num_var

    seed <- as.integer(snakemake@wildcards[["seed"]])
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
    indepTest <- match.fun(snakemake@wildcards[["indepTest"]])

    corrMethod <- snakemake@wildcards[["corrMethod"]]
    if (corrMethod == "None") {
        corrMethod <- NULL
    } else {
        corrMethod <- match.fun(snakemake@wildcards[["corrMethod"]])
    }

    set.seed(as.integer(snakemake@wildcards[["seed"]]))
    start <- proc.time()[1]
    res <- NULL
    datamat <- unname(as.matrix(data))

    #print("corrMethod:")
    #print(snakemake@wildcards[["corrMethod"]])
    
    suffStat <- list(C = cor(data, use = "complete.obs"), n = nrow(data))
    suffStat_m <- list(data = datamat) # including missing values

    if (snakemake@wildcards[["corrMethod"]] == "None") {

        # TODO: td-PC uses suffStat_m
        if (snakemake@wildcards[["indepTest"]] %in% c("gaussCItest.td", "binCItest.td") ) {
            print("TD-PC")
            ss <- list(data = datamat)
        } else {
            print("PC")
            ss <- suffStat
            
        }
        res <- pc(
            suffStat = ss,
            indepTest = indepTest,
            alpha = alpha,
            # p = num_var,            
            labels = colnames(data),
            # fixedGaps = fixedGaps,
            # fixedEdges = fixedEdges,
            NAdelete = NAdelete,
            m.max = mmax,
            u2pd = u2pd,
            skel.method = skelmethod,
            conservative = conservative,
            maj.rule = majrule,
            solve.confl = solveconfl,
            numCores = numCores,
            verbose = verbose
        )
    } else {
        # Build prt_m. This contains the missingness indicators for each variable.
        
        #prt_m <- get_prt_m_ind(data = suffStat_m$data, indepTest, alpha, num_var)

        print("MVPC")

        res <- mvpc(
            suffStat = suffStat_m,
            indepTest = indepTest,
            corrMethod = corrMethod,
            alpha = alpha,
            p = num_var,
            #prt_m = prt_m,            
            labels = colnames(data),
            # fixedGaps = fixedGaps,
            # fixedEdges = fixedEdges,
            NAdelete = NAdelete,
            m.max = mmax,
            u2pd = u2pd,
            skel.method = skelmethod,
            conservative = conservative,
            maj.rule = majrule,
            solve.confl = solveconfl,
            numCores = numCores,
            verbose = verbose
        )
    }

    # diag(adjmat) <- 0
    totaltime <- proc.time()[1] - start
    graph <- res@graph
    adjmat <- as(graph, "matrix")

    colnames(adjmat) <- names(data) # Get the labels from the data
    write.csv(adjmat, file = snakemake@output[["adjmat"]], row.names = FALSE, quote = FALSE)
    write(totaltime, file = snakemake@output[["time"]])
    # Write the true number of c.i. tests here if possible.
    cat("None", file = snakemake@output[["ntests"]], sep = "\n")
}

add_timeout(myalg)
