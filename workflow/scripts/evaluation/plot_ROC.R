# Reads joint csv file with summaries from all algorithms and computes plots of e.g. TPR and FPR
# in a ROC plot. 
library(ggplot2)
library(dplyr, warn.conflicts = FALSE)
library("rjson")

if (file.info(snakemake@input[["csv"]])$size == 0) { 
     file.create(snakemake@output[["fpr_tpr_pattern"]])
     file.create(snakemake@output[["roc_FPRp_TPR_skel"]])
     file.create(snakemake@output[["FPRp_FNR_skel"]])
     cat("Time-out",file=snakemake@output[["elapsed_time"]], sep="\n") # Copy time-out figure
     cat("Time-out",file=snakemake@output[["fnr_fprp_skel"]], sep="\n")
} else {
    toplot <- read.csv(snakemake@input[["csv"]])

config <- fromJSON(file = snakemake@input[["config"]])

param_annot <- config$benchmark_setup$evaluation$roc$text
path <- config$benchmark_setup$evaluation$roc$path
point <- config$benchmark_setup$evaluation$roc$point
errorbar <- config$benchmark_setup$evaluation$roc$errorbar


# Might have to go through all one by aone to get the ponit text.
# directlabels::geom_dl(aes(label = class), method = "smart.grid") +
gg  <- ggplot() + {
  if (errorbar) {
    geom_errorbar(data = toplot,
                aes(x = FPRn_pattern_median,
                    ymin = TPR_pattern_q1,
                    ymax = TPR_pattern_q3,
                    col = id),
                    width = 0.01)
  }
} + {
  if (path) {
    geom_path(data = toplot,
          aes(x = FPRn_pattern_median,
              y = TPR_pattern_median,
              col = id))
  }
} + {
  if (point) {
    geom_point(data = toplot,
    aes(x = FPRn_pattern_median,
        y = TPR_pattern_median,
        col = id,
        shape = id),
        size = 1)
  }
} + {
  if (param_annot) {
    geom_text(data = toplot,
            aes(x = FPRn_pattern_median,
                y = TPR_pattern_median,
                label = curve_vals, col = id, shape = id),
          check_overlap = FALSE
          )
  }
} +
facet_wrap(. ~ adjmat + bn + data, nrow = 2) +
xlab("FPRp") +
ylab("TPR") +
ggtitle("Median FPRp/TPR (pattern graph)") +
theme_bw() +
theme(plot.title = element_text(hjust = 0.5)) 
ggsave(file = snakemake@output[["fpr_tpr_pattern"]],plot=gg)

gg  <- ggplot() + {
  if (errorbar) {
    geom_errorbar(data = toplot,
              aes(x = FPRn_skel_median,
                  ymin = TPR_skel_q1,
                  ymax = TPR_skel_q3,
                  col = id),
              width = 0.01)
  }
} + {
  if (path) {
    geom_path(data = toplot,
          aes(x = FPRn_skel_median,
              y = TPR_skel_median,
              col = id))
  }
} + {
  if (point) {
    geom_point(data = toplot,
           aes(x = FPRn_skel_median,
               y = TPR_skel_median,
               col = id,
               shape = id),
               size = 1)
  }
} + {
  if (param_annot) {
    geom_text(data = toplot,
            aes(x = FPRn_skel_median,
                y = TPR_skel_q3,
                label = curve_vals, col = id, shape = id),
          check_overlap = FALSE
          )
  }
 } +
facet_wrap(. ~ adjmat + bn + data, nrow = 2) +
xlab("FPRp") +
ylab("TPR") +
ggtitle("Median FPRp/TPR (undirected skeleton)") +
theme_bw() +
theme(plot.title = element_text(hjust = 0.5))
ggsave(file = snakemake@output[["roc_FPRp_TPR_skel"]],plot=gg)


gg  <- ggplot() + {
  if (errorbar) {
    geom_errorbar(data = toplot,
              aes(x = FPRp_skel_mean,
                  ymin = FNR_skel_q1,
                  ymax = FNR_skel_q3,
                  col = id),
              width = 0.01)
  }
} + {
  if (path) {
    geom_path(data = toplot,
          aes(x = FPRp_skel_mean,
              y = FNR_skel_mean,
              col = id))
  }
} + {
  if (point) {
    geom_point(data = toplot,
           aes(x = FPRp_skel_mean,
               y = FNR_skel_mean,
               col = id,
               shape = id),
               size = 1)
  }
} + {
  if (param_annot) {
    geom_text(data = toplot,
            aes(y = FNR_skel_q3,
                x = FPRp_skel_mean,
                label = curve_vals, col = id, shape = id),
          check_overlap = FALSE
          )
  }
} +
facet_wrap(. ~ adjmat + bn + data, nrow = 2) +
xlab("FPRp") +
ylab("FNR") +
ggtitle("Mean FPRp/FNR (undirected skeleton)") +
theme_bw() +
theme(plot.title = element_text(hjust = 0.5)) 
ggsave(file = snakemake@output[["FPRp_FNR_skel"]],plot=gg)

gg  <- ggplot() + {
  if (errorbar) {
    geom_errorbar(data = toplot,
              aes(x = FNR_skel_mean,
                  ymin = FPR_skel_q1,
                  ymax = FPR_skel_q3,
                  col = id),
              width = 0.01)
  }
} + {
  if (path) {
    geom_path(data = toplot,
           aes(y = FPRp_skel_mean,
               x = FNR_skel_mean,
               col = id))
  }
} + {
  if (point) {
    geom_point(data = toplot,
           aes(y = FPRp_skel_mean,
               x = FNR_skel_mean,
               col = id,
               shape = id),
               size = 1)
  }
} + {
  if (param_annot) {
    geom_text(data = toplot,
        aes(x = FNR_skel_mean,
        y = FPRp_skel_mean,
        label = curve_vals, col = id, shape = id),
        check_overlap = FALSE
        )
  }
} +
facet_wrap(. ~ adjmat + bn + data, nrow = 2) +
ylab("FPR") +
xlab("FNR") +
ggtitle("Mean FNR/FPRp (undirected skeleton)") +
theme_bw() +
theme(plot.title = element_text(hjust = 0.5))
ggsave(file = snakemake@output[["fnr_fprp_skel"]],plot=gg)


# adjmats <- unique(toplot["adjmat"])
# bns <- unique(toplot["bn"])
# datas <- unique(toplot["data"])
# ids <- unique(toplot["id"])

# for (adjmat in adjmats){
#     for (bn in bns){
#         for (data in datas) {
#             for (id in ids) {
#                 dftmp <- toplot %>% 
#                         filter(adjmat == adjmat) %>%
#                         filter(bn == bn) %>%
#                         filter(data == data) %>%
#                         filter(id == id)

#                 param <- unlist(unique(dftmp["curve_param"]))
#                 print(paste(c(unlist(adjmat), unlist(bn), unlist(data))))
#                 print(data[1])
#                 print(unlist(bn))
#                 print(unlist(adjmat))

#                 ggplot() + geom_bar(data = dftmp, stat="identity", aes(x=as.factor(curve_vals), y = time_mean)) +
#                   ggtitle(id) +
#                   theme_bw() +
#                   xlab(param) +
#                   ylab("Mean time (s.)") 
#                 ggsave(file = snakemake@output[["elapsed_time"]])

#             }
#         }
#     }
# }

ggplot() + {

    geom_bar(data = toplot, stat="identity",
             aes(x=interaction(curve_param,curve_vals), 
             y = time_mean) )

} +
  facet_wrap(. ~ adjmat + bn + data + id, ncol = 2, scales="free_x") +
  ggtitle("Mean elapsed time") +
  theme_bw() +
  xlab("Parameter.value") +
  ylab("Time (s.)") +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_x_discrete(guide = guide_axis(angle=7))
#scale_x_discrete(guide = guide_axis(n.dodge=2))
  ggsave(file = snakemake@output[["elapsed_time"]])
}

