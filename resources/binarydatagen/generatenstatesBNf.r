library(RBGL)
library(pcalg)
library(BiDAG)

#' Convert a state vector to decimal index (base-n conversion)
#' @param x vector of states (e.g., c(0,1,2) for 3 states)
#' @param nstates number of states (base)
#' @return decimal index
BaseNToDec <- function(x, nstates) {
  len <- length(x)
  if (len == 0) return(0)
  sum(x * (nstates^(seq(len - 1, 0, by = -1))))
}

#' Generate probability distributions for each parent configuration
#' @param nf number of parents
#' @param nstates number of states for the child node
#' @param baselinevec vector with concentration parameters for baseline distribution
#'                   (when node has no parents). If length 2, treated as min/max for uniform sampling.
#'                   If length nstates, used as Dirichlet parameters.
#' @param mapping mapping object from BNmaps
#' @param nconfigs optional: number of parent configurations (if not provided, calculated as nstates^nf)
#' @param collider_effect logical: if TRUE, use OR-gate-like collider effects for nodes with multiple parents
#'                        (P(child=1) is high if ANY parent is active). Default FALSE uses additive influence.
#' @param strong_effects logical: if TRUE, make all parent-child relationships strong (P(child=1|parent=1) ~ 0.7-0.95).
#'                       Useful for ensuring induced dependencies through collider descendants are detectable.
#'                       Default FALSE uses moderate additive influence.
#' @param noisy_or logical: if TRUE, use noisy-OR parameterization for nodes with parents.
#'                 P(child=1|parents) = 1 - (1-baseline) * prod((1-p_i)^parent_i) where p_i is the 
#'                 activation probability for parent i. Creates proper "explaining away" effects at colliders.
#'                 Default FALSE.
#' @return matrix of size nstates x nconfigs, where each column is a probability distribution
generatefactors <- function(nf, nstates, baselinevec, mapping, nconfigs = NULL, collider_effect = FALSE, strong_effects = FALSE, noisy_or = FALSE) {
  # Validate inputs
  if (is.na(nstates) || !is.numeric(nstates) || nstates < 1) {
    stop("nstates must be a positive numeric value")
  }
  if (is.na(nf) || !is.numeric(nf) || nf < 0) {
    stop("nf must be a non-negative numeric value")
  }
  
  if (is.null(nconfigs)) {
    nconfigs <- nstates^nf
  }
  
  # Validate nconfigs
  if (is.na(nconfigs) || !is.numeric(nconfigs) || nconfigs < 1 || !is.finite(nconfigs)) {
    stop(paste("Invalid nconfigs value:", nconfigs, "for nf =", nf, "nstates =", nstates))
  }
  
  # Initialize probability matrix: rows = states, cols = parent configurations
  probmat <- matrix(0, nrow = nstates, ncol = nconfigs)
  
  if (nf == 0) {
    # No parents: generate baseline distribution
    if (length(baselinevec) == 2) {
      if (nstates == 2) {
        # Binary-compatible: sample P(state=1) from [min, max], P(state=0) = 1 - P(state=1)
        # This matches the behavior of generateBinaryBN
        prob_state1 <- runif(1, min = baselinevec[1], max = baselinevec[2])
        probmat[1, 1] <- 1 - prob_state1  # P(state=0)
        probmat[2, 1] <- prob_state1       # P(state=1)
      } else {
        # For n > 2 states: sample each state probability independently
        for (s in 1:nstates) {
          probmat[s, 1] <- runif(1, min = baselinevec[1], max = baselinevec[2])
        }
        # Normalize to sum to 1
        probmat[, 1] <- probmat[, 1] / sum(probmat[, 1])
      }
    } else if (length(baselinevec) == nstates) {
      # Dirichlet approach: use baselinevec as concentration parameters
      probmat[, 1] <- rdirichlet(1, baselinevec)
    } else {
      # Default: uniform distribution
      probmat[, 1] <- rep(1/nstates, nstates)
    }
  } else {
    # Generate baseline for first configuration (all parents in state 0)
    # Use LOW probabilities here to create contrast with active parent configurations
    # This ensures dependencies are detectable when estimating from data
    if (length(baselinevec) == 2) {
      if (nstates == 2) {
        # Binary-compatible: P(state=1) is low when all parents are 0
        # This creates strong contrast with configurations where parents are active
        prob_state1 <- runif(1, min = 0.01, max = 0.1)
        probmat[1, 1] <- 1 - prob_state1  # P(state=0)
        probmat[2, 1] <- prob_state1       # P(state=1)
      } else {
        # For n > 2 states: use low probabilities for baseline config
        for (s in 1:nstates) {
          probmat[s, 1] <- runif(1, min = 0.01, max = 0.1)
        }
        probmat[, 1] <- probmat[, 1] / sum(probmat[, 1])
      }
    } else if (length(baselinevec) == nstates) {
      probmat[, 1] <- rdirichlet(1, baselinevec * 0.1)  # Lower concentration for baseline
    } else {
      probmat[, 1] <- rep(1/nstates, nstates)
    }
    
    # Generate distributions for other parent configurations
    if (nconfigs > 1) {
      # For collider effect or strong effects, generate a high probability for state 1 when parents are active
      if ((collider_effect || strong_effects) && nstates == 2 && !noisy_or) {
        # High prob when parent(s) active
        high_prob <- runif(1, min = 0.7, max = 0.95)
      }
      
      # For noisy-OR, generate activation probabilities for each parent
      if (noisy_or && nstates == 2) {
        # Each parent has an activation probability p_i
        # P(child=1|parents) = 1 - (1-leak) * prod((1-p_i)^parent_i)
        leak <- probmat[2, 1]  # baseline P(child=1) when all parents are 0
        parent_activation_probs <- runif(nf, min = 0.5, max = 0.8)
      }
      
      for (config in 2:nconfigs) {
        # Get parent states for this configuration
        # Handle both standard mapping (list structure) and mixed parent states (direct data frame)
        if (is.list(mapping$partable) && !is.null(mapping$partable[[nf]])) {
          parent_states <- as.numeric(mapping$partable[[nf]][config, ])
        } else if (is.data.frame(mapping$partable)) {
          # Direct data frame (mixed parent states case)
          parent_states <- as.numeric(mapping$partable[config, ])
        } else {
          stop("Invalid mapping structure in generatefactors")
        }
        
        if (noisy_or && nstates == 2) {
          # Noisy-OR model: P(child=0|parents) = (1-leak) * prod((1-p_i)^parent_i)
          # This creates proper "explaining away" effects
          prob_child_0 <- (1 - leak)
          for (j in 1:nf) {
            if (parent_states[j] > 0) {
              prob_child_0 <- prob_child_0 * (1 - parent_activation_probs[j])
            }
          }
          prob_state1 <- 1 - prob_child_0
          # Ensure reasonable bounds
          prob_state1 <- max(0.01, min(0.99, prob_state1))
          probmat[1, config] <- 1 - prob_state1  # P(state=0)
          probmat[2, config] <- prob_state1       # P(state=1)
        } else {
          # Use strong effects for:
          # - collider_effect with 2+ parents (OR-gate)
          # - strong_effects with any number of parents
          use_strong <- (collider_effect && nf >= 2 && nstates == 2) || (strong_effects && nstates == 2)
          
          if (use_strong) {
            # Strong effect: P(child=1) is high if ANY parent is in state 1
            any_parent_active <- any(parent_states > 0)
            if (any_parent_active) {
              # Add small random variation to high_prob
              prob_state1 <- high_prob + runif(1, min = -0.05, max = 0.05)
              prob_state1 <- max(0.6, min(0.95, prob_state1))  # Keep in reasonable range
              probmat[1, config] <- 1 - prob_state1  # P(state=0)
              probmat[2, config] <- prob_state1       # P(state=1)
            } else {
              # No parent active: use baseline (this shouldn't happen for config > 1, but just in case)
              probmat[, config] <- probmat[, 1]
            }
          } else {
            # Default additive influence model
            # Generate factor strengths (how much each parent influences each state)
            if (nf < 3) {
              factorstrength <- runif(nf * nstates, min = 0.4, max = 0.9)
            } else {
              factorstrength <- runif(nf * nstates, min = 0.3, max = 0.7)
            }
            
            # Reshape factor strength into matrix: rows = states, cols = parents
            factormat <- matrix(factorstrength, nrow = nstates, ncol = nf)
            
            # Compute influence: for each state, sum contributions from active parents
            influence <- numeric(nstates)
            for (s in 1:nstates) {
              # Weight parent contributions by their state values
              influence[s] <- sum(factormat[s, ] * (parent_states + 1) / nstates)
            }
            
            # Convert influence to probabilities (softmax-like transformation)
            # Add baseline and normalize
            probmat[, config] <- probmat[, 1] + influence
            probmat[, config] <- pmax(probmat[, config], 0.01)  # Ensure minimum probability
            probmat[, config] <- probmat[, config] / sum(probmat[, config])  # Normalize
            
            # Ensure probabilities are in reasonable range
            probmat[which(probmat[, config] > 0.95), config] <- 0.95
            probmat[which(probmat[, config] < 0.01), config] <- 0.01
            probmat[, config] <- probmat[, config] / sum(probmat[, config])  # Renormalize
          }
        }
      }
    }
  }
  
  return(probmat)
}

#' Helper function to sample from Dirichlet distribution
#' @param n number of samples
#' @param alpha concentration parameters
#' @return matrix of samples
rdirichlet <- function(n, alpha) {
  if (length(alpha) == 1) alpha <- rep(alpha, n)
  x <- matrix(rgamma(n * length(alpha), alpha), nrow = n, byrow = TRUE)
  return(x / rowSums(x))
}

#' Generate mapping tables for parent configurations
#' @param np vector of number of parents for each node
#' @param nstates number of states
#' @return list with partable (parent state combinations) and index (decimal indices)
BNmaps <- function(np, nstates) {
  uniquenp <- setdiff(unique(np), 0)
  maps <- list()
  maps$partable <- list()
  maps$index <- list()
  for (i in uniquenp) {
    maps$partable[[i]] <- expand.grid(rep(list(0:(nstates-1)), i))
    maps$index[[i]] <- apply(maps$partable[[i]], 1, function(x) BaseNToDec(x, nstates))
  }
  return(maps)
}

#' @title generateNStatesBN
#'
#' Generate a Bayesian Network with n states per node (generalization of generateBinaryBN).
#' This has different DAG types (from PCalg) and tries to make sure the
#' probabilities aren't too similar when the parents change.
#' Also it has an upper limit on the number of parents - without a lot of data
#' it is almost impossible to detect the small changes in probability when
#' additional parents are there.
#'
#' @param mydag DAG object (from pcalg or BiDAG)
#' @param nstates number of states per node (default: 2 for binary)
#' @param baseline vector with baseline parameters for nodes with no parents.
#'                 If length 2, treated as min/max for uniform sampling of state probabilities.
#'                 If length nstates, used as Dirichlet concentration parameters.
#'                 Default: c(0.1, 0.3) for uniform sampling approach.
#' @param collider_effect logical: if TRUE, nodes with multiple parents use OR-gate-like effects
#'                        where P(child=1) is high (~0.7-0.95) if ANY parent is active.
#'                        This creates strong "explaining away" effects useful for testing
#'                        conditional independence when conditioning on collider descendants.
#'                        Default: FALSE (uses additive influence model).
#' @param strong_effects logical: if TRUE, make ALL parent-child relationships strong
#'                       (P(child=1|parent=1) ~ 0.7-0.95), not just colliders. This ensures
#'                       induced dependencies through collider descendants are detectable.
#'                       Default: FALSE.
#' @param noisy_or logical: if TRUE, use noisy-OR parameterization for nodes with parents.
#'                 P(child=1|parents) = 1 - (1-leak) * prod((1-p_i)^parent_i).
#'                 Creates proper "explaining away" effects at colliders while maintaining
#'                 faithfulness. Recommended for testing conditional independence.
#'                 Default: FALSE.
#'
#' @return list containing:
#'   - DAG: the DAG object
#'   - adj: adjacency matrix
#'   - parlist: list of parents for each node
#'   - np: vector of number of parents for each node
#'   - fp: list of probability matrices (one per node)
#'   - ord: topological ordering
#'   - map: mapping object
#'   - skel: skeleton (undirected graph)
#'   - nstates: number of states
generateNStatesBN <- function(mydag, nstates = 2, baseline = c(0.1, 0.3), collider_effect = FALSE, strong_effects = FALSE, noisy_or = FALSE) {
  adj <- dag2adjacencymatrix(mydag)
  n <- numNodes(mydag)

  # Validate nstates parameter
  if (is.na(nstates) || !is.numeric(nstates) || nstates < 2) {
    stop("nstates must be a numeric value >= 2")
  }
  
  # Get node names from adjacency matrix column names (they should be preserved from DAG)
  node_names <- colnames(adj)
  if (is.null(node_names) || length(node_names) != n || any(is.na(node_names)) || any(nchar(node_names) == 0)) {
    # Fall back to DAG nodes if column names not available
    node_names <- nodes(mydag)
    if (is.null(node_names) || length(node_names) == 0 || any(is.na(node_names))) {
      node_names <- as.character(1:n)
    }
    # Set adjacency matrix column and row names
    colnames(adj) <- node_names
    rownames(adj) <- node_names
  }
  
  # Handle any NA values in node_names
  if (any(is.na(node_names))) {
    na_indices <- which(is.na(node_names))
    node_names[na_indices] <- as.character(na_indices)
  }
  
  # Identify R_ nodes (missingness indicators) - handle any NA values
  is_R_node <- rep(FALSE, length(node_names))
  for (i in seq_along(node_names)) {
    if (!is.na(node_names[i]) && startsWith(node_names[i], "R_")) {
      is_R_node[i] <- TRUE
    }
  }
  
  # Determine effective nstates for each node (R_ nodes are always binary)
  node_nstates <- ifelse(is_R_node, 2, nstates)
  # Ensure no NAs - convert to numeric and replace any NAs
  node_nstates <- as.numeric(node_nstates)
  if (any(is.na(node_nstates))) {
    node_nstates[is.na(node_nstates)] <- nstates
  }

  parlist <- list()
  np <- vector()
  for (i in 1:n) {
    parlist[[i]] <- sort(which(adj[, i] == 1))
    np[i] <- length(parlist[[i]])
  }
  
  # Create mappings for each node based on its parents' states
  # For each node, we need to know the nstates of each of its parents
  node_mappings <- list()
  for (i in 1:n) {
    if (np[i] > 0) {
      # Get the effective nstates of each parent
      parent_nstates <- node_nstates[parlist[[i]]]
      # Create mapping based on parent states
      # If all parents have same nstates, use standard mapping
      if (length(unique(parent_nstates)) == 1) {
        parent_nstates_val <- parent_nstates[1]
        node_mappings[[i]] <- BNmaps(np[i], parent_nstates_val)
      } else {
        # Mixed parent states: create custom mapping
        # Generate all combinations of parent states
        parent_combos <- expand.grid(lapply(parent_nstates, function(ns) 0:(ns-1)))
        # Convert each combination to an index
        indices <- apply(parent_combos, 1, function(combo) {
          # Convert to base-n index where n is the max parent nstates
          max_ns <- max(parent_nstates)
          BaseNToDec(combo, max_ns)
        })
        node_mappings[[i]] <- list(partable = parent_combos, index = indices, parent_nstates = parent_nstates)
      }
    }
  }
  
  # Global mapping for nodes with no parents (or for backward compatibility)
  mapping <- BNmaps(np, nstates)
  
  # to generate data we need the ordering of the dag
  # tsort returns node names, so we need to convert them to indices
  ord_names <- tsort(mydag)
  # Convert node names to indices
  ord <- match(ord_names, node_names)
  # Validate ordering
  if (any(is.na(ord))) {
    stop(paste("Error in topological ordering: could not match nodes", 
               paste(ord_names[is.na(ord)], collapse=", "), "to node_names"))
  }
  
  fp <- list()
  for (i in ord) {
    # Use node-specific nstates (2 for R_ nodes, nstates otherwise)
    node_states <- node_nstates[i]
    
    # Validate node_states
    if (is.na(node_states) || !is.numeric(node_states) || node_states < 1) {
      stop(paste("Invalid node_states for node", i, ":", node_states, 
                 "(node_nstates[i] =", node_nstates[i], ", nstates =", nstates, ")"))
    }
    
    # For nodes with parents, use node-specific mapping if available
    if (np[i] > 0 && !is.null(node_mappings[[i]])) {
      # Create a temporary mapping structure compatible with generatefactors
      # We need to handle the case where parents might have different nstates
      temp_mapping <- node_mappings[[i]]
      # For generatefactors, we'll use the max parent nstates for the mapping
      # but generate factors for the child's nstates
      if ("parent_nstates" %in% names(temp_mapping)) {
        # Mixed parent states case: need to generate factors with correct number of configs
        # The number of configurations is the product of parent nstates
        if (is.null(temp_mapping$partable) || !is.data.frame(temp_mapping$partable)) {
          stop(paste("Invalid partable for node", i, "with mixed parent states"))
        }
        nconfigs_mixed <- nrow(temp_mapping$partable)
        if (is.na(nconfigs_mixed) || nconfigs_mixed <= 0) {
          stop(paste("Invalid number of configurations for node", i))
        }
        temp_mapping_std <- list()
        temp_mapping_std$partable <- list()
        temp_mapping_std$index <- list()
        temp_mapping_std$partable[[np[i]]] <- temp_mapping$partable
        temp_mapping_std$index[[np[i]]] <- temp_mapping$index
        # Generate factors with correct dimensions
        fp[[i]] <- generatefactors(np[i], node_states, baseline, temp_mapping_std, nconfigs = nconfigs_mixed, collider_effect = collider_effect, strong_effects = strong_effects, noisy_or = noisy_or)
      } else {
        # All parents have same nstates - need to calculate nconfigs based on parent nstates
        parent_nstates_val <- node_nstates[parlist[[i]]][1]
        nconfigs_parent <- parent_nstates_val^np[i]
        fp[[i]] <- generatefactors(np[i], node_states, baseline, temp_mapping, nconfigs = nconfigs_parent, collider_effect = collider_effect, strong_effects = strong_effects, noisy_or = noisy_or)
      }
    } else {
      # No parents or use standard mapping
      fp[[i]] <- generatefactors(np[i], node_states, baseline, mapping, collider_effect = collider_effect, strong_effects = strong_effects, noisy_or = noisy_or)
    }
  }
  
  res <- list()
  res$DAG <- mydag
  res$adj <- adj
  res$parlist <- parlist
  res$np <- np
  res$fp <- fp
  res$ord <- ord
  res$map <- mapping
  res$node_mappings <- node_mappings  # Store node-specific mappings
  res$node_nstates <- node_nstates    # Store nstates for each node
  res$skel <- 1 * (adj | t(adj))
  res$skel <- ifelse(upper.tri(res$skel) == TRUE, res$skel, 0)
  res$nstates <- nstates  # Global nstates (for backward compatibility)
  return(res)
}

#' Generate data from an n-states Bayesian Network
#' @param n number of nodes
#' @param nstatesBN the BN object returned by generateNStatesBN
#' @param samplesize number of samples to generate
#' @return matrix of samples (rows = samples, cols = nodes)
generateNStatesBN.data <- function(n, nstatesBN, samplesize) {
  nstates <- nstatesBN$nstates
  node_nstates <- nstatesBN$node_nstates
  BNsample <- matrix(ncol = n, nrow = samplesize)

  for (k in 1:samplesize) {
    for (i in nstatesBN$ord) {
      # Get the effective nstates for this node (2 for R_ nodes, nstates otherwise)
      node_states <- node_nstates[i]
      
      if (nstatesBN$np[i] == 0) {
        # Node has no parents
        if (sum(nstatesBN$adj[i, ]) == 0) {
          # Node has no children: sample from uniform distribution
          BNsample[k, i] <- sample(0:(node_states-1), 1, prob = rep(1/node_states, node_states))
        } else {
          # Node has parents but no children: use baseline distribution
          prob_dist <- nstatesBN$fp[[i]][, 1]
          BNsample[k, i] <- sample(0:(node_states-1), 1, prob = prob_dist)
        }
      } else {
        # Node has parents: look up parent configuration and sample accordingly
        parent_states <- BNsample[k, nstatesBN$parlist[[i]]]
        
        # Use node-specific mapping if available (for mixed parent nstates)
        if (!is.null(nstatesBN$node_mappings[[i]])) {
          node_mapping <- nstatesBN$node_mappings[[i]]
          
          # Find matching parent configuration
          if ("parent_nstates" %in% names(node_mapping)) {
            # Mixed parent states case: match parent states directly
            parent_combos <- node_mapping$partable
            # Find row where parent states match
            config_idx <- which(apply(parent_combos, 1, function(row) all(row == parent_states)))
          } else {
            # All parents have same nstates: use index lookup
            parent_nstates_val <- node_nstates[nstatesBN$parlist[[i]]][1]
            parent_index <- BaseNToDec(parent_states, parent_nstates_val)
            config_idx <- which(node_mapping$index[[nstatesBN$np[i]]] == parent_index)
          }
        } else {
          # Use standard mapping (all parents have same nstates as global)
          parent_index <- BaseNToDec(parent_states, nstates)
          config_idx <- which(nstatesBN$map$index[[nstatesBN$np[i]]] == parent_index)
        }
        
        if (length(config_idx) == 0 || config_idx[1] > ncol(nstatesBN$fp[[i]])) {
          # Fallback: use uniform distribution if configuration not found
          BNsample[k, i] <- sample(0:(node_states-1), 1, prob = rep(1/node_states, node_states))
        } else {
          # Sample from the appropriate probability distribution
          prob_dist <- nstatesBN$fp[[i]][, config_idx[1]]
          BNsample[k, i] <- sample(0:(node_states-1), 1, prob = prob_dist)
        }
      }
    }
  }
  return(BNsample)
}
