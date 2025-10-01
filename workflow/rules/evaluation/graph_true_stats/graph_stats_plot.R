library(ggplot2)
library(dplyr)

# A function factory for getting integer y-axis values.
integer_breaks <- function(n = 5, ...) {
  fxn <- function(x) {
    breaks <- floor(pretty(x, n, ...))
    names(breaks) <- attr(breaks, "labels")
    breaks
  }
  return(fxn)
}

stats <- read.csv(snakemake@input[["joint_stats"]])

# The number of in edges
df1 <- stats
df1["value"] <- stats[, "n_inedges"] / stats[, "n_nodes"]
df1["stats"] <- "indegree_avg"

# The maximum in-degree
df2 <- stats
df2["value"] <- stats[, "max_indegree"]
df2["stats"] <- "indegree_max"

# The size of the maximal maximal cliqu
df3 <- stats
df3["value"] <- stats[, "max_clique_size"]
df3["stats"] <- "clique_size_max"

# The average size of the maximal cliques
df4 <- stats
df4["value"] <- stats[, "avg_clique_size"]
df4["stats"] <- "clique_size_avg"

# Thm minimum size of the maximal cliques
df5 <- stats
df5["value"] <- stats[, "min_clique_size"]
df5["stats"] <- "clique_size_min"

df <- dplyr::bind_rows(df1, df2, df3, df4, df5)

ggplot(data = df, aes(x = as.factor(seed), y = value, fill = stats)) +
    geom_bar(stat = "identity", position = "dodge") +
    facet_wrap(. ~ adjmat) +
    ggtitle("True graph properties") +
    scale_y_continuous(breaks = integer_breaks()) +
    theme_bw() +
    xlab("Graph seed number") +
    ylab("") +
    theme(plot.title = element_text(hjust = 0.5))
ggsave(snakemake@output[["graph_density_plot"]])

pdf(NULL)