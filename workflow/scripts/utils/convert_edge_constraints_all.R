library(rjson)

# Read JSON data
filename_data <- snakemake@input[["edgeConstraints"]]
filename_output <- snakemake@output[["edgeConstraints_in_format"]]
package <- snakemake@params[["package"]]
data <- fromJSON(file = filename_data)

# Format edges
format_edges <- function(edges) {
  as.data.frame(matrix(unlist(edges), ncol = 2, byrow = TRUE))
}

# Process edges - pcalg, bnlearn
forbidden_edges <- if (!is.null(data$forbidden_edges)) format_edges(data$forbidden_edges) else data.frame()
required_edges <- if (!is.null(data$required_edges)) format_edges(data$required_edges) else data.frame()

if (nrow(forbidden_edges) > 0) colnames(forbidden_edges) <- c("from", "to")
if (nrow(required_edges) > 0) colnames(required_edges) <- c("from", "to")

# pcalg
if (package == "pcalg") {
  # For pcalg - "fixedGaps" and "fixedEdges"
  matrix_data <- rbind(forbidden_edges, required_edges)
  matrix_type <- c(rep("fixedGaps", nrow(forbidden_edges)), rep("fixedEdges", nrow(required_edges)))
  matrix_data <- cbind(matrix_data, matrix_type)
  colnames(matrix_data)[1:2] <- c("node1", "node2")
  write.csv(matrix_data, file = filename_output, row.names = FALSE, quote = FALSE)
} else if (package == "bnlearn") { # bnlearn
  # For bnlearn - "blacklists" and "whitelists"
  blacklist <- forbidden_edges
  whitelist <- required_edges

  # Tiers
  if (!is.null(data$tiers) && !is.null(data$tier_settings)) {
    for (i in 1:(length(data$tiers) - 1)) {
      for (j in (i + 1):length(data$tiers)) {
        higher_tier <- data$tiers[[j]]
        lower_tier <- data$tiers[[i]]
        for (higher_var in higher_tier) {
          for (lower_var in lower_tier) {
            blacklist <- rbind(blacklist, data.frame(from = lower_var, to = higher_var))
          }
        }
      }
    }

    if (data$tier_settings$forbid_within_tiers) {
      for (tier in data$tiers) {
        for (i in 1:(length(tier) - 1)) {
          for (j in (i + 1):length(tier)) {
            blacklist <- rbind(blacklist, data.frame(from = tier[i], to = tier[j]))
            blacklist <- rbind(blacklist, data.frame(from = tier[j], to = tier[i]))
          }
        }
      }
    }

    if (data$tier_settings$can_only_cause_next_tier) {
      for (i in 1:(length(data$tiers) - 1)) {
        current_tier <- data$tiers[[i]]
        future_tiers <- data$tiers[(i + 2):length(data$tiers)]
        for (var in current_tier) {
          for (future_tier in future_tiers) {
            for (future_var in future_tier) {
              blacklist <- rbind(blacklist, data.frame(from = var, to = future_var))
            }
          }
        }
      }
    }
  }

  if (!is.null(data$forbidden_groups)) {
    for (group in data$forbidden_groups) {
      for (cause in group$cause) {
        for (effect in group$effect) {
          blacklist <- rbind(blacklist, data.frame(from = cause, to = effect))
        }
      }
    }
  }

  if (!is.null(data$required_groups)) {
    for (group in data$required_groups) {
      for (cause in group$cause) {
        for (effect in group$effect) {
          whitelist <- rbind(whitelist, data.frame(from = cause, to = effect))
        }
      }
    }
  }

  blacklist <- unique(blacklist)
  whitelist <- unique(whitelist)

  blacklist$type <- "blacklist"
  whitelist$type <- "whitelist"

  combined_data <- rbind(blacklist, whitelist)

  write.csv(combined_data, file = filename_output, row.names = FALSE, quote = FALSE)
} else if (package == "tetrad") # tetrad
  {
    knowledge <- "/knowledge\n\naddtemporal\n"

    forbid_within_tiers <- if (!is.null(data$tier_settings)) data$tier_settings$forbid_within_tiers else FALSE
    can_only_cause_next_tier <- if (!is.null(data$tier_settings)) data$tier_settings$can_only_cause_next_tier else FALSE

    if (!is.null(data$tiers)) {
      for (tier in 1:length(data$tiers)) {
        tier_num <- tier
        tier_mark <- ifelse(can_only_cause_next_tier, ifelse(forbid_within_tiers, "*", ""), "")
        knowledge <- paste(knowledge, tier_num, tier_mark, " ", paste(data$tiers[[tier]], collapse = " "), "\n", sep = "")
      }
    }

    knowledge <- paste(knowledge, "\nforbiddirect\n", sep = "")
    if (!is.null(data$forbidden_groups)) {
      for (group in data$forbidden_groups) {
        causes <- group$cause
        effects <- group$effect
        for (cause in causes) {
          for (effect in effects) {
            knowledge <- paste(knowledge, paste(cause, effect, sep = " "), "\n", sep = "")
          }
        }
      }
    }

    if (nrow(forbidden_edges) > 0) {
      for (edge in data$forbidden_edges) {
        knowledge <- paste(knowledge, paste(edge[1], edge[2], sep = " "), "\n", sep = "")
      }
    }

    knowledge <- paste(knowledge, "\nrequiredirect\n", sep = "")
    if (!is.null(data$required_groups)) {
      for (group in data$required_groups) {
        causes <- group$cause
        effects <- group$effect
        for (cause in causes) {
          for (effect in effects) {
            knowledge <- paste(knowledge, paste(cause, effect, sep = " "), "\n", sep = "")
          }
        }
      }
    }

    if (nrow(required_edges) > 0) {
      for (edge in data$required_edges) {
        knowledge <- paste(knowledge, paste(edge[1], edge[2], sep = " "), "\n", sep = "")
      }
    }

    write(knowledge, file = filename_output)
  } else if (package == "gobnilp") # gobnilp
  {
    knowledge <- c()

    format_edges_gobnilp <- function(edges, prefix, suffix) {
      sapply(edges, function(edge) {
        paste(prefix, edge[2], "<-", edge[1], suffix, sep = "")
      })
    }

    if (nrow(forbidden_edges) > 0) {
      knowledge <- c(knowledge, "#forbidden edges")
      knowledge <- c(knowledge, format_edges_gobnilp(data$forbidden_edges, "~", ""))
    }

    if (nrow(required_edges) > 0) {
      knowledge <- c(knowledge, "\n#required edges")
      knowledge <- c(knowledge, format_edges_gobnilp(data$required_edges, "", ""))
    }

    if (!is.null(data$tiers)) {
      knowledge <- c(knowledge, "#temporal order")
      for (i in 1:(length(data$tiers) - 1)) {
        for (j in (i + 1):length(data$tiers)) {
          higher_tier <- data$tiers[[j]]
          lower_tier <- data$tiers[[i]]
          for (higher_var in higher_tier) {
            for (lower_var in lower_tier) {
              knowledge <- c(knowledge, paste("~", lower_var, "<-", higher_var, sep = ""))
            }
          }
        }
      }
    }

    if (!is.null(data$tier_settings) && data$tier_settings$forbid_within_tiers) {
      knowledge <- c(knowledge, "#forbid within tiers")
      for (tier in data$tiers) {
        for (i in 1:(length(tier) - 1)) {
          for (j in (i + 1):length(tier)) {
            knowledge <- c(knowledge, paste("~", tier[i], "<-", tier[j], sep = ""))
            knowledge <- c(knowledge, paste("~", tier[j], "<-", tier[i], sep = ""))
          }
        }
      }
    }

    if (!is.null(data$tier_settings) && data$tier_settings$can_only_cause_next_tier) {
      knowledge <- c(knowledge, "#can only cause next tier")
      for (i in 1:(length(data$tiers) - 1)) {
        current_tier <- data$tiers[[i]]
        future_tiers <- data$tiers[(i + 2):length(data$tiers)]
        for (var in current_tier) {
          for (future_tier in future_tiers) {
            for (future_var in future_tier) {
              knowledge <- c(knowledge, paste("~", future_var, "<-", var, sep = ""))
            }
          }
        }
      }
    }

    if (!is.null(data$forbidden_groups)) {
      knowledge <- c(knowledge, "#forbidden groups")
      for (group in data$forbidden_groups) {
        for (cause in group$cause) {
          for (effect in group$effect) {
            knowledge <- c(knowledge, paste("~", effect, "<-", cause, sep = ""))
          }
        }
      }
    }

    if (!is.null(data$required_groups)) {
      knowledge <- c(knowledge, "#required groups")
      for (group in data$required_groups) {
        for (cause in group$cause) {
          for (effect in group$effect) {
            knowledge <- c(knowledge, paste(effect, "<-", cause, sep = ""))
          }
        }
      }
    }

    write(knowledge, file = filename_output)

    comment_blank_lines <- function(input_file) {
      lines <- readLines(input_file)
      commented_lines <- sapply(lines, function(line) {
        if (line == "") {
          return("#")
        } else {
          return(line)
        }
      })
      writeLines(commented_lines, input_file)
    }

    comment_blank_lines(filename_output)
  }
