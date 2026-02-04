# Samples dags using a modified vrsion of pcalg's randDAG, where
# the maximum average number of parents can be specified.
library(BiDAG)
library(gRbase)

library(pcalg)
library(BiDAG)

generateDAG <- function(n, e) {
  # n is number of nodes
  # e is expected number of parents
  n_offdiag <- n * (n - 1) / 2
  offdiag_vec <- rbinom(n_offdiag, 1, e * n / n_offdiag)

  DAG <- matrix(0, n, n)
  DAG[upper.tri(DAG)] <- offdiag_vec
  permy <- sample(1:n)
  return(DAG[permy, permy])
}

generateDAGs <- function(n, e, n_dags) {
  if (n_dags == 1) {
    return(generateDAGn(n, e))
  }
  dags <- c()
  for (i in seq(n_dags)) {
    dags[i] <- generateDAGn(n, e)
  }
  return(dags)
}

#' Title
#'
#' @param n Nmber of nodes
#' @param d  average neighborhood size (children+parents)
#'
#' @return
#' @export
#'
#' @examples
randDAGMaxParents <- function(n, d, method = "er", par1 = NULL, par2 = NULL,
                              DAG = TRUE, weighted = TRUE, max_parents = 5) {
  if (is.null(max_parents)) {
    adj <- 1 * (as(pcalg::randDAG(n,
      d = d, method = method,
      par1 = par1, par2 = par2, DAG = DAG
    ), "matrix") != 0)
  } else {
    adj <- NULL
    parents <- Inf
    while (parents > max_parents) {
      # here we make sure graphs do not have to big parent sets
      # here we can define the type of the graph
      adj <- 1 * (as(pcalg::randDAG(n,
        d = d, method = method,
        par1 = par1, par2 = par2, DAG = DAG
      ), "matrix") != 0)
      parents <- max(apply(adj, 2, sum))
    }
  }
  return(adj)
}

#' Generate a DAG with missingness indicator nodes
#'
#' First generates a DAG using randDAGMaxParents, then relabels n_missing nodes
#' as R_X where X is the name of another (substantive) node. The R_X nodes
#' represent missingness indicators for variable X.
#'
#' @param n Number of nodes in total (substantive + missingness indicators)
#' @param d Average neighborhood size (children+parents)
#' @param n_missing Number of nodes to relabel as missingness indicators
#' @param method Method for randDAG (default "er")
#' @param par1 Additional parameter for randDAG
#' @param par2 Additional parameter for randDAG
#' @param DAG Whether to generate a DAG (default TRUE)
#' @param weighted Whether edges are weighted (default TRUE)
#' @param max_parents Maximum number of parents per node (default 5)
#' @param max_attempts Maximum attempts to find valid configuration (default 10)
#'
#' @return Adjacency matrix with R_ prefixed node names for missingness indicators
#'
# Helper function to safely sample (handles length-1 vectors correctly)
safe_sample <- function(x, size = 1) {
  if (length(x) == 1) {
    return(x)
  }
  return(sample(x, size))
}

randMissingDAGMaxParents <- function(n, d, n_missing, method = "er", par1 = NULL, par2 = NULL,
                                     DAG = TRUE, weighted = TRUE, max_parents = 5,
                                     max_attempts = 10) {
  
  if (n_missing <= 0) {
    adj <- randDAGMaxParents(n, d, method, par1, par2, DAG, weighted, max_parents)
    colnames(adj) <- paste0("X", 1:n)
    rownames(adj) <- paste0("X", 1:n)
    return(adj)
  }
  
  if (n_missing > n / 2) {
    stop("n_missing cannot be more than half of n (need substantive variables for each R_)")
  }
  
  for (attempt in 1:max_attempts) {
    message(paste("Attempt", attempt, "of", max_attempts, "to generate valid missingness DAG"))
    
    # Generate base DAG
    adj <- randDAGMaxParents(n, d, method, par1, par2, DAG, weighted, max_parents)
    node_names <- paste0("X", 1:n)
    colnames(adj) <- node_names
    rownames(adj) <- node_names
    
    # Track which nodes are already R_ nodes and which substantive vars are "taken"
    is_R_node <- rep(FALSE, n)
    taken_substantive <- rep(FALSE, n)
    
    # Try to assign n_missing R_ nodes
    success <- TRUE
    
    for (i in 1:n_missing) {
      # Find candidate nodes that can become R_ nodes:
      # 1. Not already an R_ node
      # 2. Either a sink node OR only has R_ nodes as children
      candidates <- c()
      
      for (node in 1:n) {
        if (is_R_node[node]) next  # Already an R_ node
        
        children <- which(adj[node, ] == 1)
        
        # Check if sink node or only has R_ children
        if (length(children) == 0) {
          # Sink node - valid candidate
          candidates <- c(candidates, node)
        } else if (length(children) > 0 && all(is_R_node[children])) {
          # Only has R_ nodes as children - valid candidate
          candidates <- c(candidates, node)
        }
      }
      
      if (length(candidates) == 0) {
        success <- FALSE
        break
      }
      
      # Shuffle candidates to randomize selection
      candidates <- safe_sample(candidates, length(candidates))
      
      # Find a valid (candidate, substantive) pair where:
      # - substantive is not taken
      # - candidate is not a neighbor of substantive
      found_pair <- FALSE
      
      for (cand in candidates) {
        # Get neighbors of candidate (parents and children)
        neighbors <- which(adj[cand, ] == 1 | adj[, cand] == 1)
        
        # Find available substantive variables that are not neighbors of candidate
        available_substantive <- which(!taken_substantive & !is_R_node & (1:n) != cand)
        available_substantive <- setdiff(available_substantive, neighbors)
        
        if (length(available_substantive) > 0) {
          # Pick a random substantive variable
          subst <- safe_sample(available_substantive, 1)
          
          # Relabel candidate as R_<substantive_name>
          is_R_node[cand] <- TRUE
          taken_substantive[subst] <- TRUE
          node_names[cand] <- paste0("R_", node_names[subst])
          
          found_pair <- TRUE
          break
        }
      }
      
      if (!found_pair) {
        success <- FALSE
        break
      }
    }
    
    if (success) {
      colnames(adj) <- node_names
      rownames(adj) <- node_names
      
      # Final validation: ensure no R_ node has substantive children
      # and no R_X is adjacent to X
      valid <- TRUE
      for (node in 1:n) {
        if (is_R_node[node]) {
          children <- which(adj[node, ] == 1)
          # Check: R_ nodes should not have substantive children
          for (child in children) {
            if (!is_R_node[child]) {
              valid <- FALSE
              break
            }
          }
          if (!valid) break
          
          # Check: R_X should not be adjacent to X
          # Extract the substantive variable name from R_X
          r_name <- node_names[node]  # e.g., "R_X3"
          subst_name <- sub("^R_", "", r_name)  # e.g., "X3"
          subst_idx <- which(node_names == subst_name)
          if (length(subst_idx) > 0) {
            # Check if node and subst_idx are neighbors
            if (adj[node, subst_idx] == 1 || adj[subst_idx, node] == 1) {
              valid <- FALSE
              break
            }
          }
        }
      }
      
      if (valid) {
        message("Successfully generated valid missingness DAG")
        return(adj)
      } else {
        message("Validation failed, retrying...")
      }
    }
  }
  
  stop(paste("Could not find valid missingness DAG configuration after", max_attempts, "attempts. Try increasing n or decreasing n_missing."))
}



filename <- snakemake@output[["adjmat"]]
n <- as.integer(snakemake@wildcards[["n"]])
d <- as.integer(snakemake@wildcards[["d"]])
n_missing <- as.integer(snakemake@wildcards[["n_missing"]])
par1 <- NULL
if (snakemake@wildcards[["par1"]] != "None") {
  par1 <- as.integer(snakemake@wildcards[["par1"]])
}
par2 <- NULL
if (snakemake@wildcards[["par2"]] != "None") {
  par2 <- as.integer(snakemake@wildcards[["par2"]])
}
max_parents <- NULL
if (snakemake@wildcards[["max_parents"]] != "None") {
  max_parents <- as.integer(snakemake@wildcards[["max_parents"]])
}

DAG <- as.logical(snakemake@wildcards[["DAG"]])
method <- snakemake@wildcards[["method"]]
seed_number <- as.integer(snakemake@wildcards[["seed"]])

set.seed(seed_number)
adjmat <- randMissingDAGMaxParents(
  n = n, d = d, n_missing = n_missing, par1 = par1, par2 = par2,
  method = method, max_parents = max_parents, DAG = DAG
)

colnames(adjmat) <- as.character(colnames(adjmat))

write.table(adjmat,
  file = filename, row.names = FALSE,
  quote = FALSE, col.names = TRUE, sep = ","
)
