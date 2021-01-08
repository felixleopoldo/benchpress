library(ggplot2)
library("rjson")
library(argparser)

p <- arg_parser("A program for plotting ROC data.")
p <- add_argument(p, "--input_filename", help = "Input filename")
p <- add_argument(p, "--output_filename", help = "Output filename")
argv <- parse_args(p)

toplot <- read.csv(argv$input_filename)
ggplot() + geom_errorbar(data = toplot,
              aes(x = FPRn_cpdag_median,
                  ymin = TPR_cpdag_q1, 
                  ymax = TPR_cpdag_q3, 
                  col = legend), 
              width = 0.01) +
geom_path(data = toplot,
          aes(x = FPRn_cpdag_median, 
              y = TPR_cpdag_median,
              col = legend)) +
geom_point(data = toplot,
           aes(x = FPRn_cpdag_median, 
               y = TPR_cpdag_median,               
               col = legend, 
               shape = legend), 
               size = 1) +
#geom_text(data = toplot,
#            aes(x = FPRn_median, 
#                y = TPR_q3,               
#                label=alpha, col=legend),
#          check_overlap = TRUE,
#           nudge_x=-0.02,
#          nudge_y=0.02
#          )
facet_wrap(. ~ adjmat+bn+data, scales="free_x", nrow = 2) +
# Titles etc
xlab("FPRp") +
ylab("TPR") +
ggtitle("ROC (cpdag)") +
theme(plot.title = element_text(hjust = 0.5)) +

ggsave(file=argv$output_filename)