library(dplyr, warn.conflicts = FALSE)
library("rjson")

source("lib/code_for_binary_simulations/blip_vs_bidag_plot.R")
source("lib/code_for_binary_simulations/summarySE.R")

config <- fromJSON(file = "config.json")

directory <- config$output_dir

replicates <- config$data$replicates$start:config$data$replicates$end

toplot <- data.frame()
active_algorithms <- c()

for(alg_name in names(config$structure_learning_algorithms)) {
    for (alg_conf in config$structure_learning_algorithms[[alg_name]]) {
       if(alg_conf$id %in% config$plotting$algorithms) {
           active_algorithms <- c(active_algorithms, alg_name)
       }
    }
}
active_algorithms <- unique(active_algorithms)

bns <- c()
adjmats <- c()
for (model in config$plotting$models) {
    bns <- c(bns, model$parameters)
    adjmats <- c(bns, model$graph)
}

for (model in config$plotting$fixed_data) {
    adjmats <- c(adjmats, model$graph)
    data <- c(data, model$data)
}
# Wee need the model and parameter strings here..
# maybe switch to pandas.
bns <- unique(bns)
adjmats <- unique(adjmats)

if("order_mcmc" %in% active_algorithms) {
    ROCdf_order_mcmc <- read.csv("simresults/order_mcmc.csv")
    sumROC_order_mcmc = ROCdf_order_mcmc %>%
                        #filter(adjmat %in% adjmats) %>%
                        #filter(bn %in% bns) %>%
                        #filter(data %in% data) %>%
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

if("trilearn_loglin" %in% active_algorithms) {
    ROCdf_order_mcmc <- read.csv("simresults/trilearn_loglin.csv")
    sumROC_order_mcmc = ROCdf_order_mcmc %>%
                        #filter(adjmat %in% adjmats) %>%
                        #filter(bn %in% bns) %>%
                        #filter(data %in% data) %>%
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

if("itsearch" %in% active_algorithms) {
    ROCdf_itsearch <-read.csv("simresults/itsearch.csv")
    sum_roc_itsearch <- ROCdf_itsearch %>% 
                    #filter(adjmat %in% adjmats) %>%
                    #filter(bn %in% bns) %>%
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
                    #filter(adjmat %in% adjmats) %>%
                    #filter(bn %in% bns) %>%
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

if("tabu" %in% config$plotting$algorithms) {
    roc_pcalg <-read.csv("simresults/tabu.csv")

    sum_roc_pcalg <- roc_pcalg %>% 
                     #filter(dim %in% dims) %>%
                     #filter(sample_size %in% sample_sizes) %>%         
                     #filter(avparents %in% dag_avparents) %>%
                    filter(replicate %in% replicates) %>%
                     #group_by(legend, !!as.symbol("alpha"), sample_size, dim, avparents) %>% 
                     group_by(legend, adjmat, bn, data) %>% 
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
                    #filter(adjmat %in% adjmats) %>%
                    #filter(bn %in% bns) %>%
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

