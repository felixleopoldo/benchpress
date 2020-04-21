library(pcalg)
library(BiDAG)
library(bnlearn)
library(r.blip)
library(RBGL)
library(reticulate)

source("lib/code_for_binary_simulations/make_var_names.R")
source("lib/code_for_binary_simulations/bnlearn_help_fns.R")
source("lib/code_for_binary_simulations/make_name.R")

numeric_labels <- function(gnel_dag){
    ## The node labels from gobnilp are sorted alphabetically
    ## which is not desired. The they are sorted by the in value en the string.
    ## e.g. "1","2","13" and not "1", "13", "2"
    nodelist <- c()
    for (i in seq(length(nodes(gnel_dag)))) {
        nodelist <- c(nodelist, toString(i))
    }
    gR <- graphNEL(nodes=nodelist, edgemode = "directed")
    edL <- vector("list", length=length(nodes(gnel_dag)))
    for (node in ls(edges(gnel_dag))) {
        for (child in edges(gnel_dag)[[node]]){        
            gR <- addEdge(from=node, to=child, gR)
        }
    }
    return(gR)
}

runItsearch <- function(data, dag, MAP, replicate, title) {
  n <- numNodes(dag)
  sample_size <- dim(data)[1]
  true_nedges <- sum(dag2adjacencymatrix(dag))

  myscore <- scoreparameters(n, "bde", data, bdepar = list(chi = 1, edgepf = 1))

  # True graph
  truescore <- DAGscore(n, myscore, dag2adjacencymatrix(dag))
  # scoresdf_truegraph <- data.frame(logscore = truescore,
  #                                   algo = "TRUE",
  #                                   ss = dim(data)[1],
  #                                   replicate = replicate,
  #                                   time = 0) # Should add dag name

  # Iterative search
  starttime <- Sys.time()

  itsearch_res <- iterativeMCMCsearch(n, myscore, chainout = TRUE,
                                      MAP = MAP && TRUE, posterior = 0.5, scoreout = TRUE, plus1it = 10)
  endtime <- Sys.time()
  totaltime <- endtime - starttime

  # Score dataframe
  # Should add dataset name here which can be tracked to the dag
  # and the parameters in the database
  # scoresdf_itsearch <- data.frame(logscore = itsearch_res$max$score,
  #                                   algo = title,
  #                                   ss = sample_size / n,
  #                                   replicate = replicate,
  #                                   time = totaltime,
  #                                   sample_size=sample_size,
  #                                   dim=dim))

  # Extend iterations.check table by FPRn (TODO: if dag exists)
  benchmarks <- iterations.check(itsearch_res, dag)

  n_iterations <- nrow(benchmarks) # To get results of the final graph

  # ROC dataframe
  results <- data.frame(TPR = benchmarks[[n_iterations, "TPR"]],
                                FPRn = benchmarks[[n_iterations, "FP"]] / true_nedges,
                                algorithm = title, # TODO: Title should be set outside..
                                ss = sample_size / n,
                                replicate = replicate,
                                SHD = benchmarks[[n_iterations, "SHD"]],
                                logscore = itsearch_res$max$score,
                                plus1it = 10,
                                posterior = 0.5,
                                time = totaltime,
                                sample_size=sample_size,
                                dim=dim(data)[2])

  return(list("res" = results,
              "endspace" = itsearch_res$space$adjacency))
}

runOrderMCMC <- function(data, dag, replicate, startspace, title) {
  #
  # Order MCMC
  #
  sample_size <- dim(data)[1]
  n <- dim(data)[2]
  true_nedges <- sum(dag2adjacencymatrix(dag))
  myscore <- scoreparameters(n, "bde", data, bdepar = list(chi = 1, edgepf = 1))  
  starttime <- Sys.time()
  order_mcmc_res <- orderMCMC(n, myscore, startspace = startspace, MAP = FALSE, chainout = TRUE)
  endtime <- Sys.time()
  totaltime <- endtime - starttime

  # DAG obtained from order MCMC with the space definced by the iterativeMCMCSearch
  # Extend the sample.check output by TPR and FPRn
  pbarrier = c(0.99, 0.95, 0.9, 0.8, 0.7, 0.6, 0.5, 0.4, 0.3, 0.2)
  benchmarks <- sample.check(n, order_mcmc_res$chain$incidence, dag, pbarrier=pbarrier, pdag = FALSE, burnin = 0.5)
  
  scores <- rep(NaN, length(pbarrier))
  for (i in 1:length(pbarrier)) {  
    graph_thresh <- dag.threshold(n, order_mcmc_res$chain$incidence, pbarrier = pbarrier[i], pdag = FALSE, burnin = 0.5)
    if (gRbase::is.DAG(graph_thresh)) {
      scores[i] <- DAGscore(n, myscore, graph_thresh)
    }
  }

  res <- data.frame(TPR = benchmarks[, "TP"] / true_nedges,
                    FPRn = benchmarks[, "FP"] / true_nedges,
                    logscore = scores,
                    threshold = benchmarks[, "post.thr."],
                    algorithm = title,
                    replicate = replicate,
                    SHD = benchmarks[, "SHD"],
                    sample_size=sample_size,
                    dim=dim(data)[2]) 
  res$time = totaltime

  return(res)
}

runBlip <- function(data, dag, replicate, blip_max_time, title) {
  sample_size <- dim(data)[1]
  n <- dim(data)[2]  
  true_nedges <- sum(dag2adjacencymatrix(dag))
  # Blip
  res <- data.frame(matrix(ncol = 8, nrow = 1))
  colnames(res) <- c("TP", "FP", "SHD", "TPR", "FPRn", "score", "bnscore", "time")

  # Transform data to blip compatible format
  varnames <- varnames.make(n)
  datadf <- matrixToDataframe(data, varnames = varnames)

  time <- blip_max_time
  blipfit <- blip.learn(datadf, time = blip_max_time, scorefunction = "bdeu", verbose = 0)
  blipadj <- bnfit2matrix(blipfit)
  blipadj <- rearrangeMatrix(blipadj, varnames)
  compres <- compareDAGs(adjacency2dag(blipadj), dag)
  names(compres) <- c("SHD", "TP", "FP")

  myscore_tmp <- scoreparameters(ncol(data), "bdecat", data, bdecatpar = list(chi = 1, edgepf = 1))
  logscore <- DAGscore(ncol(data), myscore_tmp, blipadj) # this was bnscore, dont know why...

  res <- data.frame(TPR = compres["TP"] / true_nedges, # shold be for all times
                            FPRn = compres["FP"] / true_nedges,
                            logscore = logscore,
                            SHD = compres["SHD"],
                            algorithm = title,
                            replicate = replicate,
                            time = time,
                            sample_size=sample_size,
                            dim=dim(data)[2])
    return(res)
}

runPCalg <- function(data, dag, replicate, alpha, title) {
  n <- numNodes(dag)
  sample_size <- dim(data)[1]
  true_nedges <- sum(dag2adjacencymatrix(dag))
  myCPDAG <- pcalg::dag2cpdag(dag)

  starttime <- Sys.time()
  pc.fit <- pc(suffStat = list(dm = data,
                               adaptDF = FALSE),
                               indepTest = binCItest,
                               alpha = alpha,
                               labels = sapply(c(1:n), toString))
  endtime <- Sys.time()
  totaltime <- endtime - starttime
  comp <- compareDAGs(pc.fit@graph, myCPDAG) # c(SHD, TP, FP)
  res <- data.frame(TPR = comp[2] / true_nedges,
                        FPRn = comp[3] / true_nedges,
                        algorithm = title, # Title should be set putside i think
                        replicate = replicate,
                        alpha = alpha,
                        time=totaltime,
                        SHD = comp[1],
                        sample_size=sample_size,
                        dim=dim(data)[2])

  resdf <- cbind(res,
                   alpha = alpha,
                   SHD = comp[1])
  return(list("res" = res,
                "summary" = resdf))
}

runMMHC <- function(data, dag, replicate, alpha, title) {
  n <- numNodes(dag)
  sample_size <- dim(data)[1]
  true_nedges <- sum(dag2adjacencymatrix(dag))
  datanew <- matrixToDataframe(data, names(data))
  learn.net <- empty.graph(names(datanew))
  starttime <- Sys.time()
  mmoutput <- mmhc(datanew, restrict.args = list(alpha=alpha))
  endtime <- Sys.time()
  totaltime <- endtime - starttime
  ## convert to graphneldag
  gnel_dag <- as.graphNEL(mmoutput)
 
  comp <- compareDAGs(gnel_dag, dag)

  res <- data.frame(TPR = comp[2] / true_nedges,
                        FPRn = comp[3] / true_nedges,
                        algorithm = title, # Title should be set outside i think
                        replicate = replicate,
                        alpha = alpha,
                        time=totaltime,
                        SHD = comp[1],
                        sample_size=sample_size,
                        dim=dim(data)[2])
  return(res)
}

runGobnilp <- function(filename_data, dag, replicate, title) {
  n <- numNodes(dag)
  data <- read.csv(filename_data, sep=" ")
  sample_size <- dim(data)[1]-1
  true_nedges <- sum(dag2adjacencymatrix(dag))

  gob <- import("pygobnilp.gobnilp")
  m <- gob$Gobnilp()

  starttime <- Sys.time()
  m$learn(filename_data, plot=FALSE)
  endtime <- Sys.time()
  totaltime <- endtime - starttime
  ## convert to graphneldag
  graphstring = m$learned_bn$bnlearn_modelstring()
  gnel_dag <- as.graphNEL(model2network(graphstring))
  gnel_dag <- numeric_labels(gnel_dag) # Corrects the node labels

  comp <- compareDAGs(gnel_dag, dag)
  
  res <- data.frame(TPR = comp[2] / true_nedges,
                        FPRn = comp[3] / true_nedges,
                        algorithm = title, # Title should be set outside i think
                        replicate = replicate,
                        time=totaltime,
                        SHD = comp[1],
                        sample_size=sample_size,
                        dim=dim(data)[2])

  return(res)
}