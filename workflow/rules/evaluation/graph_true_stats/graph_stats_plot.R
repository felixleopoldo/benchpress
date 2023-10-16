library(ggplot2)
library(dplyr)
stats <- read.csv(snakemake@input[["joint_stats"]])

df1 <- stats
df1["value"] <- stats[, "n_inedges"] / stats[, "n_nodes"]
df1["stats"] <- "avg_indegree"

df2 <- stats
df2["value"] <- stats[, "max_indegree"]
df2["stats"] <- "max_indegree"

df <- dplyr::bind_rows(df1, df2)

ggplot(data = df, aes(x = as.factor(seed), y = value, fill = stats)) +
    geom_bar(stat = "identity", position = "dodge") +
    facet_wrap(. ~ adjmat) +
    ggtitle("True graph properties") +
    theme_bw() +
    xlab("Graph seed number") +
    ylab("") +
    theme(plot.title = element_text(hjust = 0.5))
ggsave(snakemake@output[["graph_density_plot"]])
