library(pcalg)
library(BiDAG)
library(bnlearn)
library(r.blip)
library(RBGL)
library(reticulate)

source("lib/code_for_binary_simulations/make_var_names.R")
source("lib/code_for_binary_simulations/bnlearn_help_fns.R")
source("lib/code_for_binary_simulations/make_name.R")

numeric_labels <- function(gnel_dag) {
  ## The node labels from gobnilp are sorted alphabetically
  ## which is not desired. The they are sorted by the in value en the string.
  ## e.g. "1","2","13" and not "1", "13", "2"
  nodelist <- c()
  for (i in seq(length(nodes(gnel_dag)))) {
    nodelist <- c(nodelist, toString(i))
  }
  gR <- graphNEL(nodes = nodelist, edgemode = "directed")
  edL <- vector("list", length = length(nodes(gnel_dag)))
  for (node in ls(edges(gnel_dag))) {
    for (child in edges(gnel_dag)[[node]]) {
      gR <- addEdge(from = node, to = child, gR)
    }
  }
  return(gR)
}

runItsearchMAP <- function(data, dag) {
  n <- numNodes(dag)
  sample_size <- dim(data)[1]
  true_nedges <- sum(dag2adjacencymatrix(dag))

  myscore <- scoreparameters(n, "bde", data, bdepar = list(chi = 1, edgepf = 1))

  # True graph
  truescore <- DAGscore(n, myscore, dag2adjacencymatrix(dag))

  # Iterative search
  starttime <- Sys.time()

  # best graph in ech it is addspace
  # addcum, keep track of edges, current best and the add space

  itsearch_res <- iterativeMCMCsearch(n,
                                      myscore,
                                      chainout = TRUE,
                                      MAP = MAP && TRUE,
                                      posterior = 0.5,
                                      scoreout = TRUE,
                                      plus1it = 10) # 1 and loop

  endtime <- Sys.time()
  totaltime <- as.numeric(endtime - starttime, units = "secs")

  # Extend iterations.check table by FPRn (TODO: if dag exists)
  benchmarks <- iterations.check(itsearch_res, dag)
  n_iterations <- nrow(benchmarks) # To get results of the final graph

  # ROC dataframe
  results <- data.frame(TPR = benchmarks[[n_iterations, "TPR"]],
                                    FPRn = benchmarks[[n_iterations, "FP"]] / true_nedges,
                                    SHD = benchmarks[[n_iterations, "SHD"]],
                                    logscore = itsearch_res$max$score,
                                    time = totaltime,
                                    MAP = TRUE,
                                    score_type = "bde",
                                    score_param = 1)

  return(list("res" = results,
                "endspace" = itsearch_res$space$adjacency))
}

runItsearchSample <- function(data, dag) {
  n <- numNodes(dag)
  sample_size <- dim(data)[1]
  true_nedges <- sum(dag2adjacencymatrix(dag))

  myscore <- scoreparameters(n, "bde", data, bdepar = list(chi = 1, edgepf = 1))

  # True graph
  truescore <- DAGscore(n, myscore, dag2adjacencymatrix(dag))

  # Iterative search
  starttime <- Sys.time()

  # best graph in ech it is addspace
  # addcum, keep track of edges, current best and the add space
  itsearch_res <- iterativeMCMCsearch(n,
                                      myscore,
                                      chainout = TRUE,
                                      MAP = FALSE,
                                      posterior = 0.5,
                                      scoreout = TRUE,
                                      plus1it = 2) # 1 and loop

  endspace <- itsearch_res$space$adjacency
  addspace <- itsearch_res$addspace

  # If average number of edges altered last e.g k iterations is less then e.g 3. 
  # (I.e. the graph was not changed chnged in less then 3 places)
  it <- 1
  while (FALSE) {
    itsearch_res <- iterativeMCMCsearch(n,
                                      myscore,
                                      chainout = TRUE,
                                      MAP = FALSE,
                                      posterior = 0.5,
                                      scoreout = TRUE,
                                      plus1it = 1,
                                      startspace = endspace) # 1 and loop
    addspace <- itsearch_res$addspace
    endspace <- itsearch_res$space$adjacency
    it <- it + 1
  }

  endtime <- Sys.time()
  totaltime <- as.numeric(endtime - starttime, units = "secs")

  # Extend iterations.check table by FPRn (TODO: if dag exists)
  benchmarks <- iterations.check(itsearch_res, dag)
  n_iterations <- nrow(benchmarks) # To get results of the final graph

  # ROC dataframe
  results <- data.frame(TPR = benchmarks[[n_iterations, "TPR"]],
                                    FPRn = benchmarks[[n_iterations, "FP"]] / true_nedges,
                                    SHD = benchmarks[[n_iterations, "SHD"]],
                                    logscore = itsearch_res$max$score,
                                    time = totaltime,
                                    it = it)

  return(list("res" = results,
                "endspace" = itsearch_res$space$adjacency))
}

runItsearch <- function(data, dag, scorepar,
                        plus1it = NULL,
                        moveprobs = NULL,
                        MAP = TRUE,
                        posterior = 0.5,
                        iterations = NULL,
                        stepsave = NULL,
                        softlimit = 9,
                        hardlimit = 12,
                        alpha = 0.05,
                        gamma = 1,
                        startspace = NULL,
                        blacklist = NULL,
                        verbose = TRUE,
                        chainout = FALSE,
                        scoreout = FALSE,
                        cpdag = FALSE,
                        mergetype = "skeleton",
                        addspace = NULL,
                        scoretable = NULL,
                        startorder = NULL,
                        accum = FALSE
) {
  n <- numNodes(dag)
  sample_size <- dim(data)[1]
  true_nedges <- sum(dag2adjacencymatrix(dag))

  #myscore <- scoreparameters(n, "bde", data, bdepar = list(chi = 1, edgepf = 1))

  # True graph
  truescore <- DAGscore(n, scorepar, dag2adjacencymatrix(dag))

  # Iterative search
  starttime <- Sys.time()

  #if (map == 0) {
  #  plus1it <- 10
  #}
  # best graph in ech it is addspace
  # addcum, keep track of edges, current best and the add space
  itsearch_res <- iterativeMCMCsearch(n,
                                      scorepar,
                                      chainout = TRUE,
                                      MAP = MAP,
                                      posterior = 0.5,
                                      scoreout = TRUE,
                                      plus1it = plus1it) # 1 and loop

  endspace <- itsearch_res$space$adjacency
  endtime <- Sys.time()
  totaltime <- as.numeric(endtime - starttime, units = "secs")

  # Extend iterations.check table by FPRn (TODO: if dag exists)
  benchmarks <- iterations.check(itsearch_res, dag)
  n_iterations <- nrow(benchmarks) # To get results of the final graph

  # ROC dataframe
  results <- data.frame(TPR = benchmarks[[n_iterations, "TPR"]],
                                    FPRn = benchmarks[[n_iterations, "FP"]] / true_nedges,
                                    SHD = benchmarks[[n_iterations, "SHD"]],
                                    logscore = itsearch_res$max$score,
                                    time = totaltime,
                                    it = n_iterations #itsearch_res$max$it
                                    ) # Iterartion where the max score was found

  return(list("res" = results,
              "endspace" = itsearch_res$space$adjacency))
}


runOrderMCMC <- function(data, dag, scorepar,
MAP = TRUE,
plus1 = TRUE,
startspace = NULL,
blacklist = NULL,
startorder = NULL,
scoretable = NULL,
moveprobs = NULL,
iterations = NULL,
stepsave = NULL,
alpha = 0.05,
cpdag = FALSE,
gamma = 1,
hardlimit = ifelse(plus1, 15, 22),
chainout = TRUE,
scoreout = FALSE,
verbose = FALSE
) {
  #
  # Order MCMC
  #
  sample_size <- dim(data)[1]
  n <- dim(data)[2]
  true_nedges <- sum(dag2adjacencymatrix(dag))
  # myscore <- scoreparameters(n, "bde", data, bdepar = list(chi = 1, edgepf = 1))
  starttime <- Sys.time()
  order_mcmc_res <- orderMCMC(n, scorepar,
                              startspace = startspace,
                              MAP = MAP,
                              chainout = chainout)
  endtime <- Sys.time()
  totaltime <- as.numeric(endtime - starttime, units = "secs")

  # DAG obtained from order MCMC with the space definced by the iterativeMCMCSearch
  # Extend the sample.check output by TPR and FPRn
  pbarrier = c(0.99, 0.95, 0.9, 0.8, 0.7, 0.6, 0.5, 0.4, 0.3, 0.2)
  benchmarks <- sample.check(n, order_mcmc_res$chain$incidence, dag, pbarrier = pbarrier, pdag = FALSE, burnin = 0.5)

  scores <- rep(NaN, length(pbarrier))
  for (i in 1:length(pbarrier)) {
    graph_thresh <- dag.threshold(n, order_mcmc_res$chain$incidence, pbarrier = pbarrier[i], pdag = FALSE, burnin = 0.5)
    if (gRbase::is.DAG(graph_thresh)) {
      scores[i] <- DAGscore(n, scorepar, graph_thresh)
    }
  }

  res <- data.frame(TPR = benchmarks[, "TP"] / true_nedges,
                    FPRn = benchmarks[, "FP"] / true_nedges,
                    logscore = scores,
                    threshold = benchmarks[, "post.thr."],
                    SHD = benchmarks[, "SHD"]
                    )
  res$time = totaltime

  return(res)
}

runBlip <- function(data, dag, scorer.method = "is", solver.method = "winasobs",
                    indeg = 6, time = 3600, allocated = 80,
                    scorefunction = "bic", alpha = 1, cores = 1,
                    verbose = 0, treewidth = 5) {

  sample_size <- dim(data)[1]
  n <- dim(data)[2]
  true_nedges <- sum(dag2adjacencymatrix(dag))
  # Blip
  res <- data.frame(matrix(ncol = 8, nrow = 1))
  colnames(res) <- c("TP", "FP", "SHD", "TPR", "FPRn", "score", "bnscore", "time")

  # Transform data to blip compatible format
  varnames <- varnames.make(n)
  datadf <- matrixToDataframe(data, varnames = varnames)

  starttime <- Sys.time()
  blipfit <- blip.learn(datadf,
                        scorer.method = scorer.method,
                        solver.method = solver.method,
                        indeg = indeg,
                        cores = cores,
                        time = time,
                        allocated = allocated,
                        scorefunction = scorefunction,
                        alpha = alpha,
                        verbose = verbose)
  endtime <- Sys.time()
  totaltime <- as.numeric(endtime - starttime, units = "secs")

  blipadj <- bnfit2matrix(blipfit)
  blipadj <- rearrangeMatrix(blipadj, varnames)
  compres <- compareDAGs(adjacency2dag(blipadj), dag)
  names(compres) <- c("SHD", "TP", "FP")

  myscore_tmp <- scoreparameters(ncol(data), "bdecat", data, bdecatpar = list(chi = argv$alpha,
                                                                              edgepf = argv$alpha))
  logscore <- DAGscore(ncol(data), myscore_tmp, blipadj) # this was bnscore, dont know why...

  res <- list()
  res$res <- data.frame(TPR = compres["TP"] / true_nedges, # should be for all times
                            FPRn = compres["FP"] / true_nedges,
                            logscore = logscore,
                            SHD = compres["SHD"],
                            time = totaltime)
  res$adjmat <- blipadj
    return(res)
}

runPCalg <- function(data, dag, alpha) {
  n <- numNodes(dag)
  sample_size <- dim(data)[1]
  true_nedges <- sum(dag2adjacencymatrix(dag))
  myCPDAG <- pcalg::dag2cpdag(dag)

  starttime <- Sys.time()
  pc.fit <- pc(suffStat = list(dm = data,
                               adaptDF = FALSE),
              indepTest = binCItest,
              alpha = alpha,
              labels = sapply(c(1:n), toString),
              fixedGaps = NULL,
              fixedEdges = NULL,
              NAdelete = TRUE,
              m.max = Inf,
              u2pd = c("relaxed", "rand", "retry"),
              skel.method = c("stable", "original", "stable.fast"),
              conservative = FALSE,
              maj.rule = FALSE,
              solve.confl = FALSE,
              numCores = 1,
              verbose = FALSE)
  endtime <- Sys.time()
  totaltime <- as.numeric(endtime - starttime, units = "secs")
  comp <- compareDAGs(pc.fit@graph, myCPDAG) # c(SHD, TP, FP)
  res <- data.frame(TPR = comp[2] / true_nedges,
                        FPRn = comp[3] / true_nedges,
                        time = totaltime,
                        SHD = comp[1])
  return(res)
}

runMMHC <- function(data, dag, alpha) {
  n <- numNodes(dag)
  sample_size <- dim(data)[1]
  true_nedges <- sum(dag2adjacencymatrix(dag))
  datanew <- matrixToDataframe(data, names(data))
  learn.net <- empty.graph(names(datanew))
  starttime <- Sys.time()
  mmoutput <- mmhc(datanew, restrict.args = list(alpha = alpha))
  endtime <- Sys.time()
  totaltime <- as.numeric(endtime - starttime, units = "secs")
  ## convert to graphneldag
  gnel_dag <- as.graphNEL(mmoutput)

  comp <- compareDAGs(gnel_dag, dag)

  res <- data.frame(TPR = comp[2] / true_nedges,
                        FPRn = comp[3] / true_nedges,
                        time = totaltime,
                        SHD = comp[1])
  return(res)
}

runGobnilp <- function(filename_data, dag, palim = 6, plot = FALSE) {
  n <- numNodes(dag)
  data <- read.csv(filename_data, sep = " ")
  sample_size <- dim(data)[1] - 1
  true_nedges <- sum(dag2adjacencymatrix(dag))

  gob <- import("pygobnilp.gobnilp")
  m <- gob$Gobnilp()

  starttime <- Sys.time()
  m$learn(filename_data,
          plot = plot,
          palim = palim) # score=BGeu ? 
  endtime <- Sys.time()
  totaltime <- as.numeric(endtime - starttime, units = "secs")
  ## convert to graphneldag
  graphstring = m$learned_bn$bnlearn_modelstring()
  gnel_dag <- as.graphNEL(model2network(graphstring))
  gnel_dag <- numeric_labels(gnel_dag) # Corrects the node labels

  comp <- compareDAGs(gnel_dag, dag)

  res <- data.frame(TPR = comp[2] / true_nedges,
                        FPRn = comp[3] / true_nedges,
                        time = totaltime,
                        SHD = comp[1])

  return(res)
}