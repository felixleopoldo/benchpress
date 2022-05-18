library(ggplot2)
library(dplyr)
library(varhandle)
toplot <- read.csv("../../../results/output/benchmarks/pcalg_pc.csv")
toplot2 <- read.csv("../../../results/output/benchmarks/bnlearn_tabu.csv")

toplot <- dplyr::bind_rows(toplot, toplot2)

adjmats <- unique(dplyr::pull(toplot, adjmat))

class(adjmats)

adjmats <- unfactor(adjmats)
class(adjmats)
adjmats                      
                      
bns <- unfactor(unique(toplot["bn"]))
datas <-unfactor(unique(toplot["data"]))
ids <- unfactor(unique(dplyr::pull(toplot, id)))

for(x in ids){
  print(x)
  
}
toplot

levels(adjmats)
is(adjmats)
print(adjmats) 

i <- 1
for (adjmat in adjmats){
    for (bn in bns){
        for (data in datas) {
            for (idd in ids) {
                print(id)
                dftmp <- toplot %>% 
                        filter(adjmat == adjmat) %>%
                        filter(bn == bn) %>%
                        filter(data == data) %>%
                        filter(id == idd)
                #param <- unlist(unique(dftmp["curve_param"]))

                param <- "alpha"

                print(dftmp)
                ggplot() + geom_boxplot(data = dftmp,  aes(x=as.factor(alpha), y = time)) +
                  geom_dotplot(data = dftmp,  aes(x=as.factor(alpha), y = time), binaxis='y', stackdir='center') +
                  #geom_jitter(data = dftmp,  aes(x=as.factor(alpha), y = time), position=position_jitter(0.0)) +
                  ggtitle(id) +
                  theme_bw() +
                  xlab(param) +
                  ylab("Mean time (s.)") 
                ggsave(file = file.path(i, ".png", fsep=""))
                i <- i+1
                
                # ggplot() + geom_boxplot(data = dftmp,  aes(x=interaction(FPR_skel,alpha), y = TP_skel)) +
                #   #geom_dotplot(data = dftmp,  aes(x=as.factor(alpha), y = time), binaxis='y', stackdir='center') +
                #   #geom_jitter(data = dftmp,  aes(x=as.factor(alpha), y = time), position=position_jitter(0.0)) +
                #   ggtitle(id) +
                #   theme_bw() +
                #   xlab("FPR") +
                #   ylab("TPR") 
                # ggsave(file = file.path(i, ".png", fsep=""))
                # i <- i+1
            }
        }
    }
}

