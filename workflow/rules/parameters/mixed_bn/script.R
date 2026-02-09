library(argparser)

# Helper function to sample from Dirichlet
rdirichlet <- function(n, alpha) {
  if (length(alpha) == 1) alpha <- rep(alpha, n)
  x <- matrix(rgamma(n * length(alpha), alpha), nrow = n, byrow = TRUE)
  return(x / rowSums(x))
}

#' Generate parameters for a mixed Bayesian network
#' 
#' Based on Andrews et al. "Scoring Bayesian Networks of Mixed Variables"
#' - Continuous variables: linear regression with partitioning on discrete parents
#' - Discrete variables: CPT with discretized continuous parents
#'
#' @param adj Adjacency matrix of the DAG
#' @param node_types Character vector: "continuous" or "discrete" for each node
#' @param n_levels Integer vector: number of levels for discrete nodes (ignored for continuous)
#' @param n_bins_range Range for number of bins when discretizing continuous parents (default 2:5)
#' @param coef_range Range for regression coefficients (default c(-1, 1))
#' @param noise_sd_range Range for noise standard deviation (default c(0.5, 1.5))
#' @param dirichlet_alpha Concentration parameter for Dirichlet (default 1)
#' @return List containing all parameters needed for data generation
generateMixedBN <- function(adj, node_types, n_levels = NULL, 
                            n_bins_range = c(2, 5),
                            coef_range = c(-1, 1),
                            noise_sd_range = c(0.5, 1.5),
                            dirichlet_alpha = 1) {
  
  n <- ncol(adj)
  node_names <- colnames(adj)
  
  if (is.null(node_names)) {
    node_names <- paste0("X", 1:n)
    colnames(adj) <- node_names
    rownames(adj) <- node_names
  }
  
  # Default n_levels for discrete nodes
  if (is.null(n_levels)) {
    n_levels <- rep(2, n)  # Default to binary
  }
  
  # Get parent list for each node
  parlist <- list()
  for (i in 1:n) {
    parlist[[i]] <- which(adj[, i] == 1)
  }
  
  # Get topological order
  # Simple implementation: nodes with no parents first, then iterate
  remaining <- 1:n
  ord <- c()
  while (length(remaining) > 0) {
    for (i in remaining) {
      parents_in_remaining <- intersect(parlist[[i]], remaining)
      if (length(parents_in_remaining) == 0) {
        ord <- c(ord, i)
        remaining <- setdiff(remaining, i)
        break
      }
    }
  }
  
  # Initialize parameter storage
  params <- list()
  params$adj <- adj
  params$node_names <- node_names
  params$node_types <- node_types
  params$n_levels <- n_levels
  params$ord <- ord
  params$parlist <- parlist
  params$node_params <- list()
  
  for (i in 1:n) {
    parents <- parlist[[i]]
    node_type <- node_types[i]
    
    if (length(parents) == 0) {
      # Node without parents
      if (node_type == "continuous") {
        # Sample from N(0, 1) - just store mean and sd
        params$node_params[[i]] <- list(
          type = "continuous_root",
          mean = 0,
          sd = runif(1, noise_sd_range[1], noise_sd_range[2])
        )
      } else {
        # Discrete root: sample marginal distribution from Dirichlet
        n_lev <- n_levels[i]
        probs <- as.vector(rdirichlet(1, rep(dirichlet_alpha, n_lev)))
        params$node_params[[i]] <- list(
          type = "discrete_root",
          n_levels = n_lev,
          probs = probs
        )
      }
    } else {
      # Node with parents
      parent_types <- node_types[parents]
      discrete_parents <- parents[parent_types == "discrete"]
      continuous_parents <- parents[parent_types == "continuous"]
      
      if (node_type == "continuous") {
        # Continuous node with parents
        # Partition by discrete parents, linear regression on continuous parents
        
        if (length(discrete_parents) == 0) {
          # Only continuous parents: single linear regression
          n_cont <- length(continuous_parents)
          coefs <- runif(n_cont, coef_range[1], coef_range[2])
          intercept <- runif(1, -1, 1)
          noise_sd <- runif(1, noise_sd_range[1], noise_sd_range[2])
          
          params$node_params[[i]] <- list(
            type = "continuous_regression",
            continuous_parents = continuous_parents,
            discrete_parents = integer(0),
            n_partitions = 1,
            coefs = list(coefs),  # List of coefficient vectors, one per partition
            intercepts = intercept,
            noise_sd = noise_sd
          )
        } else {
          # Mixed parents: partition by discrete, regress on continuous
          discrete_levels <- n_levels[discrete_parents]
          n_partitions <- prod(discrete_levels)
          
          # Generate coefficients for each partition
          n_cont <- length(continuous_parents)
          coefs_list <- list()
          intercepts <- numeric(n_partitions)
          
          for (p in 1:n_partitions) {
            if (n_cont > 0) {
              coefs_list[[p]] <- runif(n_cont, coef_range[1], coef_range[2])
            } else {
              coefs_list[[p]] <- numeric(0)
            }
            intercepts[p] <- runif(1, -2, 2)
          }
          
          noise_sd <- runif(1, noise_sd_range[1], noise_sd_range[2])
          
          params$node_params[[i]] <- list(
            type = "continuous_regression",
            continuous_parents = continuous_parents,
            discrete_parents = discrete_parents,
            discrete_parent_levels = discrete_levels,
            n_partitions = n_partitions,
            coefs = coefs_list,
            intercepts = intercepts,
            noise_sd = noise_sd
          )
        }
      } else {
        # Discrete node with parents
        # Need to handle continuous parents via discretization
        
        n_lev <- n_levels[i]
        
        # Determine number of bins for each continuous parent
        n_bins <- integer(length(continuous_parents))
        for (j in seq_along(continuous_parents)) {
          n_bins[j] <- sample(n_bins_range[1]:n_bins_range[2], 1)
        }
        
        # Calculate CPT dimensions
        # Rows: child levels
        # Cols: all parent configurations
        discrete_levels <- if (length(discrete_parents) > 0) n_levels[discrete_parents] else integer(0)
        
        # Total parent configurations
        all_parent_dims <- c(n_bins, discrete_levels)
        if (length(all_parent_dims) == 0) {
          n_configs <- 1
        } else {
          n_configs <- prod(all_parent_dims)
        }
        
        # Sample CPT from Dirichlet for each parent configuration
        cpt <- matrix(0, nrow = n_lev, ncol = n_configs)
        for (config in 1:n_configs) {
          cpt[, config] <- as.vector(rdirichlet(1, rep(dirichlet_alpha, n_lev)))
        }
        
        params$node_params[[i]] <- list(
          type = "discrete_cpt",
          n_levels = n_lev,
          continuous_parents = continuous_parents,
          discrete_parents = discrete_parents,
          n_bins = n_bins,  # Number of bins for each continuous parent
          discrete_parent_levels = discrete_levels,
          parent_dims = all_parent_dims,  # Dimensions for indexing CPT
          cpt = cpt
        )
      }
    }
  }
  
  return(params)
}


# Main script
p <- arg_parser("Generate parameters for mixed Bayesian network")
p <- add_argument(p, "--filename_dag", help = "Input DAG adjacency matrix")
p <- add_argument(p, "--filename", help = "Output filename for parameters")
p <- add_argument(p, "--seed", help = "Random seed", type = "numeric")
p <- add_argument(p, "--prob_discrete", help = "Probability a node is discrete", type = "numeric", default = 0.5)
p <- add_argument(p, "--min_levels", help = "Minimum levels for discrete nodes", type = "numeric", default = 2)
p <- add_argument(p, "--max_levels", help = "Maximum levels for discrete nodes", type = "numeric", default = 5)
p <- add_argument(p, "--min_bins", help = "Minimum bins for discretizing continuous parents", type = "numeric", default = 2)
p <- add_argument(p, "--max_bins", help = "Maximum bins for discretizing continuous parents", type = "numeric", default = 5)
p <- add_argument(p, "--coef_min", help = "Minimum regression coefficient", type = "numeric", default = -1)
p <- add_argument(p, "--coef_max", help = "Maximum regression coefficient", type = "numeric", default = 1)
p <- add_argument(p, "--noise_sd_min", help = "Minimum noise SD", type = "numeric", default = 0.5)
p <- add_argument(p, "--noise_sd_max", help = "Maximum noise SD", type = "numeric", default = 1.5)
p <- add_argument(p, "--dirichlet_alpha", help = "Dirichlet concentration parameter", type = "numeric", default = 1)

argv <- parse_args(p)

set.seed(argv$seed)

# Read DAG
adjmat <- as.matrix(read.csv(argv$filename_dag, check.names = FALSE))
n <- ncol(adjmat)
node_names <- colnames(adjmat)

# Determine node types
# R_ prefixed nodes are always discrete (binary missingness indicators)
node_types <- character(n)
n_levels <- integer(n)

for (i in 1:n) {
  if (grepl("^R_", node_names[i])) {
    # Missingness indicator: always binary discrete
    node_types[i] <- "discrete"
    n_levels[i] <- 2
  } else {
    # Randomly assign continuous or discrete
    if (runif(1) < argv$prob_discrete) {
      node_types[i] <- "discrete"
      n_levels[i] <- sample(argv$min_levels:argv$max_levels, 1)
    } else {
      node_types[i] <- "continuous"
      n_levels[i] <- NA
    }
  }
}

# Generate parameters
params <- generateMixedBN(
  adj = adjmat,
  node_types = node_types,
  n_levels = n_levels,
  n_bins_range = c(argv$min_bins, argv$max_bins),
  coef_range = c(argv$coef_min, argv$coef_max),
  noise_sd_range = c(argv$noise_sd_min, argv$noise_sd_max),
  dirichlet_alpha = argv$dirichlet_alpha
)

# Save parameters
saveRDS(params, file = argv$filename)

print("Generated mixed BN parameters:")
print(paste("Nodes:", n))
print(paste("Continuous:", sum(node_types == "continuous")))
print(paste("Discrete:", sum(node_types == "discrete")))
