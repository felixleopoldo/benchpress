library(rjson)

# Read JSON data
filename_data <- snakemake@input[["edgeConstraints"]]
filename_output <- snakemake@output[["edgeConstraints_in_format"]]
package <- snakemake@params[["package"]]
datafilename <- snakemake@output[["edgeConstraints_in_format"]]

ff <- file.path(snakemake@input["data"])
datafile <- read.csv(ff, header = TRUE, check.names = FALSE)
node_labels <- colnames(datafile)

# Handle null value for edgeConstraints
if (filename_data == "null" || file.size(filename_data) == 0) {
    if (package == "pcalg" || package == "mvpc" || package == "bips_tpc" || package == "tpc") {
        # Empty data frame - pcalg and mvpc
        matrix_data <- data.frame(node1 = character(), node2 = character(), matrix_type = character(), stringsAsFactors = FALSE)
        write.csv(matrix_data, file = filename_output, row.names = FALSE, quote = FALSE)
    } else if (package == "bnlearn") {
        # Empty data frame - bnlearn
        combined_data <- data.frame(from = character(), to = character(), type = character(), stringsAsFactors = FALSE)
        write.csv(combined_data, file = filename_output, row.names = FALSE, quote = FALSE)
    } else if (package == "tetrad") {
        # Empty knowledge file - tetrad
        write("/knowledge\n\naddtemporal\n\nforbiddirect\n\nrequiredirect\n", file = filename_output)
    } else if (package == "gobnilp") {
        # Empty knowledge file - gobnilp
        write("", file = filename_output)
    } else if (package == "bidag") {
        # Empty data frame - bidag
        forbidden_edges_bidag <- data.frame(from = character(), to = character(), stringsAsFactors = FALSE)
        write.csv(forbidden_edges_bidag, file = filename_output, row.names = FALSE, quote = FALSE)
    }
} else {
    data <- fromJSON(file = filename_data)

    # Format edges
    format_edges <- function(edges) {
        as.data.frame(matrix(unlist(edges), ncol = 2, byrow = TRUE))
    }

    # Process edges - pcalg, bnlearn (for all algorithms?)
    forbidden_edges <- if (!is.null(data$forbidden_edges)) format_edges(data$forbidden_edges) else data.frame()
    required_edges <- if (!is.null(data$required_edges)) format_edges(data$required_edges) else data.frame()

    if (nrow(forbidden_edges) > 0) colnames(forbidden_edges) <- c("from", "to")
    if (nrow(required_edges) > 0) colnames(required_edges) <- c("from", "to")

    # filter out the edges that are not in the node_labels
    forbidden_edges <- forbidden_edges[forbidden_edges$from %in% node_labels & forbidden_edges$to %in% node_labels, ]
    required_edges <- required_edges[required_edges$from %in% node_labels & required_edges$to %in% node_labels, ]

    # pcalg and mvpc
if (package == "pcalg" || package == "mvpc") {
        # pcalg - "fixedGaps" and "fixedEdges"
        matrix_data <- rbind(forbidden_edges, required_edges)
        matrix_type <- c(rep("fixedGaps", nrow(forbidden_edges)), rep("fixedEdges", nrow(required_edges)))
        matrix_data <- cbind(matrix_data, matrix_type)
        colnames(matrix_data)[1:2] <- c("node1", "node2")
        write.csv(matrix_data, file = filename_output, row.names = FALSE, quote = FALSE)
    } else if (package == "bips_tpc" || package == "tpc") { # bips_tpc

        # handle forbidden edges and tiers. Later, context and context.tiers.
        p <- ncol(datafile)
        constraints <- list() # save this to file serialized

        tiers_vars <- c()
        if (!is.null(data$tiers)) {
            for (tier in data$tiers) {
                tiers_vars <- c(tiers_vars, tier)
            }
        }

        # check that tiers_vars has the same variables as node_labels
        #  check if the node_labels are a subset of tiers_vars
        if (!all(node_labels %in% tiers_vars)) {
            print("Some variables in the data are not in the tiers")
            print(setdiff(node_labels, tiers_vars))
            stop("Some variables in the data are not in the tiers")
        }

        
       #print ("Checking tiers  variables")
        if (!all(tiers_vars %in% node_labels)) {
            # check whcih variables are not in the tiers
            print("Some variables in the tiers are not in the data")
            print(setdiff(tiers_vars, node_labels))
            stop("Some variables in the tiers are not in the data")
        }
        

        tiers <- rep(NULL, p)
        # for each tier in data$tiers,

        tier_no <- 1
        for (t in data$tiers) {
            for (v in t) {
                # get the index of the variable in the node_labels
                index <- which(node_labels == v)

                tiers[index] <- tier_no
            }
            tier_no <- tier_no + 1
        }
        constraints$tiers <- tiers

        # checl that tiers has the same variables as node_labels
        #print("Constraints:")
       # print(data)

        forbEdges <- matrix(0, p, p)
        # loop over the forbidden edges and add them to forbEdges
        for (edge in data$forbidden_edges) {
            from <- which(node_labels == edge[1])
            to <- which(node_labels == edge[2])
            forbEdges[from, to] <- 1
        }

        # loop over the forbidden groups and add them to forbEdges
        for (group in data$forbidden_groups) {
            for (cause in group$cause) {
                for (effect in group$effect) {
                    from <- which(node_labels == cause)
                    to <- which(node_labels == effect)
                    forbEdges[from, to] <- 1
                }
            }
        }

        # Now, check if data$tier_setting$forbid_withid_tiers == true
        # if so fot the edges within the tiers, add them to forbEdges

        if (!is.null(data$tier_settings) && data$tier_settings$forbid_within_tiers) {
            for (tier in data$tiers) {
                for (i in 1:(length(tier) - 1)) {
                    for (j in (i + 1):length(tier)) {
                        from <- which(node_labels == tier[i])
                        to <- which(node_labels == tier[j])
                        forbEdges[from, to] <- 1
                    }
                }
            }
        }

        # Now, check if data$tier_setting$can_only_cause_next_tier == true
        # if so fot the edges within the tiers, add them to forbEdges
        if (!is.null(data$tier_settings) && data$tier_settings$can_only_cause_next_tier) {
            for (i in 1:(length(data$tiers) - 1)) {
                current_tier <- data$tiers[[i]]
                future_tiers <- data$tiers[(i + 2):length(data$tiers)]
                for (var in current_tier) {
                    for (future_tier in future_tiers) {
                        for (future_var in future_tier) {
                            from <- which(node_labels == var)
                            to <- which(node_labels == future_var)
                            forbEdges[from, to] <- 1
                        }
                    }
                }
            }
        }

        # Now forbid edges to the source_nodes
        if (!is.null(data$source_nodes)) {
            for (source_node in data$source_nodes) {
                from <- which(node_labels == source_node)
                for (i in 1:p) {
                    forbEdges[i, from] <- 1
                }
            }
        }

        constraints$forbEdges <- forbEdges
        constraints$context.all <- data$context_all
        constraints$context.tier <- data$context_tier

        saveRDS(constraints, file = filename_output)

    } else if (package == "bnlearn") { # bnlearn
        # bnlearn - "blacklists" and "whitelists"
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

            # Tier Settings - Forbid within tiers
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

            # Tier Settings - Can only cause next tier
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

        # Groups - Forbidden
        if (!is.null(data$forbidden_groups)) {
            for (group in data$forbidden_groups) {
                for (cause in group$cause) {
                    for (effect in group$effect) {
                        blacklist <- rbind(blacklist, data.frame(from = cause, to = effect))
                    }
                }
            }
        }

        # Groups - Required
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
            # tetrad - knowledge file
            knowledge <- "/knowledge\n\naddtemporal\n"


            # Tier Settings - Forbid within tiers & Can only cause next tier
            forbid_within_tiers <- if (!is.null(data$tier_settings)) data$tier_settings$forbid_within_tiers else FALSE
            can_only_cause_next_tier <- if (!is.null(data$tier_settings)) data$tier_settings$can_only_cause_next_tier else FALSE

            # Tiers
            if (!is.null(data$tiers)) {
                for (tier in 1:length(data$tiers)) {
                    tier_num <- tier
                    tier_mark <- ifelse(can_only_cause_next_tier, ifelse(forbid_within_tiers, "*", ""), "")
                    tier_nodes <- paste0("\"", paste(data$tiers[[tier]], collapse = "\" \""), "\"")
                    knowledge <- paste(knowledge, tier_num, tier_mark, " ", tier_nodes, "\n", sep = "")
                }
            }

            # Forbidden edges
            knowledge <- paste(knowledge, "\nforbiddirect\n", sep = "")
            if (!is.null(data$forbidden_groups)) {
                for (group in data$forbidden_groups) {
                    causes <- group$cause
                    effects <- group$effect
                    for (cause in causes) {
                        for (effect in effects) {
                            knowledge <- paste(knowledge, paste0("\"", cause, "\" \"", effect, "\""), "\n", sep = "")
                        }
                    }
                }
            }

            if (nrow(forbidden_edges) > 0) {
                for (edge in data$forbidden_edges) {
                    knowledge <- paste(knowledge, paste0("\"", edge[1], "\" \"", edge[2], "\""), "\n", sep = "")
                }
            }

            # Required edges
            knowledge <- paste(knowledge, "\nrequiredirect\n", sep = "")
            if (!is.null(data$required_groups)) {
                for (group in data$required_groups) {
                    causes <- group$cause
                    effects <- group$effect
                    for (cause in causes) {
                        for (effect in effects) {
                            knowledge <- paste(knowledge, paste0("\"", cause, "\" \"", effect, "\""), "\n", sep = "")
                        }
                    }
                }
            }

            if (nrow(required_edges) > 0) {
                for (edge in data$required_edges) {
                    knowledge <- paste(knowledge, paste0("\"", edge[1], "\" \"", edge[2], "\""), "\n", sep = "")
                }
            }

            write(knowledge, file = filename_output)
        } else if (package == "gobnilp") # gobnilp
        {
            # gobnilp - knowledge file
            knowledge <- c()

            format_edges_gobnilp <- function(edges, prefix, suffix) {
                sapply(edges, function(edge) {
                    return(paste(prefix, edge[2], "<-", edge[1], suffix, sep = ""))
                })
            }

            # Forbidden Edges
            if (nrow(forbidden_edges) > 0) {
                knowledge <- c(knowledge, "#forbidden edges")
                knowledge <- c(knowledge, format_edges_gobnilp(data$forbidden_edges, "~", ""))
            }

            # Required Edges
            if (nrow(required_edges) > 0) {
                knowledge <- c(knowledge, "\n#required edges")
                knowledge <- c(knowledge, format_edges_gobnilp(data$required_edges, "", ""))
            }

            # Tiers
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

            # Tier Settings - Forbin within tiers
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

            # Tier Settings - Can only cause next tier
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

            # Groups - Forbidden
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

            # Groups - Required
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
        } else if (package == "bidag") {
        ########### bidag ###########
        # bidag - "blacklist"
        forbidden_edges_bidag <- forbidden_edges

        # Forbidden Groups
        if (!is.null(data$forbidden_groups)) {
            for (group in data$forbidden_groups) {
                for (cause in group$cause) {
                    for (effect in group$effect) {
                        forbidden_edges_bidag <- rbind(forbidden_edges_bidag, data.frame(from = cause, to = effect))
                    }
                }
            }
        }

        forbidden_edges_bidag <- unique(forbidden_edges_bidag)

        write.csv(forbidden_edges_bidag, file = filename_output, row.names = FALSE, quote = FALSE)
    }
}
