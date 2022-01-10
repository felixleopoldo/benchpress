library(ggplot2)

stats <-read.csv(snakemake@input[["joint_stats"]])

ggplot(data=stats, 
            aes(x=seed,y=n_inedges/n_nodes)) + {
    geom_bar(stat="identity")
} +
facet_wrap(. ~ adjmat) +
ggtitle("Graph density (#in edges/#nodes)") +
theme_bw() 
ggsave(snakemake@output[["n_edges_plot"]])

