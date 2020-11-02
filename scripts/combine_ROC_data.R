library(dplyr, warn.conflicts = FALSE)
library("rjson")
library(argparser)
source("lib/code_for_binary_simulations/blip_vs_bidag_plot.R")
source("lib/code_for_binary_simulations/summarySE.R")

p <- arg_parser("A program for combining roc data from differents sources.")
p <- add_argument(p, "--filename", help = "Filename")
argv <- parse_args(p)

config <- fromJSON(file = argv$filename)

toplot <- data.frame()
active_algorithms <- c()

for(alg_name in names(config$structure_learning_algorithms)) {
    for (alg_conf in config$structure_learning_algorithms[[alg_name]]) {
       if(alg_conf$id %in% config$benchmark_setup$structure_learning_algorithms) {
           active_algorithms <- c(active_algorithms, alg_name)
       }
    }
}
active_algorithms <- unique(active_algorithms)

rocalgs <- config$benchmark_setup$evaluation$ROC

for (alg in rocalgs){
    if(alg$structure_learning_algorithm %in% active_algorithms) {
        ROCdf <- read.csv(file.path(config$benchmark_setup$output_dir, paste(alg$structure_learning_algorithm ,".csv", sep = "")))
        sumROC = ROCdf %>%
                            group_by(legend, adjmat, bn, data, !!as.symbol(alg$curve_variable)) %>% 
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
        sumROC["labels"] <- NA
        toplot <- dplyr::bind_rows(toplot, sumROC)
    }
}

write.csv(toplot,  file.path(config$benchmark_setup$output_dir, "ROC_data.csv"))

