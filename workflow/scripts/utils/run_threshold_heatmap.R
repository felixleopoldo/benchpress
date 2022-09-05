library(argparser)
library(rjson)

p <- arg_parser("Thresholding a heatmap matrix to an adjacency matrices.")
p <- add_argument(p, "--filename", help = "Filename")
p <- add_argument(p, "--heatmap", help = "Heatmap", default = ".")
p <- add_argument(p, "--threshold",
  help = "Threshold", type = "numeric", default = 0.5
)
argv <- parse_args(p)

filename <- file.path(argv$filename)
heatmap <- read.csv(argv$heatmap, header = TRUE, check.names = FALSE)

adjmat <- (heatmap > argv$threshold) * 1

write.csv(adjmat, file = argv$filename, row.names = FALSE, quote = FALSE)
