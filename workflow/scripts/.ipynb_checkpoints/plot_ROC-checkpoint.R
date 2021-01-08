library(RBGL)
library(ggplot2)
library(dplyr, warn.conflicts = FALSE)
#library(tibble)
library("rjson")

source("lib/code_for_binary_simulations/blip_vs_bidag_plot.R")
source("lib/code_for_binary_simulations/summarySE.R")

config <- fromJSON(file = "config.json")

directory <- config$output_dir
dims <- config$graphs$sampled$algorithms$generateDAGMaxParents$dims[[1]]
sample_sizes <- config$data$sample_sizes[[1]]
replicates <- config$data$replicates$start:config$data$replicates$end
dag_avparents <-config$graphs$sampled$algorithms$generateDAGMaxParents$av_parents[[1]]

sample_sizes
dims
replicates
dag_avparents

rjson::fromJSON('[[[1,0], [0,1]]]', simplify = TRUE)


config

filenames <- list.files(pattern = "csv", path = file.path(directory, "res/orderMCMC"), recursive=TRUE)
ROCdf_order_mcmc_itsearch_map <- data.frame()
ROCdf_order_mcmc_itsearch_sample <- data.frame()
ROCdf_order_mcmc <- data.frame()

tmpdf <- NULL
for (filename in filenames) {
    tmpdf <- read.csv(file.path(directory, "res/orderMCMC", filename))
    ROCdf_order_mcmc <- dplyr::bind_rows(ROCdf_order_mcmc, tmpdf)
}

ROCdf_order_mcmc

sumROC_order_mcmc = ROCdf_order_mcmc %>%
                    filter(dim %in% dims) %>%
                    filter(sample_size %in% sample_sizes) %>%
                    filter(avparents %in% dag_avparents) %>%
                    filter(replicate %in% replicates) %>%
                    # filter(is.na(itsearch_plus1it) | (itsearch_plus1it %in% config$itsearch_sample$optional$plus1it)) %>%
                    group_by(legend, threshold, sample_size, dim, avparents) %>% 
                    summarise(SHD_mean = mean(SHD),
                              TPR_mean = mean(TPR), 
                              TPR_median = median(TPR), 
                              FPRn_median = median(FPRn), 
                              TPR_q1 = quantile(TPR, probs = c(0.05)), 
                              TPR_q3 = quantile(TPR, probs = c(0.95)),
                              time_mean = mean(time),
                              logscore_mean = mean(logscore),
                              N = n()) #%>%
                    #filter(N %in% length(replicates))

labels <- apply(sumROC_order_mcmc, 1, function(row) {
    paste("p=",row["dim"], ", n=",row["sample_size"], ", avparents=", row["avparents"], ", N=",row["N"] , sep="")
})

sumROC_order_mcmc["labels"] <- labels

sumROC_order_mcmc

filenames <- list.files(pattern = "csv", path = file.path(directory, "res/itsearch"), recursive = TRUE)
ROCdf_itsearch <- data.frame()
for (filename in filenames) {
  tmpdf <- read.csv(file.path(directory,"res/itsearch", filename))
  # Convert "None" string to NA
    tmpdf["plus1it"] <- na_if(tmpdf["plus1it"], "None")
   tmpdf["posterior"] <- na_if(tmpdf["posterior"], "None")
    ROCdf_itsearch <- dplyr::bind_rows(ROCdf_itsearch, tmpdf)
  
}

ROCdf_itsearch

names(ROCdf_itsearch)filenames <- list.files(pattern = "csv", path = file.path(directory, "res/pcalg"), recursive = TRUE)
roc_pcalg <- data.frame()
for (filename in filenames) {
  tmpdf <- read.csv(file.path(directory, "res/pcalg", filename))
  roc_pcalg <- dplyr::bind_rows(roc_pcalg, tmpdf)
}

#ROCdf_itsearch$algorithm <- apply(ROCdf_itsearch["MAP"], 1, 
# function(a){
#    if(a==TRUE){ 
#        return("itsearch_map")
#     }else {
#        return("itsearch_sample")
#      }
#  })                                          

sum_roc_itsearch <- ROCdf_itsearch %>% 
                filter(dim %in% dims) %>%
                filter(sample_size %in% sample_sizes) %>%
                filter(avparents %in% dag_avparents) %>%
                filter(is.na(plus1it) | (plus1it %in% config$algorithms$itsearch_sample$optional$plus1it)) %>%
                 group_by(legend, sample_size, dim, avparents) %>% 
                 summarise( SHD_mean = mean(SHD),
                           TPR_mean = mean(TPR), 
                          TPR_median = median(TPR), 
                          FPRn_median = median(FPRn), 
                          TPR_q1 = quantile(TPR, probs = c(0.05)), 
                          TPR_q3 = quantile(TPR, probs = c(0.95)),
                          logscore_mean =  mean(logscore),
                           time_mean = mean(time),
                         #  it_mean = mean(it),
                          N = n()) #%>%
                    #filter(N %in% length(replicates))0

labels <- apply(sum_roc_itsearch, 1, function(row) {
    paste("p=",row["dim"],", n=",row["sample_size"], ", avparents=", row["avparents"], ", N=",row["N"] , sep="")
})

sum_roc_itsearch["labels"] <- labels 

labels

sum_roc_itsearch

filenames <- list.files(pattern = "csv", path = file.path(directory, "res/pcalg"), recursive = TRUE)
roc_pcalg <- data.frame()
for (filename in filenames) {
  tmpdf <- read.csv(file.path(directory, "res/pcalg", filename))
  roc_pcalg <- dplyr::bind_rows(roc_pcalg, tmpdf)
}

roc_pcalg

sum_roc_pcalg <- roc_pcalg %>% 
                 filter(dim %in% dims) %>%
                 filter(sample_size %in% sample_sizes) %>%         
                 filter(avparents %in% dag_avparents) %>%
                filter(replicate %in% replicates) %>%
                 group_by(legend, alpha, sample_size, dim, avparents) %>% 
                 summarise(
                          SHD_mean = mean(SHD),
                          TPR_mean = mean(TPR), 
                          TPR_median = median(TPR), 
                          FPRn_median = median(FPRn), 
                          TPR_q1 = quantile(TPR, probs = c(0.05)), 
                          TPR_q3 = quantile(TPR, probs = c(0.95)),
                          time_mean = mean(time),
                          N = n())# %>% ungroup() %>%
#                 filter(N %in% replicates)
labels <- apply(sum_roc_pcalg, 1, function(row) {
    paste("p=",row["dim"], ", n=",row["sample_size"], ", avparents=", row["avparents"], ", N=",row["N"] , sep="")
})

sum_roc_pcalg["labels"] <- labels 

sum_roc_pcalg

filenames <- list.files(pattern = "csv", path = file.path(directory, "res/mmhc"), recursive = TRUE)

roc_mmhc <- data.frame()
for (filename in filenames) {
  tmpdf <- read.csv(file.path(directory, "res/mmhc", filename))
  roc_mmhc <- dplyr::bind_rows(roc_mmhc, tmpdf)
}

roc_mmhc

sum_roc_mmhc <- roc_mmhc %>% 
                filter(dim %in% dims) %>%
                filter(sample_size %in% sample_sizes) %>%
                    filter(avparents %in% dag_avparents) %>% 
                filter(replicate %in% replicates) %>%
                 group_by(legend, alpha, sample_size, dim, avparents) %>% 
                 summarise( SHD_mean = mean(SHD),
                           TPR_mean = mean(TPR), 
                          TPR_median = median(TPR), 
                          FPRn_median = median(FPRn), 
                          TPR_q1 = quantile(TPR, probs = c(0.05)), 
                          TPR_q3 = quantile(TPR, probs = c(0.95)),
                           time_mean = mean(time),
                          N = n()) #%>% ungroup() %>%
                    #filter(N %in% replicates)

labels <- apply(sum_roc_mmhc, 1, function(row) {
    paste("p=",row["dim"], ", n=",row["sample_size"], ", avparents=", row["avparents"], ", N=",row["N"] , sep="")
})

sum_roc_mmhc["labels"] <- labels 

sum_roc_mmhc

filenames <- list.files(pattern = "csv", path = file.path(directory, "res/fges"), recursive = TRUE)

roc_fges <- data.frame()
for (filename in filenames) {
  tmpdf <- read.csv(file.path(directory, "res/fges", filename))
  roc_fges <- dplyr::bind_rows(roc_fges, tmpdf)
}

roc_fges

sum_roc_fges <- roc_fges %>% 
                filter(dim %in% dims) %>%
                filter(sample_size %in% sample_sizes) %>%
                    filter(avparents %in% dag_avparents) %>% 
                filter(replicate %in% replicates) %>%
                 group_by(legend, sample_size, dim, avparents) %>% 
                 summarise( SHD_mean = mean(SHD),
                           TPR_mean = mean(TPR), 
                          TPR_median = median(TPR), 
                          FPRn_median = median(FPRn), 
                          TPR_q1 = quantile(TPR, probs = c(0.05)), 
                          TPR_q3 = quantile(TPR, probs = c(0.95)),
                           time_mean = mean(time),
                          N = n()) #%>% ungroup() %>%
                    #filter(N %in% replicates)

labels <- apply(sum_roc_fges, 1, function(row) {
    paste("p=",row["dim"], ", n=",row["sample_size"], ", avparents=", row["avparents"], ", N=",row["N"] , sep="")
})

sum_roc_fges["labels"] <- labels 

sum_roc_fges

filenames <- list.files(pattern = "csv", path = file.path(directory, "res/blip"), recursive = TRUE)

ROCdf_blip <- data.frame()
for (filename in filenames) {
  tmpdf <- read.csv(file.path(directory, "res/blip", filename))
  ROCdf_blip <- dplyr::bind_rows(ROCdf_blip, tmpdf)
}

ROCdf_blip

blip_scores <- ROCdf_blip %>% 
                select(c("legend","replicate", "avparents", "sample_size", "dim", "logscore", "max_time")) %>%
                filter(dim %in% dims) %>%
                filter(sample_size %in% sample_sizes) %>%
                filter(avparents %in% dag_avparents) %>% 
                filter(replicate %in% replicates)
rename(blip_scores, logscore_blip=logscore)

blip_scores <- ROCdf_blip %>% 
                select(c("legend","replicate", "avparents", "sample_size", "dim", "logscore", "max_time")) %>%
                filter(dim %in% dims) %>%
                filter(sample_size %in% sample_sizes) %>%
                filter(avparents %in% dag_avparents) %>% 
                filter(replicate %in% replicates) 
blip_scores <- rename(blip_scores, logscore_blip=logscore)
blip_scores <- rename(blip_scores, legend_blip=legend)


itsearch_scores <- ROCdf_itsearch %>% 
                select(c("legend","replicate", "avparents", "sample_size", "dim", "logscore")) %>%
                filter(dim %in% dims) %>%
                filter(sample_size %in% sample_sizes) %>%
                filter(avparents %in% dag_avparents) %>% 
                filter(replicate %in% replicates) 
itsearch_scores <- rename(itsearch_scores, logscore_itsearch=logscore)
itsearch_scores <- rename(itsearch_scores, legend_itsearch=legend)

order_mcmc_scores <- ROCdf_order_mcmc %>% 
                select(c("legend","replicate", "avparents", "sample_size", "dim", "logscore")) %>%
                filter(dim %in% dims) %>%
                filter(sample_size %in% sample_sizes) %>%
                filter(avparents %in% dag_avparents) %>% 
                filter(replicate %in% replicates) 
order_mcmc_scores <- rename(order_mcmc_scores, logscore_order_mcmc=logscore)
order_mcmc_scores <- rename(order_mcmc_scores, legend_order_mcmc=legend)

#blip_scores
#itsearch_scores
#order_mcmc_scores

cols <- c("replicate", "avparents", "sample_size", "dim")

scores <- left_join(blip_scores, itsearch_scores, by=cols)
scores$blip_minus_itsearch <- scores$logscore_blip - scores$logscore_itsearch
difflogscore_itsearch <- scores

#print(difflogscore_itsearch)
#scores <- blip_scores %>% left_join(itsearch_scores,by=c("replicate", "avparents", "sample_size", "dim"), suffix = c(".blip",".itsearch")) %>%
#        left_join(order_mcmc_scores,by=c("replicate", "avparents", "sample_size", "dim"), suffix = c(".blip",".itsearch"), name="test")
difflogscore_itsearch <- difflogscore_itsearch %>% 
                         group_by(legend_itsearch, sample_size, dim, avparents) %>% 
                         summarise(logscore_mean=mean(blip_minus_itsearch),        
                        N=n())

labels <- apply(difflogscore_itsearch, 1, function(row) {
    paste("p=",row["dim"], ", n=",row["sample_size"], ", avparents=", row["avparents"], ", N=",row["N"] , sep="")
})


# TODO: Compare to one of the blip max_times
difflogscore_itsearch["labels"] <- labels 

difflogscore_itsearch

#ggplot() + 
#geom_point(data = sumROC_order_mcmc,
#          aes(x = algorithm,
#              y = logscore_mean,
#              col = algorithm)) +
#geom_text(data = sumROC_order_mcmc,
#          aes(x = algorithm, 
#               y = logscore_mean,               
#                col = algorithm, label=threshold),
#            check_overlap = TRUE,
#           nudge_x=0.2,
#          nudge_y=0.9) +

#geom_point(data = sum_roc_pcalg,
#          aes(x = algorithm,
#              y = logscore_mean,
#              col = algorithm)) +
#geom_point(data = sum_roc_mmhc,
#          aes(x = algorithm,
#              y = logscore_mean,
#              col = algorithm)) +

#geom_point(data = sum_roc_blip,
#          aes(x = algorithm,
#              y = logscore_mean,
#              col = algorithm)) +
#geom_point(data = sum_roc_itsearch,
#          aes(x = algorithm,
#              y = logscore_mean,
#              col = algorithm)) +
#theme(axis.text.x = element_text(angle = 10),
#      legend.position = "none") +
#facet_wrap(. ~ labels, scales="free_y") +
#ylab("Mean log-score") +
#xlab("Algorithm") +
#ggsave(file=file.path("logscore.eps"))


sum_roc_blip <- ROCdf_blip %>% 
                filter(dim %in% dims) %>%
                filter(sample_size %in% sample_sizes) %>%
                filter(avparents %in% dag_avparents) %>%      
                filter(replicate %in% replicates) %>%
                filter(indeg %in% config$algorithms$blip$indeg) %>%
                 group_by(legend, sample_size, dim,max_time, avparents) %>% 
                 summarise( SHD_mean = mean(SHD),
                           TPR_mean = mean(TPR),
                          time_mean=mean(time),
                          TPR_median = median(TPR), 
                          FPRn_median = median(FPRn), 
                          TPR_q1 = quantile(TPR, probs = c(0.05)),
                          TPR_q3 = quantile(TPR, probs = c(0.95)),
                           logscore_mean = mean(logscore),
                          N = n())#%>%
                    #filter(N %in% replicates)
labels <- apply(sum_roc_blip, 1, function(row) {
    paste("p=",row["dim"], ", n=",row["sample_size"], ", avparents=", row["avparents"], ", N=",row["N"] , sep="")
})

sum_roc_blip["labels"] <- labels 

sum_roc_blip

filenames <- list.files(pattern = "csv", path = file.path(directory, "res/gobnilp"), recursive = TRUE)

ROCdf_gobnilp <- data.frame()
for (filename in filenames) {
  tmpdf <- read.csv(file.path(directory, "res/gobnilp", filename))
  ROCdf_gobnilp <- dplyr::bind_rows(ROCdf_gobnilp, tmpdf)
}

ROCdf_gobnilp

sum_roc_gobnilp <- ROCdf_gobnilp %>% 
                filter(dim %in% dims) %>%
                    filter(sample_size %in% sample_sizes) %>%
                    filter(avparents %in% avparents) %>%          
                filter(replicate %in% replicates) %>%
                   group_by(legend, sample_size, dim, avparents, palim) %>% 
                 summarise( SHD_mean = mean(SHD),
                     TPR_mean = mean(TPR), 
                          TPR_median = median(TPR), 
                          FPRn_median = median(FPRn), 
                          TPR_q1 = quantile(TPR, probs = c(0.05)),
                          TPR_q3 = quantile(TPR, probs = c(0.95)),
                           time_mean = mean(time),
                          N = n())#%>%
                    #filter(N %in% length(replicates))
labels <- apply(sum_roc_gobnilp, 1, function(row) {
    paste("p=",row["dim"], ", n=",row["sample_size"], ", avparents=", row["avparents"], ", N=",row["N"] , sep="")
})

sum_roc_gobnilp["labels"] <- labels 

sum_roc_gobnilp

sumROC_order_mcmc

ggplot() +
# PC algorithm
geom_errorbar(data = sum_roc_pcalg,
              aes(x = FPRn_median,
                  ymin = TPR_q1, 
                  ymax = TPR_q3, 
                  col = legend), 
              width = 0.01) +
geom_path(data = sum_roc_pcalg,
          aes(x = FPRn_median, 
              y = TPR_median,
              col = legend)) +
geom_point(data = sum_roc_pcalg,
           aes(x = FPRn_median, 
               y = TPR_median,               
               col = legend, 
               shape = legend), 
               size = 1) + 
 #geom_text(data = sum_roc_pcalg,
 #           aes(x = FPRn_median, 
 #               y = TPR_q3,               
 #               label=alpha, col=legend),
 #         check_overlap = TRUE,
 #          nudge_x=-0.02,
 #         nudge_y=0.02
 #         ) +

# Max-min hill- climbing 
geom_errorbar(data = sum_roc_mmhc,
              aes(x = FPRn_median,
                  ymin = TPR_q1, 
                  ymax = TPR_q3, 
                  col = legend), 
              width = 0.01) +
geom_path(data = sum_roc_mmhc,
          aes(x = FPRn_median, 
              y = TPR_median,
              col = legend)) +
geom_point(data = sum_roc_mmhc,
           aes(x = FPRn_median, 
               y = TPR_median,               
               col = legend, 
               shape = legend), 
               size = 1) + 
# geom_text(data = sum_roc_mmhc,
#            aes(x = FPRn_median, 
#                y = TPR_q3,               
#                label=alpha, col=legend),
#          check_overlap = TRUE,
#           nudge_x=-0.02,
#          nudge_y=0.02
#          ) +

# Order mcmc
geom_errorbar(data = sumROC_order_mcmc,
              aes(x = FPRn_median,
                  ymin = TPR_q1, 
                  ymax = TPR_q3, 
                  col = legend), 
              width = 0.01) +
geom_path(data = sumROC_order_mcmc,
          aes(x = FPRn_median, 
              y = TPR_median,
              col = legend)) +
geom_point(data = sumROC_order_mcmc,
           aes(x = FPRn_median, 
               y = TPR_median,               
               col = legend, 
               shape = legend), 
               size = 2) +
# geom_text(data = sumROC_order_mcmc,
#            aes(x = FPRn_median, 
#                y = TPR_q3,               
#                col = legend, label=threshold),
#            check_overlap = TRUE,
#           nudge_x=-0.02,
#          nudge_y=0.02) +

# Iterative search
geom_errorbar(data = sum_roc_itsearch,
              aes(x = FPRn_median,
                  ymin = TPR_q1, 
                  ymax = TPR_q3, 
                  col = legend), 
              width = 0.01) +
geom_path(data = sum_roc_itsearch,
          aes(x = FPRn_median, 
              y = TPR_median,
              col = legend)) +
geom_point(data = sum_roc_itsearch,
           aes(x = FPRn_median, 
               y = TPR_median,               
               col = legend, 
               shape = legend), 
               size = 1) +
# Blip
geom_errorbar(data = sum_roc_blip,
              aes(x = FPRn_median,
                  ymin = TPR_q1, 
                  ymax = TPR_q3, 
                  col = legend), 
              width = 0.01) +
geom_path(data = sum_roc_blip,
          aes(x = FPRn_median, 
              y = TPR_median,
              col = legend)) +
geom_point(data = sum_roc_blip,
           aes(x = FPRn_median, 
               y = TPR_median,               
               col = legend, 
               shape = legend), 
               size = 1) +
# Gobnilp
 geom_errorbar(data = sum_roc_gobnilp,
               aes(x = FPRn_median,
                   ymin = TPR_q1, 
                   ymax = TPR_q3, 
                   col = legend), 
               width = 0.01) +
 geom_path(data = sum_roc_gobnilp,
           aes(x = FPRn_median, 
               y = TPR_median,
               col = legend)) +
 geom_point(data = sum_roc_gobnilp,
            aes(x = FPRn_median, 
                y = TPR_median,               
                col = legend, 
                shape = legend), 
                size = 1) +
# FGES
 geom_errorbar(data = sum_roc_fges,
               aes(x = FPRn_median,
                   ymin = TPR_q1, 
                   ymax = TPR_q3, 
                   col = legend), 
               width = 0.01) +
 geom_path(data = sum_roc_fges,
           aes(x = FPRn_median, 
               y = TPR_median,
               col = legend)) +
 geom_point(data = sum_roc_fges,
            aes(x = FPRn_median, 
                y = TPR_median,               
                col = legend, 
                shape = legend), 
                size = 1) +
# Subplot
# 

# put full label in the dataframe and save it as label.
# then write  facet_wrap(. ~ label)

#facet_wrap(. ~ dim + avparents + sample_size + N, scales="free_x", nrow = 2) +
facet_wrap(. ~ labels, scales="free_x", nrow = 2) +

# Titles etc
xlab("FPRn") +
ylab("TPR") +
ggtitle("ROC") +
theme(plot.title = element_text(hjust = 0.5))
ggsave(file=file.path("ROC.eps"))



#ggplot() + 
#geom_point(data = sumROC_order_mcmc,
#          aes(x = algorithm,
#              y = SHD_mean,
#              col = algorithm)) +
#geom_text(data = sumROC_order_mcmc,
#          aes(x = algorithm, 
#               y = SHD_mean,               
#                col = algorithm, label=threshold),
#            check_overlap = TRUE,
#           nudge_x=0.2,
#          nudge_y=0.9) +

#geom_point(data = sum_roc_pcalg,
#          aes(x = algorithm,
#              y = SHD_mean,
#              col = algorithm)) +
#geom_text(data = sum_roc_pcalg,
#          aes(x = algorithm, 
#               y = SHD_mean,               
#                col = algorithm, label=alpha),
#            check_overlap = TRUE,
#           nudge_x=0.2,
#          nudge_y=0.9) +

#geom_point(data = sum_roc_mmhc,
#          aes(x = algorithm,
#              y = SHD_mean,
#              col = algorithm)) +
#geom_text(data = sum_roc_mmhc,
#          aes(x = algorithm, 
#               y = SHD_mean,               
#                col = algorithm, label=alpha),
#            check_overlap = TRUE,
#           nudge_x=0.2,
#          nudge_y=0.9) +

#geom_point(data = sum_roc_blip,
#          aes(x = algorithm,
#              y = SHD_mean,
#              col = algorithm)) +
#geom_point(data = sum_roc_itsearch,
#          aes(x = algorithm,
#              y = SHD_mean,
#              col = algorithm)) +
#theme(axis.text.x = element_text(angle = 15), legend.position = "none") +
#facet_wrap(. ~ labels, scales="free_x") +
#ylab("Mean SHD") +
#xlab("Algorithm") 
#ggsave(file=file.path("SHD.eps"))



#ggplot() + 
#geom_point(data = sumROC_order_mcmc,
#          aes(x = algorithm,
#              y = logscore_mean,
#              col = algorithm)) +
#geom_text(data = sumROC_order_mcmc,
#          aes(x = algorithm, 
#               y = logscore_mean,               
#                col = algorithm, label=threshold),
#            check_overlap = TRUE,
#           nudge_x=0.2,
#          nudge_y=0.9) +

#geom_point(data = sum_roc_pcalg,
#          aes(x = algorithm,
#              y = logscore_mean,
#              col = algorithm)) +
#geom_point(data = sum_roc_mmhc,
#          aes(x = algorithm,
#              y = logscore_mean,
#              col = algorithm)) +
#geom_point(data = sum_roc_blip,
#          aes(x = algorithm,
#              y = logscore_mean,
#              col = algorithm)) +
#geom_point(data = sum_roc_itsearch,
#          aes(x = algorithm,
#              y = logscore_mean,
#              col = algorithm)) +
#theme(axis.text.x = element_text(angle = 10),
#      legend.position = "none") +
#facet_wrap(. ~ labels, scales="free_y") +
#ylab("Mean log-score") +
#xlab("Algorithm") +
#ggsave(file=file.path("logscore.eps"))


#ggplot() + 
#geom_point(data = sumROC_order_mcmc,
#          aes(x = algorithm,
#              y = time_mean,
#              col = algorithm)) +
#geom_point(data = sum_roc_pcalg,
#          aes(x = algorithm,
#              y = time_mean,
#              col = algorithm)) +
#geom_text(data = sum_roc_pcalg,
#          aes(x = algorithm, 
#               y = time_mean,               
#                col = algorithm, label=alpha),
#            check_overlap = TRUE,
#           nudge_x=0.2,
#          nudge_y=0.9) +

#geom_point(data = sum_roc_mmhc,
#          aes(x = algorithm,
#              y = time_mean,
#              col = algorithm)) +
#geom_point(data = sum_roc_blip,
#          aes(x = algorithm,
#              y = time_mean,
#              col = algorithm)) +
#geom_point(data = sum_roc_itsearch,
#          aes(x = algorithm,
#              y = time_mean,
#             col = algorithm)) +
#theme(axis.text.x = element_text(angle = 10), legend.position = "none") +
#facet_wrap(dim ~ sample_size + N + avparents, scales="free_x") +
#ylab("Mean run time (s)") +
#xlab("Algorithm") 
#ggsave(file=file.path("runtimes.eps"))


