library(dplyr, warn.conflicts = FALSE)
library("rjson")
library(argparser)
source("lib/code_for_binary_simulations/blip_vs_bidag_plot.R")
source("lib/code_for_binary_simulations/summarySE.R")

p <- arg_parser("A program for combining roc data from differents sources.")
p <- add_argument(p, "--filename", help = "Filename")
p <- add_argument(p, "--config_filename", help = "Filename config file")
p <- add_argument(p, "--algorithms", help = "Algorithms", nargs=Inf)

argv <- parse_args(p)

config <- fromJSON(file = argv$config_filename)

toplot <- data.frame()

active_algorithms <- c()
for (file in argv$algorithms){
    active_algorithms <- c(active_algorithms, tools::file_path_sans_ext(basename(file)))
}
#print(config$resources$structure_learning_algorithms)
#print(active_algorithms)
rocalgs <- config$benchmark_setup$evaluation$ROC
#print(rocalgs)

for (alg in rocalgs){

    algorithm = NULL
    for (active in active_algorithms){
        #print("active")
        #print(active)
        #print(config$resources$structure_learning_algorithms[[active]])
        for(a in config$resources$structure_learning_algorithms[[active]]){
            #print(a$id)
            if (a$id == alg$algorithm_id) {
                algorithm = active

            }
        }
    }


    if(algorithm %in% active_algorithms) { #bug
        #ROCdf <- read.csv(file.path(config$benchmark_setup$output_dir, paste(alg$algorithm_id ,".csv", sep = "")))
        ROCdf <- read.csv(file.path(config$benchmark_setup$output_dir, paste(algorithm ,".csv", sep = "")))
        sumROC = ROCdf %>%
        group_by(id, adjmat, bn, data, !!as.symbol(alg$curve_variable)) %>% 
        summarise(  SHD_pattern_mean = mean(SHD_pattern),
                    TPR_pattern_mean = mean(TPR_pattern), 
                    TPR_pattern_median = median(TPR_pattern), 
                    FPRn_pattern_median = median(FPRn_pattern), 
                    TPR_pattern_q1 = quantile(TPR_pattern, probs = c(0.05)), 
                    TPR_pattern_q3 = quantile(TPR_pattern, probs = c(0.95)),
                    SHD_cpdag_mean = mean(SHD_cpdag),
                    TPR_cpdag_mean = mean(TPR_cpdag), 
                    TPR_cpdag_median = median(TPR_cpdag), 
                    FPRn_cpdag_median = median(FPRn_cpdag), 
                    TPR_cpdag_q1 = quantile(TPR_cpdag, probs = c(0.05)), 
                    TPR_cpdag_q3 = quantile(TPR_cpdag, probs = c(0.95)),
                    time_mean = mean(time),
                    logscore_mean = mean(logscore),
                    N = n()) #%>%
        #filter(N %in% length(replicates))
        sumROC["labels"] <- NA
        toplot <- dplyr::bind_rows(toplot, sumROC)
    }
}

write.csv(toplot,  argv$filename)

