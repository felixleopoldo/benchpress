library(argparser)

#' Get partition index from discrete parent values
#' @param parent_values Vector of parent values (0-indexed)
#' @param parent_levels Vector of number of levels for each parent
#' @return 1-indexed partition number
getPartitionIndex <- function(parent_values, parent_levels) {
  if (length(parent_values) == 0) return(1)
  
  idx <- 1
  multiplier <- 1
  for (i in seq_along(parent_values)) {
    idx <- idx + parent_values[i] * multiplier
    multiplier <- multiplier * parent_levels[i]
  }
  return(idx)
}

#' Discretize continuous values into bins using equal-frequency binning
#' @param x Continuous values to discretize
#' @param n_bins Number of bins
#' @return List with bin_indices (0-indexed) and bin_boundaries
discretize <- function(x, n_bins) {
  # Handle edge cases
  if (length(unique(x)) < n_bins) {
    # Not enough unique values, use what we have
    breaks <- unique(sort(x))
    if (length(breaks) == 1) {
      # All same value
      return(list(bin_indices = rep(0, length(x)), 
                  bin_boundaries = c(-Inf, Inf)))
    }
    breaks <- c(-Inf, breaks[-1], Inf)
  } else {
    # Equal frequency binning
    probs <- seq(0, 1, length.out = n_bins + 1)
    breaks <- quantile(x, probs = probs, na.rm = TRUE)
    breaks[1] <- -Inf
    breaks[length(breaks)] <- Inf
    # Ensure unique breaks
    breaks <- unique(breaks)
  }
  
  bin_indices <- as.integer(cut(x, breaks = breaks, include.lowest = TRUE, labels = FALSE)) - 1
  
  return(list(bin_indices = bin_indices, bin_boundaries = breaks))
}

#' Sample data from a mixed Bayesian network
#' @param params Parameters from generateMixedBN
#' @param n Sample size
#' @return Data frame with sampled data
sampleMixedBN <- function(params, n) {
  
  p <- length(params$node_names)
  data <- matrix(NA, nrow = n, ncol = p)
  colnames(data) <- params$node_names
  
  # Store discretization info for reuse within sampling
  discretization_cache <- list()
  
  # Sample in topological order
  for (node in params$ord) {
    node_params <- params$node_params[[node]]
    node_type <- node_params$type
    
    if (node_type == "continuous_root") {
      # Continuous root node
      data[, node] <- rnorm(n, mean = node_params$mean, sd = node_params$sd)
      
    } else if (node_type == "discrete_root") {
      # Discrete root node
      data[, node] <- sample(0:(node_params$n_levels - 1), n, 
                             replace = TRUE, prob = node_params$probs)
      
    } else if (node_type == "continuous_regression") {
      # Continuous node with parents
      cont_parents <- node_params$continuous_parents
      disc_parents <- node_params$discrete_parents
      
      if (length(disc_parents) == 0) {
        # No discrete parents: single regression
        coefs <- node_params$coefs[[1]]
        intercept <- node_params$intercepts[1]
        
        if (length(cont_parents) > 0) {
          X <- as.matrix(data[, cont_parents, drop = FALSE])
          data[, node] <- intercept + X %*% coefs + rnorm(n, 0, node_params$noise_sd)
        } else {
          data[, node] <- intercept + rnorm(n, 0, node_params$noise_sd)
        }
      } else {
        # Partitioned regression
        disc_values <- as.matrix(data[, disc_parents, drop = FALSE])
        disc_levels <- node_params$discrete_parent_levels
        
        # Sample for each row based on its partition
        for (i in 1:n) {
          partition <- getPartitionIndex(disc_values[i, ], disc_levels)
          coefs <- node_params$coefs[[partition]]
          intercept <- node_params$intercepts[partition]
          
          if (length(cont_parents) > 0) {
            cont_values <- as.numeric(data[i, cont_parents])
            data[i, node] <- intercept + sum(coefs * cont_values) + rnorm(1, 0, node_params$noise_sd)
          } else {
            data[i, node] <- intercept + rnorm(1, 0, node_params$noise_sd)
          }
        }
      }
      
    } else if (node_type == "discrete_cpt") {
      # Discrete node with CPT
      cont_parents <- node_params$continuous_parents
      disc_parents <- node_params$discrete_parents
      n_bins <- node_params$n_bins
      disc_levels <- node_params$discrete_parent_levels
      cpt <- node_params$cpt
      n_lev <- node_params$n_levels
      
      # Discretize continuous parents if needed
      binned_cont_parents <- matrix(0, nrow = n, ncol = length(cont_parents))
      for (j in seq_along(cont_parents)) {
        parent_col <- cont_parents[j]
        disc_result <- discretize(data[, parent_col], n_bins[j])
        binned_cont_parents[, j] <- disc_result$bin_indices
      }
      
      # Get discrete parent values
      if (length(disc_parents) > 0) {
        disc_parent_values <- as.matrix(data[, disc_parents, drop = FALSE])
      } else {
        disc_parent_values <- matrix(nrow = n, ncol = 0)
      }
      
      # Combine all parent dimensions: [binned_cont, disc]
      parent_dims <- node_params$parent_dims
      
      # Sample for each row
      for (i in 1:n) {
        # Combine binned continuous and discrete parent values
        all_parent_values <- c(binned_cont_parents[i, ], disc_parent_values[i, ])
        
        # Get configuration index
        if (length(all_parent_values) > 0) {
          config_idx <- getPartitionIndex(all_parent_values, parent_dims)
        } else {
          config_idx <- 1
        }
        
        # Sample from CPT
        probs <- cpt[, config_idx]
        data[i, node] <- sample(0:(n_lev - 1), 1, prob = probs)
      }
    }
  }
  
  return(as.data.frame(data))
}

#' Insert missing values based on R_ indicators
#' @param data Data frame with all variables including R_ indicators
#' @return Data frame with NA values inserted
insertMissingness <- function(data) {
  col_names <- colnames(data)
  
  for (col in col_names) {
    if (grepl("^R_", col)) {
      # This is a missingness indicator
      subst_name <- sub("^R_", "", col)
      
      if (subst_name %in% col_names) {
        # Insert NA where R_ = 0
        data[data[, col] == 0, subst_name] <- NA
      }
    }
  }
  
  return(data)
}


# Main script
p <- arg_parser("Sample data from mixed Bayesian network with missingness")
p <- add_argument(p, "--params", help = "Input parameters file (RDS)")
p <- add_argument(p, "--filename", help = "Output data file (CSV)")
p <- add_argument(p, "--n", help = "Sample size", type = "numeric")
p <- add_argument(p, "--seed", help = "Random seed", type = "numeric")

argv <- parse_args(p)

set.seed(argv$seed)

# Load parameters
params <- readRDS(argv$params)

# Sample data
data <- sampleMixedBN(params, argv$n)

# Insert missingness based on R_ indicators
data <- insertMissingness(data)

# Write to CSV (no metadata header, just data)
write.csv(data, file = argv$filename, row.names = FALSE, quote = FALSE, na = "")

print(paste("Generated", argv$n, "samples from mixed BN"))
print(paste("Columns:", ncol(data)))
print("Node types:")
print(table(params$node_types))
