library(ggplot2)
library("rjson")


toplot <- read.csv(snakemake@input[["csv"]])

# Might have to go through all one by aone to get the ponit text.

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
#directlabels::geom_dl(aes(label = class), method = "smart.grid") +
#geom_text(data = toplot,
#            aes(x = FPRn_median, 
#                y = TPR_q3,               
#                label=alpha, col=legend),
#          check_overlap = TRUE,
#           nudge_x=-0.02,
#          nudge_y=0.02
#          )

facet_wrap(. ~ adjmat+bn+data, nrow = 2) +
xlab("FPRp") +
ylab("TPR") +
ggtitle("Median FPRp/TPR (pattern graph)") +
theme_bw() +
theme(plot.title = element_text(hjust = 0.5)) +
ggsave(file=snakemake@output[["eps"]])
# annotate

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
ggtitle("Median FPRp/TPR (undirected skeleton)") +
theme_bw() +
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
ggtitle("Mean FPRp/FNR (undirected skeleton)") +
theme_bw() +
theme(plot.title = element_text(hjust = 0.5)) +
ggsave(file=snakemake@output[["roc_skel"]])