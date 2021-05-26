library(ggplot2)
library("rjson")


toplot <- read.csv(snakemake@input[["csv"]])


ggplot() + geom_errorbar(data = toplot,
              aes(x = FPRn_pattern_median,
                  ymin = TPR_pattern_q1, 
                  ymax = TPR_pattern_q3, 
                  col = id), 
              width = 0.01) +
geom_path(data = toplot,
          aes(x = FPRn_pattern_median, 
              y = TPR_pattern_median,
              col = id)) +
geom_point(data = toplot,
           aes(x = FPRn_pattern_median, 
               y = TPR_pattern_median,               
               col = id, 
               shape = id), 
               size = 1) +

facet_wrap(. ~ adjmat+bn+data, nrow = 2) +
xlab("FPRp") +
ylab("TPR") +
ggtitle("FPRp/TPR (pattern graph)") +
theme(plot.title = element_text(hjust = 0.5)) +
ggsave(file=snakemake@output[["eps"]])


ggplot() + geom_errorbar(data = toplot,
              aes(x = FPRn_skel_median,
                  ymin = TPR_skel_q1, 
                  ymax = TPR_skel_q3, 
                  col = id), 
              width = 0.01) +
geom_path(data = toplot,
          aes(x = FPRn_skel_median, 
              y = TPR_skel_median,
              col = id)) +
geom_point(data = toplot,
           aes(x = FPRn_skel_median, 
               y = TPR_skel_median,               
               col = id, 
               shape = id), 
               size = 1) +

facet_wrap(. ~ adjmat+bn+data, nrow = 2) +
xlab("FPRp") +
ylab("TPR") +
ggtitle("FPRp/TPR (undirected skeleton)") +
theme(plot.title = element_text(hjust = 0.5)) +
ggsave(file=snakemake@output[["roc_FPRp_TPR_skel"]])


ggplot() + geom_errorbar(data = toplot,
              aes(x = FPRp_skel_mean,
                  ymin = FNR_skel_q1, 
                  ymax = FNR_skel_q3, 
                  col = id), 
              width = 0.01) +
geom_path(data = toplot,
          aes(x = FPRp_skel_mean, 
              y = FNR_skel_mean,
              col = id)) +
geom_point(data = toplot,
           aes(x = FPRp_skel_mean, 
               y = FNR_skel_mean,               
               col = id, 
               shape = id), 
               size = 1) +
facet_wrap(. ~ adjmat+bn+data, nrow = 2) +
xlab("FPRp") +
ylab("FNR") +
ggtitle("FPR/FNR (undirected skeleton)") +
theme(plot.title = element_text(hjust = 0.5)) +
ggsave(file=snakemake@output[["roc_skel"]])