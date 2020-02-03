PCGESsim <- function(i, n, DAGs, datas, pcalphas) {
  library(pcalg)
  library(BiDAG)
  library(graph)
  library(RBGL)
  source("lib/code_for_binary_simulations/make_name.R")
  source("lib/code_for_binary_simulations/sort_dag.R")
  source("lib/code_for_binary_simulations/ges_matrix.R")

  DAG <- DAGs[[i]]$DAG
  data <- datas[[i]]
  DAGs <- NULL
  datas <- NULL

  la <- length(pcalphas)
  pcres <- matrix(ncol = 5, nrow = la)
  colnames(pcres) <- c("TPR", "FPRn", "SHD", "Score", "threshold")
  nedges <- sum(dag2adjacencymatrix(DAG))
  myCPDAG <- pcalg::dag2cpdag(DAG)

  for (j in 1:la) {
    pc.fit <- pc(
      suffStat = list(dm = data, adaptDF = FALSE),
      indepTest = binCItest,
      alpha = pcalphas[j], labels = sapply(c(1:n), toString)
    )
    comp <- compareDAGs(pc.fit@graph, myCPDAG)
    pcres[j, 1] <- comp[2] / nedges
    pcres[j, 2] <- comp[3] / nedges
    pcres[j, 3] <- comp[1]
    pcres[j, 4] <- 0 # no score, because they are mostly CPDAGs
    pcres[j, 5] <- pcalphas[j]
  }

  simres <- list()
  simres$pc <- pcres
  simres$nedges <- nedges
  simres$sampsize <- nrow(data)
  # simsettings
  simres$DAG <- DAG
  simres$i <- i
  simres$n <- n

  return(simres)
}