library(ggplot2)
library(argparser)

p <- arg_parser("A program for running r.blip and save to file.")


p <- add_argument(p, "--adjmat_filname", help = "Input csv filename")
p <- add_argument(p, "--plot_filename", help = "Output filename")

argv <- parse_args(p)

