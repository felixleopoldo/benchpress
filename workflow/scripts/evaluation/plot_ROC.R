# Reads joint csv file with summaries from all algorithms and computes plots of e.g. TPR and FPR
# in a ROC plot. 
library(ggplot2)
library(dplyr, warn.conflicts = FALSE)
library(tibble)
library("rjson")
is_outlier <- function(x) {
  return(x < quantile(x, 0.25) - 1.5 * IQR(x) | x > quantile(x, 0.75) + 1.5 * IQR(x))
}

if (file.info(snakemake@input[["csv"]])$size == 0) {      
     file.create(snakemake@output[["fpr_tpr_pattern"]])
     file.create(snakemake@output[["roc_FPRp_TPR_skel"]])
     file.create(snakemake@output[["FPRp_FNR_skel"]])
     cat("Time-out",file=snakemake@output[["elapsed_time_joint"]], sep="\n") # Copy time-out figure
     cat("Time-out",file=snakemake@output[["fnr_fprp_skel"]], sep="\n")
     cat("Time-out",file=snakemake@output[["ntests_joint"]], sep="\n")
     cat("Time-out",file=snakemake@output[["f1_skel_joint"]], sep="\n")     
     cat("Time-out",file=snakemake@output[["SHD_cpdag_joint"]], sep="\n")
     
} else {    
    toplot <- read.csv(snakemake@input[["csv"]])
    joint_bench <- read.csv(snakemake@input[["raw_bench"]])
    config <- fromJSON(file = snakemake@input[["config"]])

    param_annot <- config$benchmark_setup$evaluation$roc$text
    path <- config$benchmark_setup$evaluation$roc$path    
    errorbar <- config$benchmark_setup$evaluation$roc$errorbar
    scatter <- config$benchmark_setup$evaluation$roc$scatter
    errorbarh <- config$benchmark_setup$evaluation$roc$errorbarh
    show_seed <- config$benchmark_setup$evaluation$roc$show_seed

# Might have to go through all one by aone to get the ponit text.
# directlabels::geom_dl(aes(label = class), method = "smart.grid") +
gg  <- ggplot() + {
  if (errorbar) {
    geom_errorbar(data = toplot, alpha=0.5,
                aes(x = FPR_pattern_median,
                    ymin = TPR_pattern_q1,
                    ymax = TPR_pattern_q3,
                    col = id),
                    width = 0.01)
  }
} + {
  if (errorbarh) {
    geom_errorbarh(data = toplot, alpha=0.5,
                aes(y = TPR_pattern_median,
                    xmin = FPR_pattern_q1,
                    xmax = FPR_pattern_q3,
                    col = id),
                    height = 0.01)
  }
} + {
  if (path) {
    geom_path(data = toplot, alpha=0.8,
          aes(x = FPR_pattern_median,
              y = TPR_pattern_median,
              col = id))
  }
} + {
  if (!param_annot) {
    geom_point(data = toplot, alpha=0.5,
    aes(x = FPR_pattern_median,
        y = TPR_pattern_median,
        col = id,
        shape = id),
        size = 1)
  }
} + {
    if(scatter && !show_seed){
        geom_point(data = joint_bench, alpha=0.15,
            aes(x = FPRn_pattern,
                y = TPR_pattern,
                col = id), shape=20,
                size = 1) 
    }
} + {
  if (scatter && show_seed) {
    geom_text(data = joint_bench, alpha=0.15,
            aes(x = FPRn_pattern,
                y = TPR_pattern,
                label = replicate, col = id, shape = id),
          check_overlap = FALSE
          )
  }
 }+ {
  if (param_annot) {
    geom_text(data = toplot, alpha=0.5,
            aes(x = FPR_pattern_median,
                y = TPR_pattern_median,
                label = curve_vals, col = id, shape = id),
          check_overlap = FALSE
          )
  }
} +
facet_wrap(. ~ adjmat + parameters + data, nrow = 2) +
xlab("FPRp") +
ylab("TPR") +
ggtitle("Median FPRp/TPR (pattern graph)") +
theme_bw() +
theme(plot.title = element_text(hjust = 0.5)) 
ggsave(file = snakemake@output[["fpr_tpr_pattern"]],plot=gg)

gg  <- ggplot() + {
  if (errorbar) {
    geom_errorbar(data = toplot, alpha=0.5,
              aes(x = FPR_skel_median,
                  ymin = TPR_skel_q1,
                  ymax = TPR_skel_q3,
                  col = id),
              width = 0.01)
  }
} + {
  if (errorbarh) {
    geom_errorbarh(data = toplot, alpha=0.5,
              aes(y = TPR_skel_median,
                  xmin = FPR_skel_q1,
                  xmax = FPR_skel_q3,
                  col = id),
              height = 0.01)
  }
} + {
  if (path) {
    geom_path(data = toplot, alpha=0.8, 
          aes(x = FPR_skel_median,
              y = TPR_skel_median,
              col = id))
  }
} + {
  if (!param_annot) {
    geom_point(data = toplot, alpha=0.5,
           aes(x = FPR_skel_median,
               y = TPR_skel_median,
               col = id,
               shape = id),
               size = 1) 
  }
} + {
    if(scatter && !show_seed){
        geom_point(data = joint_bench, alpha=0.15,
            aes(x = FPR_skel,
                y = TP_skel / true_n_edges_skel,
                col = id),
                shape = 20,
                size = 1) 
    }
} + {
  if (scatter && show_seed) {
    geom_text(data = joint_bench, alpha=0.15,
            aes(x = FPR_skel,
                y = TP_skel / true_n_edges_skel,
                label = replicate, col = id, shape = id),
          check_overlap = FALSE
          )
  }
 } + {
  if (param_annot) {
    geom_text(data = toplot, alpha=0.5,
            aes(x = FPR_skel_median,
                y = TPR_skel_median,
                label = curve_vals, col = id, shape = id),
          check_overlap = FALSE
          )
  }
 } +
facet_wrap(. ~ adjmat + parameters + data, nrow = 2) +
xlab("FPRp") +
ylab("TPR") +
ggtitle("Median FPRp/TPR (undirected skeleton)") +
theme_bw() +
theme(plot.title = element_text(hjust = 0.5))
ggsave(file = snakemake@output[["roc_FPRp_TPR_skel"]],plot=gg)


gg  <- ggplot() + {
  if (errorbar) {
    geom_errorbar(data = toplot, alpha=0.5,
              aes(x = FPR_skel_median,
                  ymin = FNR_skel_q1,
                  ymax = FNR_skel_q3,
                  col = id),
              width = 0.01)
  }
} + {
  if (path) {
    geom_path(data = toplot, alpha=0.8,
          aes(x = FPR_skel_median,
              y = FNR_skel_median,
              col = id))
  }
} + {
  if (!param_annot) {
    geom_point(data = toplot, alpha=0.5,
           aes(x = FPR_skel_median,
               y = FNR_skel_median,
               col = id,
               shape = id),
               size = 1) 
  }
} + {
    if(scatter && !show_seed){
        geom_point(data = joint_bench, alpha=0.3,
            aes(x = FPR_skel,
                y = FNR_skel,
                col = id),
                shape = 20,
                size = 1) 
    }
} + {
  if (scatter && show_seed) {
    geom_text(data = joint_bench, alpha=0.3,
            aes(x = FPR_skel,
                y = FNR_skel,
                label = replicate, col = id, shape = id),
          check_overlap = FALSE
          )
  }
 }+ {
  if (param_annot) {
    geom_text(data = toplot, alpha=0.5,
            aes(x = FPR_skel_median,
                y = FNR_skel_median,                
                label = curve_vals, col = id, shape = id),
          check_overlap = FALSE
          )
  }
} +
facet_wrap(. ~ adjmat + parameters + data, nrow = 2) +
xlab("FPRp") +
ylab("FNR") +
ggtitle("Median FPRp/FNR (undirected skeleton)") +
theme_bw() +
theme(plot.title = element_text(hjust = 0.5)) 
ggsave(file = snakemake@output[["FPRp_FNR_skel"]],plot=gg)

gg  <- ggplot() + {
  if (errorbar) {
    geom_errorbar(data = toplot, alpha=0.5,
              aes(x = FNR_skel_median,
                  ymin = FPR_skel_q1,
                  ymax = FPR_skel_q3,
                  col = id),
              width = 0.01)
  }
} + {
  if (path) {
    geom_path(data = toplot, alpha=0.7,
           aes(y = FPR_skel_median,
               x = FNR_skel_median,
               col = id))
  }
} + {
  if (!param_annot) {
    geom_point(data = toplot, alpha=0.5,
           aes(y = FPR_skel_median,
               x = FNR_skel_median,
               col = id,
               shape = id),
               size = 1) 
  }
} + {
    if(scatter && !show_seed){
        geom_point(data = joint_bench, alpha=0.2,
            aes(y = FPR_skel,
                x = FNR_skel,
                col = id),
                shape = 20,
                size = 1) 
    }
} + {
  if (scatter && show_seed) {
    geom_text(data = joint_bench, alpha=0.2,
            aes(y = FPR_skel,
                x = FNR_skel,
                label = replicate, col = id, shape = id),
          check_overlap = FALSE
          )
  }
 } + {
  if (param_annot) {
    geom_text(data = toplot, alpha=0.5,
        aes(x = FNR_skel_median,
        y = FPR_skel_median,
        label = curve_vals, col = id, shape = id),
        check_overlap = FALSE
        )
  }
} +
facet_wrap(. ~ adjmat + parameters + data, nrow = 2) +
ylab("FPR") +
xlab("FNR") +
ggtitle("Median FNR/FPRp (undirected skeleton)") +
theme_bw() +
theme(plot.title = element_text(hjust = 0.5))
ggsave(file = snakemake@output[["fnr_fprp_skel"]],plot=gg)


# adjmats <- unique(toplot["adjmat"])
# parameterss <- unique(toplot["parameters"])
# datas <- unique(toplot["data"])
# ids <- unique(toplot["id"])

# for (adjmat in adjmats){
#     for (parameters in parameterss){
#         for (data in datas) {
#             for (id in ids) {
#                 dftmp <- toplot %>% 
#                         filter(adjmat == adjmat) %>%
#                         filter(parameters == parameters) %>%
#                         filter(data == data) %>%
#                         filter(id == id)

#                 param <- unlist(unique(dftmp["curve_param"]))
#                 print(paste(c(unlist(adjmat), unlist(parameters), unlist(data))))
#                 print(data[1])
#                 print(unlist(parameters))
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

f <- function(y) 
    c(label=length(y), y=median(y))

dat <- joint_bench %>% tibble::rownames_to_column(var="outlier") %>% group_by(interaction(curve_param,curve_value)) %>% filter(!is.na(time))  %>% mutate(is_outlier=ifelse(is_outlier(time), replicate , as.numeric(NA)))
dat$outlier[which(is.na(dat$is_outlier))] <- as.numeric(NA)


# ggplot() + {
#     geom_boxplot(data = joint_bench, alpha=0.2,
#              aes(x=interaction(curve_param,curve_value), 
#              y = time, col=id, group_by=id) ) 
# } + {
#     if(show_seed){
#         stat_summary(data = joint_bench, alpha=0.5,
#                 aes(x=interaction(curve_param,curve_value), 
#                 y = time), fun.data=f, geom="text", vjust=-0.5, col="black") 
#     }
# } + {
#     if(show_seed){
#         geom_text(data=dat,
#             aes(y=time, x=interaction(curve_param,curve_value),
#                 label=is_outlier, col=id),na.rm=TRUE,nudge_x=0.0)
#     }
# }  +
#   facet_wrap(. ~ adjmat + parameters + data + id , ncol = 2, scales="free_x") +
#   ggtitle("Elapsed time") +
#   theme_bw() +
#   xlab("Parameter.value") +
#   ylab("Time (s.)") +
#   theme(plot.title = element_text(hjust = 0.5)) +
#   scale_x_discrete(guide = guide_axis(angle=10))
#   #scale_x_discrete(guide = guide_axis(n.dodge=2))
#   ggsave(file = snakemake@output[["elapsed_time"]])

ggplot() + {
    geom_boxplot(data = joint_bench, alpha=0.2,
             aes(x=interaction(curve_param,curve_value,id), 
             y = time, col=id, group_by=id) ) 
} + {
    if(show_seed){
        stat_summary(data = joint_bench, alpha=0.5,
                aes(x=interaction(curve_param,curve_value,id), 
                y = time), fun.data=f, geom="text", vjust=-0.5, col="black") 
    }
} + {
    if(show_seed){
        geom_text(data=dat, alpha=0.5,
            aes(y=time, x=interaction(curve_param,curve_value,id),
                label=is_outlier, col=id),na.rm=TRUE,nudge_x=0.0)
    }
}  +

  facet_wrap(. ~ adjmat + parameters + data , ncol = 2, scales="free_x") +
  ggtitle("Elapsed time") +
  theme_bw() +
  xlab("Parameter.value") +
  ylab("Time (s.)") +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_x_discrete(guide = guide_axis(angle=90))
  #scale_x_discrete(guide = guide_axis(n.dodge=2))
  ggsave(file = snakemake@output[["elapsed_time_joint"]])


ggplot() + {
    geom_point(data = joint_bench, alpha=0.8,
             aes(y=interaction(curve_param,curve_value, id), 
             x = as.factor(replicate), label=round(time, 1), col=graph_type, group_by=id) ) 
}  +
#+ {
#    geom_text(data = joint_bench, alpha=0.8,
#             aes(y=interaction(curve_param,curve_value, id), 
#             x = as.factor(replicate), label=round(time, 1), col=id, group_by=id) ) 
#}  +
  facet_wrap(. ~ adjmat + parameters + data , ncol = 2) +
  ggtitle("Graph type") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) 
  ggsave(file = snakemake@output[["graph_type"]])


dat <- joint_bench %>% tibble::rownames_to_column(var="outlier") %>% group_by(interaction(curve_param,curve_value)) %>% filter(!is.na(SHD_cpdag))  %>% mutate(is_outlier=ifelse(is_outlier(SHD_cpdag), replicate , as.numeric(NA)))
dat$outlier[which(is.na(dat$is_outlier))] <- as.numeric(NA)

# ggplot() + {
#     geom_boxplot(data = joint_bench, alpha=0.2,
#              aes(x=interaction(curve_param,curve_value), 
#              y = SHD_cpdag, col=id) ) 
# }  + {
#     if(show_seed){
#         geom_text(data=dat,
#             aes(y=SHD_cpdag, x=interaction(curve_param,curve_value),
#                 label=is_outlier, col=id),na.rm=TRUE,nudge_x=0.0)
#     }
# }  + {
#     if(show_seed){
#         stat_summary(data = joint_bench, alpha=0.5,
#                 aes(x=interaction(curve_param,curve_value), 
#                 y = SHD_cpdag), fun.data=f, geom="text", vjust=-0.5, col="black") 
#     }
# }+
#   facet_wrap(. ~ adjmat + parameters + data + id, ncol = 2, scales="free_x") +
#   ggtitle("SHD (CPDAG)") +
#   theme_bw() +
#   xlab("Parameter.value") +
#   ylab("SHD") +
#   theme(plot.title = element_text(hjust = 0.5)) +
#   scale_x_discrete(guide = guide_axis(angle=10))
#   ggsave(file = snakemake@output[["SHD_cpdag"]])

ggplot() + {
    geom_boxplot(data = joint_bench, alpha=0.2,
             aes(x=interaction(curve_param,curve_value, id), 
             y = SHD_cpdag, col=id) ) 
}  + {
    if(show_seed){
        geom_text(data=dat,
            aes(y=SHD_cpdag, x=interaction(curve_param,curve_value,id),
                label=is_outlier, col=id),na.rm=TRUE,nudge_x=0.0)
    }
}  + {
    if(show_seed){
        stat_summary(data = joint_bench, alpha=0.5,
                aes(x=interaction(curve_param,curve_value, id), 
                y = SHD_cpdag), fun.data=f, geom="text", vjust=-0.5, col="black") 
    }
}+
  facet_wrap(. ~ adjmat + parameters + data , ncol = 2, scales="free_x") +
  ggtitle("SHD (CPDAG)") +
  theme_bw() +
  xlab("Parameter.value") +
  ylab("SHD") +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_x_discrete(guide = guide_axis(angle=90))
#scale_x_discrete(guide = guide_axis(n.dodge=2))
  ggsave(file = snakemake@output[["SHD_cpdag_joint"]])

# F1 score
# ggplot() + {
#     geom_boxplot(data = joint_bench, alpha=0.2,
#              aes(x=interaction(curve_param,curve_value), 
#              y = TP_skel / (TP_skel + 0.5*(FP_skel + FN_skel)), col=id) ) 
# }  + {
#     if(show_seed){
#         geom_text(data=dat,
#             aes(y=TP_skel / (TP_skel + 0.5*(FP_skel + FN_skel)), x=interaction(curve_param,curve_value),
#                 label=is_outlier, col=id),na.rm=TRUE,nudge_x=0.0)
#     }
# }  + {
#     if(show_seed){
#         stat_summary(data = joint_bench, alpha=0.5,
#                 aes(x=interaction(curve_param,curve_value), 
#                 y = TP_skel / (TP_skel + 0.5*(FP_skel + FN_skel))), fun.data=f, geom="text", vjust=-0.5, col="black") 
#     }
# }+
#   facet_wrap(. ~ adjmat + parameters + data + id, ncol = 2, scales="free_x") +
#   ggtitle("F1 (undirected skeleton)") +
#   theme_bw() +
#   xlab("Parameter.value") +
#   ylab("F1") +
#   theme(plot.title = element_text(hjust = 0.5)) +
#   scale_x_discrete(guide = guide_axis(angle=10))
#   ggsave(file = snakemake@output[["f1_skel"]])

dat <- joint_bench %>% tibble::rownames_to_column(var="outlier") %>% group_by(interaction(curve_param,curve_value)) %>% filter(!is.na(TP_skel / (TP_skel + 0.5*(FP_skel + FN_skel))))  %>% mutate(is_outlier=ifelse(is_outlier(TP_skel / (TP_skel + 0.5*(FP_skel + FN_skel))), replicate , as.numeric(NA)))
dat$outlier[which(is.na(dat$is_outlier))] <- as.numeric(NA)

ggplot() + {
    geom_boxplot(data = joint_bench, alpha=0.2,
             aes(x=interaction(curve_param,curve_value, id), 
             y = TP_skel / (TP_skel + 0.5*(FP_skel + FN_skel)), col=id) ) 
}  + {
    if(show_seed){
        geom_text(data=dat,
            aes(y=TP_skel / (TP_skel + 0.5*(FP_skel + FN_skel)), x=interaction(curve_param,curve_value,id),
                label=is_outlier, col=id),na.rm=TRUE,nudge_x=0.0)
    }
}  +
  facet_wrap(. ~ adjmat + parameters + data , ncol = 2, scales="free_x") +
  ggtitle("F1 (undirected skeleton)") +
  theme_bw() +
  xlab("Parameter.value") +
  ylab("F1") +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_x_discrete(guide = guide_axis(angle=90))
#scale_x_discrete(guide = guide_axis(n.dodge=2))
  ggsave(file = snakemake@output[["f1_skel_joint"]])



#   ggplot() + {
#     geom_boxplot(data = joint_bench, 
#              aes(x=interaction(curve_param,curve_value), 
#              y = ntests) ) 
# } +
#   facet_wrap(. ~ adjmat + parameters + data + id, ncol = 2, scales="free_x") +
#   ggtitle("Number of calls to statistical criterion") +
#   theme_bw() +
#   xlab("Parameter.value") +
#   ylab("Number of calls") +
#   theme(plot.title = element_text(hjust = 0.5)) +
#   scale_x_discrete(guide = guide_axis(angle=7))
# #scale_x_discrete(guide = guide_axis(n.dodge=2))
#   ggsave(file = snakemake@output[["ntests"]])
# }

dat <- joint_bench %>% tibble::rownames_to_column(var="outlier") %>% 
                    group_by(interaction(curve_param,curve_value)) %>% 
                    filter(!is.na(ntests)) %>% 
                    mutate(is_outlier=ifelse(is_outlier(ntests), replicate , as.numeric(NA)))

dat$outlier[which(is.na(dat$is_outlier))] <- as.numeric(NA)

ggplot() + {
    geom_boxplot(data = joint_bench, alpha=0.2,
             aes(x=interaction(curve_param,curve_value, id), 
             y = ntests, col=id) ) 
}  + {
    if(show_seed){
        geom_text(data=dat,
            aes(y=ntests, x=interaction(curve_param,curve_value,id),
                label=is_outlier, col=id),na.rm=TRUE,nudge_x=0.0)
    }
}  + {
    if(show_seed){
        stat_summary(data = joint_bench, alpha=0.5,
                aes(x=interaction(curve_param,curve_value, id), 
                y = ntests), fun.data=f, geom="text", vjust=-0.5, col="black") 
    }
}+
  facet_wrap(. ~ adjmat + parameters + data , ncol = 2, scales="free_x") +
  ggtitle("Number of calls to statistical criterion") +
  theme_bw() +
  xlab("Parameter.value") +
  ylab("Number of calls") +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_x_discrete(guide = guide_axis(angle=90))
#scale_x_discrete(guide = guide_axis(n.dodge=2))
  ggsave(file = snakemake@output[["ntests_joint"]])

}