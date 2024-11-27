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
  filename_edge_constraints <- snakemake@input[["edgeConstraints_formatted"]]

  if (!is.null(filename_edge_constraints)) {
    edgeConstraints <- read.csv(filename_edge_constraints)
    p <- ncol(data)
    node_names <- colnames(data)
    fixedGaps <- matrix(FALSE, nrow = p, ncol = p, dimnames = list(node_names, node_names))
    fixedEdges <- matrix(FALSE, nrow = p, ncol = p, dimnames = list(node_names, node_names))

    for (i in 1:nrow(edgeConstraints)) {
      node1 <- edgeConstraints$node1[i]
      node2 <- edgeConstraints$node2[i]
      if (edgeConstraints$matrix_type[i] == "fixedGaps") {
        fixedGaps[node1, node2] <- TRUE
        fixedGaps[node2, node1] <- TRUE
      } else if (edgeConstraints$matrix_type[i] == "fixedEdges") {
        fixedEdges[node1, node2] <- TRUE
        fixedEdges[node2, node1] <- TRUE
      }
    }
  } else {
    fixedGaps <- NULL
    fixedEdges <- NULL
  }


  corrMethod <- snakemake@wildcards[["corrMethod"]]
  if (corrMethod == "None") {
    corrMethod <- NULL
  } else {
    corrMethod <- match.fun(snakemake@wildcards[["corrMethod"]])
  }

  set.seed(as.integer(snakemake@wildcards[["seed"]]))
  start <- proc.time()[1]
  res <- NULL
  # datamat <- unname(as.matrix(data))

  # print("corrMethod:")
  # print(snakemake@wildcards[["corrMethod"]])

  # gaussCItest.td, gaussCItest.drw, gaussCItest.permc
  # binCItest.td, binCItest.drw, binCItest.permc
  suffStat <- NULL
  if (snakemake@wildcards[["indepTest"]] %in% "gaussCItest") {
    print("gaussCItest")
    suffStat <- list(C = cor(data, use = "complete.obs"), n = nrow(data))
  } else if (snakemake@wildcards[["indepTest"]] %in% c("binCItest")) {
    print("binCItest")
    nlev <- as.numeric(data[1, ])
    data <- data[-1, ] # Remove range header
    # remove rows with missing values
    data <- data[complete.cases(data), ]
    suffStat <- list(dm = unname(as.matrix(data)), nlev = nlev, adaptDF = FALSE)
  } else if (snakemake@wildcards[["indepTest"]] %in% c("gaussCItest.td")) {
    print("gaussCItest.td")
    suffStat <- list(data = unname(as.matrix(data)))
  } else if (snakemake@wildcards[["indepTest"]] %in% c("binCItest.td")) {
    print("binCItest.td")
    nlev <- as.numeric(data[1, ])
    data <- data[-1, ] # Remove range header
    suffStat <- list(data = unname(as.matrix(data)), nlev = nlev, adaptDF = FALSE)
  }

  # suffStat <- list(C = cor(data, use = "complete.obs"), n = nrow(data))
  # suffStat_m <- list(data = datamat) # including missing values

  if (snakemake@wildcards[["corrMethod"]] == "None") {
    if (snakemake@wildcards[["indepTest"]] %in% c("gaussCItest.td", "binCItest.td", "binCItest")) {
      print("TD-PC")
    } else {
      print("PC")
    }

    res <- pc(
      suffStat = suffStat,
      indepTest = indepTest,
      alpha = alpha,
      p = num_var,
      #labels = colnames(data),
      fixedGaps = fixedGaps,
      fixedEdges = fixedEdges,
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
warnings()
      prt_m <- detection_prt_m(data = suffStat$data, indepTest, alpha, p)

    print("MVPC")
    print(colnames(data))
    res <- mvpc(
      suffStat = suffStat,
      indepTest = indepTest,
      corrMethod = corrMethod,
      alpha = alpha,
      p = num_var,
      # prt_m = prt_m,
      #labels = colnames(data),
      fixedGaps = fixedGaps,
      fixedEdges = fixedEdges,
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
