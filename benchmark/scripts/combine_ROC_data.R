#library(RBGL)
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
#dag_avparents <-config$graphs$sampled$algorithms$generateDAGMaxParents$av_parents[[1]]

toplot <- data.frame()

#print(config$plotting$algorithms)

if("ordermcmc_sample" %in% config$plotting$algorithms) {
    ROCdf_order_mcmc <- read.csv("simresults/ordermcmc_sample.csv")
    sumROC_order_mcmc = ROCdf_order_mcmc %>%
                        #filter(dim %in% dims) %>%
                        #filter(sample_size %in% sample_sizes) %>%
                        #filter(avparents %in% dag_avparents) %>%
                        filter(replicate %in% replicates) %>%
                        # filter(is.na(itsearch_plus1it) | (itsearch_plus1it %in% config$itsearch_sample$optional$plus1it)) %>%
                        # group_by(legend, !!as.symbol("threshold"), sample_size, dim, avparents) %>% 
                        group_by(legend, adjmat, bn, data, !!as.symbol("threshold")) %>% 
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

    #labels <- apply(sumROC_order_mcmc, 1, function(row) {
    #    paste("p=",row["dim"], ", n=",row["sample_size"], ", avparents=", row["avparents"], ", N=",row["N"] , sep="")
    #})
    #sumROC_order_mcmc["labels"] <- labels
    sumROC_order_mcmc["labels"] <- NA
    toplot <- dplyr::bind_rows(toplot, sumROC_order_mcmc)
}

if("itsearch_map" %in% config$plotting$algorithms) {
    ROCdf_itsearch <-read.csv("simresults/itsearch_map.csv")
    sum_roc_itsearch <- ROCdf_itsearch %>% 
                    #filter(!!as.symbol("dim") %in% dims) %>%
                    #filter(sample_size %in% sample_sizes) %>%
                    #filter(avparents %in% dag_avparents) %>%
                    #filter(is.na(plus1it) | (plus1it %in% config$algorithms$itsearch_sample$optional$plus1it)) %>%
                     group_by(legend, adjmat, bn, data) %>% 
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

    #labels <- apply(sum_roc_itsearch, 1, function(row) {
    #    paste("p=",row["dim"],", n=",row["sample_size"], ", avparents=", row["avparents"], ", N=",row["N"] , sep="")
    #})

    #sum_roc_itsearch["labels"] <- labels 
    sum_roc_itsearch["labels"] <- NA
    toplot <- dplyr::bind_rows(toplot, sum_roc_itsearch)
}

if("itsearch_sample" %in% config$plotting$algorithms) {
    ROCdf_itsearch <-read.csv("simresults/itsearch_sample.csv")
    sum_roc_itsearch <- ROCdf_itsearch %>% 
                    #filter(!!as.symbol("dim") %in% dims) %>%
                    #filter(sample_size %in% sample_sizes) %>%
                    #filter(avparents %in% dag_avparents) %>%
                    #filter(is.na(plus1it) | (plus1it %in% config$algorithms$itsearch_sample$optional$plus1it)) %>%
                     group_by(legend, adjmat, bn, data) %>% 
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

    #labels <- apply(sum_roc_itsearch, 1, function(row) {
    #    paste("p=",row["dim"],", n=",row["sample_size"], ", avparents=", row["avparents"], ", N=",row["N"] , sep="")
    #})

    #sum_roc_itsearch["labels"] <- labels 
    sum_roc_itsearch["labels"] <- NA
    toplot <- dplyr::bind_rows(toplot, sum_roc_itsearch)
}

if("pcalg" %in% config$plotting$algorithms) {
    roc_pcalg <-read.csv("simresults/pcalg.csv")

    sum_roc_pcalg <- roc_pcalg %>% 
                     #filter(dim %in% dims) %>%
                     #filter(sample_size %in% sample_sizes) %>%         
                     #filter(avparents %in% dag_avparents) %>%
                    filter(replicate %in% replicates) %>%
                     #group_by(legend, !!as.symbol("alpha"), sample_size, dim, avparents) %>% 
                     group_by(legend, adjmat, bn, data, !!as.symbol("alpha")) %>% 
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
    #labels <- apply(sum_roc_pcalg, 1, function(row) {
    #    paste("p=",row["dim"], ", n=",row["sample_size"], ", avparents=", row["avparents"], ", N=",row["N"] , sep="")
    #})

    #sum_roc_pcalg["labels"] <- labels 
    sum_roc_pcalg["labels"] <- NA   
    toplot <- dplyr::bind_rows(toplot, sum_roc_pcalg)
}

if("mmhc" %in% config$plotting$algorithms) {

    roc_mmhc <- read.csv("simresults/mmhc.csv")

    sum_roc_mmhc <- roc_mmhc %>% 
                    #filter(dim %in% dims) %>%
                    #filter(sample_size %in% sample_sizes) %>%
                    #filter(avparents %in% dag_avparents) %>% 
                    filter(replicate %in% replicates) %>%
                     group_by(legend,adjmat,bn,data, !!as.symbol("alpha")) %>% 
                     summarise( SHD_mean = mean(SHD),
                               TPR_mean = mean(TPR), 
                              TPR_median = median(TPR), 
                              FPRn_median = median(FPRn), 
                              TPR_q1 = quantile(TPR, probs = c(0.05)), 
                              TPR_q3 = quantile(TPR, probs = c(0.95)),
                               time_mean = mean(time),
                              N = n()) #%>% ungroup() %>%
                        #filter(N %in% replicates)

    #labels <- apply(sum_roc_mmhc, 1, function(row) {
    #    paste("p=",row["dim"], ", n=",row["sample_size"], ", avparents=", row["avparents"], ", N=",row["N"] , sep="")
    #})

    #sum_roc_mmhc["labels"] <- labels 
    sum_roc_mmhc["labels"] <- NA
    #sum_roc_mmhc
    toplot <- dplyr::bind_rows(toplot, sum_roc_mmhc)
}

if("fges" %in% config$plotting$algorithms) {
    roc_fges <- read.csv("simresults/fges.csv")

    sum_roc_fges <- roc_fges %>% 
                    #filter(dim %in% dims) %>%
                    #filter(sample_size %in% sample_sizes) %>%
                    #filter(avparents %in% dag_avparents) %>% 
                    filter(replicate %in% replicates) %>%
                    group_by(legend,adjmat,bn,data) %>% 
                    summarise( SHD_mean = mean(SHD),
                            TPR_mean = mean(TPR), 
                            TPR_median = median(TPR), 
                            FPRn_median = median(FPRn), 
                            TPR_q1 = quantile(TPR, probs = c(0.05)), 
                            TPR_q3 = quantile(TPR, probs = c(0.95)),
                            time_mean = mean(time),
                            N = n()) #%>% ungroup() %>%
                        #filter(N %in% replicates)

    #labels <- apply(sum_roc_fges, 1, function(row) {
    #    paste("p=",row["dim"], ", n=",row["sample_size"], ", avparents=", row["avparents"], ", N=",row["N"] , sep="")
    #})

    #sum_roc_fges["labels"] <- labels 
    sum_roc_fges["labels"] <- NA 


    toplot <- dplyr::bind_rows(toplot, sum_roc_fges)
}

if("blip" %in% config$plotting$algorithms) {
    ROCdf_blip <- read.csv("simresults/blip.csv")
    sum_roc_blip <- ROCdf_blip %>% 
                #filter(dim %in% dims) %>%
                #filter(sample_size %in% sample_sizes) %>%
                #filter(avparents %in% dag_avparents) %>%      
                filter(replicate %in% replicates) %>%
                #filter(indeg %in% config$algorithms$blip$indeg) %>%
                # group_by(legend, sample_size, dim, !!as.symbol("max_time"), avparents) %>% 
                 group_by(legend, adjmat, bn, data, !!as.symbol("max_time")) %>% 
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

    #sum_roc_blip["labels"] <- labels 
    sum_roc_blip["labels"] <- NA
    toplot <- dplyr::bind_rows(toplot, sum_roc_blip)
}

if("gobnilp" %in% config$plotting$algorithms) {
    ROCdf_gobnilp <- read.csv("simresults/gobnilp.csv")
    sum_roc_gobnilp <- ROCdf_gobnilp %>% 
                    #filter(dim %in% dims) %>%
                    #filter(sample_size %in% sample_sizes) %>%
                    #filter(avparents %in% avparents) %>%          
                    filter(replicate %in% replicates) %>%
                    #group_by(legend, sample_size, dim, avparents, !!as.symbol("palim")) %>% 
                    group_by(legend, adjmat, bn, data, !!as.symbol("palim")) %>% 
                     summarise( SHD_mean = mean(SHD),
                     TPR_mean = mean(TPR), 
                          TPR_median = median(TPR), 
                          FPRn_median = median(FPRn), 
                          TPR_q1 = quantile(TPR, probs = c(0.05)),
                          TPR_q3 = quantile(TPR, probs = c(0.95)),
                           time_mean = mean(time),
                          N = n())#%>%
                    #filter(N %in% length(replicates))
    #labels <- apply(sum_roc_gobnilp, 1, function(row) {
    #    paste("p=",row["dim"], ", n=",row["sample_size"], ", avparents=", row["avparents"], ", N=",row["N"] , sep="")
    #})

    sum_roc_gobnilp["labels"] <- NA
    #sum_roc_gobnilp["labels"] <- labels 
    toplot <- dplyr::bind_rows(toplot, sum_roc_gobnilp)
}

write.csv(toplot,  file.path(directory, "ROC_data.csv"))

