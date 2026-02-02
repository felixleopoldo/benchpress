library(RBGL)
library(pcalg)
library(BiDAG)

#' Generate probability of state 1 for each parent configuration
#' @param nf number of parents
#' @param baselinevec vector with min/max for baseline probability
#' @param mapping mapping object from BNmaps
#' @param collider_effect logical: if TRUE, use OR-gate-like collider effects for nodes with 2+ parents
#' @param strong_effects logical: if TRUE, make all parent-child relationships strong
#' @param noisy_or logical: if TRUE, use noisy-OR parameterization for proper explaining away
#' @return vector of probabilities P(node=1) for each parent configuration
generatefactors <- function(nf, baselinevec, mapping, collider_effect = FALSE, strong_effects = FALSE, noisy_or = FALSE) {
  prob0 <- vector(length = 2^nf)
  if (nf > 0) {
    # probability of 1 when all parents are 0 (baseline)
    prob0[1] <- runif(1, min = 0.01, max = 0.1)
  } else {
    # probability of 1 when node has no parents
    prob0[1] <- runif(1, min = baselinevec[1], max = baselinevec[2])
  }
  if (nf > 0) {
    if (noisy_or) {
      # Noisy-OR model: P(child=1|parents) = 1 - (1-leak) * prod((1-p_i)^parent_i)
      # Creates proper "explaining away" effects
      leak <- prob0[1]  # baseline when all parents are 0
      parent_activation_probs <- runif(nf, min = 0.5, max = 0.8)
      
      for (config in 2:(2^nf)) {
        parent_states <- as.numeric(mapping$partable[[nf]][config, ])
        prob_child_0 <- (1 - leak)
        for (j in 1:nf) {
          if (parent_states[j] > 0) {
            prob_child_0 <- prob_child_0 * (1 - parent_activation_probs[j])
          }
        }
        prob0[config] <- 1 - prob_child_0
        prob0[config] <- max(0.01, min(0.99, prob0[config]))
      }
    } else {
      # Determine if we should use strong effects
      use_strong <- (collider_effect && nf >= 2) || strong_effects
      
      if (use_strong) {
        # Strong effect: P(node=1) is high (~0.7-0.95) if ANY parent is active
        high_prob <- runif(1, min = 0.7, max = 0.95)
        for (config in 2:(2^nf)) {
          # Get parent states for this configuration
          parent_states <- as.numeric(mapping$partable[[nf]][config, ])
          any_parent_active <- any(parent_states > 0)
          if (any_parent_active) {
            # Add small random variation
            prob0[config] <- high_prob + runif(1, min = -0.05, max = 0.05)
            prob0[config] <- max(0.6, min(0.95, prob0[config]))
          } else {
            prob0[config] <- prob0[1]  # Use baseline (shouldn't happen for config > 1)
          }
        }
      } else {
        # Default additive influence model
        if (nf < 3) {
          factorstrength <- runif(nf, min = 0.4, max = 0.9)
        } else {
          factorstrength <- runif(nf, min = 0.4, max = 0.9)
        }
        prob0[2:(2^nf)] <- (apply(
          t(t(as.matrix(mapping$partable[[nf]])) * factorstrength),
          1, sum
        ))[2:(2^nf)]
        prob0[which(prob0 > 0.95)] <- 0.95
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
#' @param mydag DAG object (from pcalg or BiDAG)
#' @param baseline vector with 2 values min and max probability of 1 for nodes
#'                 which have no parents but have children (upstream)
#' @param collider_effect logical: if TRUE, nodes with 2+ parents use OR-gate-like effects
#'                        where P(node=1) is high (~0.7-0.95) if ANY parent is active.
#'                        Default: FALSE.
#' @param strong_effects logical: if TRUE, make ALL parent-child relationships strong.
#'                       Default: FALSE.
#' @param noisy_or logical: if TRUE, use noisy-OR parameterization for proper explaining away.
#'                 Default: FALSE.
#'
generateBinaryBN <- function(mydag, baseline, collider_effect = FALSE, strong_effects = FALSE, noisy_or = FALSE) {
  # Validate mutually exclusive options
  if (noisy_or && (collider_effect || strong_effects)) {
    stop("noisy_or cannot be combined with collider_effect or strong_effects. Use only one parameterization strategy.")
  }
  
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
    fp[[i]] <- generatefactors(np[i], baseline, mapping, collider_effect = collider_effect, strong_effects = strong_effects, noisy_or = noisy_or)
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
