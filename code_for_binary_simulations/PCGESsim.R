PCGESsim <- function(i, n, DAGfile, datafile, path = NULL) {
  library(pcalg)
  library(BiDAG)
  library(graph)
  library(RBGL)
  source("makename.R")
  source("sortdag.R")
  source("gesmatrix.R")


  DAGs <- readRDS(DAGfile)
  datas <- readRDS(datafile)
  DAG <- DAGs[[i]]$DAG
  data <- datas[[i]]
  DAGs <- NULL
  datas <- NULL

  if (n < 200) {
    pcalphas <- c(0.01, 0.05, 0.1, 0.2, 0.35)
  } else {
    pcalphas <- c(0.01, 0.05, 0.1, 0.2, 0.25)
  }
  # gesmults<-c(1,2, 5, 7, 9, 11, 15, 25)

  la <- length(pcalphas)
  # lm<-length(gesmults)


  pcres <- matrix(ncol = 5, nrow = la)
  colnames(pcres) <- c("TPR", "FPRn", "SHD", "Score", "threshold")
  # gesres<-matrix(ncol=5,nrow=lm)
  # colnames(gesres)<-c("TPR","FPRn","SHD","Score","threshold")


  if (DAGtype == "randomDAG") {
    set.seed(100 + i)
    DAG <- pcalg::randomDAG(n, avParents * 2 / n, lB = 0.4, uB = 2)
  } else {
    set.seed(100 + i)
    DAG <- pcalg::randDAG(n, d = avParents * 2, method = DAGtype, wFUN = list(runif, min = 0.1, max = 1), par1 = par1, par2 = par2)
    DAG <- sortdag(DAG, n)
  }
  nedges <- sum(dag2adjacencymatrix(DAG))
  myCPDAG <- pcalg::dag2cpdag(DAG)
  myData <- pcalg::rmvDAG(sampsize, DAG)
  myScore <- scoreparameters(n, "bge", myData)


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

  # for(j in 1:lm) {
  #   score <- new("GaussL0penObsScore", myData,lambda=gesmults[j]*log(sampsize))
  #   gesfit<-ges(score)
  #   g<-gesfit$essgraph
  #   gesgraph<-adjacency2dag(gesadjacencymatrix(g))
  #   comp<-compareDAGs(gesgraph,myCPDAG)
  #   gesres[j,1]<-comp[2]/nedges
  #   gesres[j,2]<-comp[3]/nedges
  #   gesres[j,3]<-comp[1]
  #   gesres[j,4]<-DAGscore(n,myScore,gesadjacencymatrix(gesfit$repr))
  #   gesres[j,5]<-gesmults[j]
  # }




  simres <- list()
  simres$pc <- pcres
  # simres$ges<-gesres
  # simres$truescore<-DAGscore(n,myScore,dag2adjacencymatrix(DAG))
  simres$nedges <- nedges
  simres$sampsize <- nrow(data)


  # simsettings
  simres$DAG <- DAG
  simres$i <- i
  simres$n <- n


  if (is.null(path)) {
    basename <- paste("simresults/pcges/", DAGtype, avParents, "/PCGESsim", sep = "")
  } else {
    basename <- path
  }
  saveRDS(simres, file = makeFileName(basename, c("n", "p", "s", "r"), c(n, avParents, sampsize / n, i), ".rds"))


  return(simres)
}

library(parallel)

# simulation settings, graph properties
DAGtype <- "randomDAG"
n <- 20
sampsize <- 10 * n

for (indc in 0:9) {
  ind <- c(1:10 + indc * 10)
  cl <- makeCluster(10)
  outputClApply <- clusterApply(cl, ind, PCGESsim, n, "DAGfile.rds", "datafile.rds")
  stopCluster(cl)
}
