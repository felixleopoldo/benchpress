library(RBGL)
library(pcalg)
library(BiDAG)

generatefactors <- function(nf, baselinevec, mapping) {
  prob0 <- vector(length = 2^nf)
  if (nf > 0) {
    # probability of 1 when parents are present
    prob0[1] <- runif(1, min = 0.01, max = 0.1)
  } else {
    # probability of 1 when node has no parents
    prob0[1] <- runif(1, min = baselinevec[1], max = baselinevec[2])
  }
  if (nf > 0) {
    if (4 < 5) {
      if (nf < 3) {
        factorstrength <- runif(nf, min = 0.4, max = 0.9)
        prob0[2:(2^nf)] <- (apply(
          t(t(as.matrix(mapping$partable[[nf]])) * factorstrength),
          1, sum
        ))[2:(2^nf)]
        prob0[which(prob0 > 0.95)] <- 0.95
      } else {
        factorstrength <- runif(nf, min = 0.4, max = 0.9)
        prob0[2:(2^nf)] <- (apply(
          t(t(as.matrix(mapping$partable[[nf]])) * factorstrength),
          1, sum
        ))[2:(2^nf)]
        prob0[which(prob0 > 0.95)] <- 0.95
      }
    } else {
      if (nf < 3) {
        factorstrength <- -runif(nf, min = 0.45, max = 0.85)
        prob0[2:(2^nf)] <- (apply(
          t(t(as.matrix(mapping$partable[[nf]])) * factorstrength),
          1, sum
        ))[2:(2^nf)]
        prob0[which(prob0 < 0.05)] <- 0.05
      } else {
        factorstrength <- -runif(nf, min = 0.45, max = 0.85)
        prob0[2:(2^nf)] <- (apply(
          t(t(as.matrix(mapping$partable[[nf]])) * factorstrength),
          1, sum
        ))[2:(2^nf)]
        prob0[which(prob0 < 0.05)] <- 0.05
      }
    }
  }
  return(prob0)
}

BinToDec <- function(x) {
  sum(2^(which(rev(unlist(strsplit(as.character(x), "")) == 1)) - 1))
}

BNmaps <- function(np) {
  uniquenp <- setdiff(unique(np), 0)
  maps <- list()
  maps$partable <- list()
  maps$index <- list()
  for (i in uniquenp) {
    maps$partable[[i]] <- expand.grid(rep(list(0:1), i))
    maps$index[[i]] <- apply(maps$partable[[i]], 1, BinToDec)
  }
  return(maps)
}


#' @title generatebinaryBN
#'
#' This has different DAG types (from PCalg) and tries to make sure the
#' probabilities aren't too similar when the parents change.
#' Also it has an upper limit on the number of parents - without a lot of data
#' it is almost impossible to detect the small changes in probability when
#' additional parents are there.
#'
#' @param n number of nodes
#' @param ii set seed to reproduce
#' @param baseline vector with 2 values min and max probability of 1 for nodes
#'                 which have no parents but have children (upstream)
#' @param d average neighborhood size (children+parents)
#'
generateBinaryBN <- function(mydag, baseline) {
  adj <- dag2adjacencymatrix(mydag)
  n <- numNodes(mydag)

  parlist <- list()
  np <- vector()
  for (i in 1:n) {
    parlist[[i]] <- sort(which(adj[, i] == 1))
    np[i] <- length(parlist[[i]])
  }
  mapping <- BNmaps(np)
  # to gerate data we need the ordering of the dag
  ord <- as.numeric(tsort(mydag))
  fp <- list()
  for (i in ord) {
    fp[[i]] <- generatefactors(np[i], baseline, mapping)
  }
  res <- list()
  res$DAG <- mydag
  res$adj <- adj
  res$parlist <- parlist
  res$np <- np
  res$fp <- fp
  res$ord <- ord
  res$map <- mapping
  res$skel <- 1 * (adj | t(adj))
  res$skel <- ifelse(upper.tri(res$skel) == TRUE, res$skel, 0)
  return(res)
}

generatebinaryBN.data <- function(n, binaryBN, samplesize) {
  BNsample <- matrix(ncol = n, nrow = samplesize)

  for (k in 1:samplesize) {
    for (i in binaryBN$ord) {
      if (binaryBN$np[i] == 0) { # if node has no parents sample 0/1
        if (sum(binaryBN$adj[i, ]) == 0) { # if node has no children sample 0/1
          BNsample[k, i] <- rbinom(1, 1, 0.03)
        } else {
          BNsample[k, i] <- rbinom(1, 1, binaryBN$fp[[i]][1])
        }
      } else {
        binaryvec <- BNsample[k, binaryBN$parlist[[i]]]
        BNsample[k, i] <- rbinom(
          1, 1,
          binaryBN$fp[[i]][which(binaryBN$map$index[[binaryBN$np[i]]] == BinToDec(binaryvec))]
        )
      }
    }
  }
  return(BNsample)
}
