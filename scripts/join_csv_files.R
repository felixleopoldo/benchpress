library(argparser)
library(dplyr)

p <- arg_parser("A program for joining csv files.")
p <- add_argument(p, "--files", help = "Files", nargs=Inf)
p <- add_argument(p, "--algorithm", help = "Algorithm name")
p <- add_argument(p, "--filename", help = "Output filename")
argv <- parse_args(p)
directory <- "simresults"
df <- data.frame()
print("hohohoo")
print(argv$files)
for (filename in argv$files) {
  tmpdf <- read.csv(filename)
  
  tmpdf <- na_if(tmpdf, "None")

  if("plus1it" %in% colnames(tmpdf)) {
      tmpdf["plus1it"] <- as.numeric(tmpdf["plus1it"])
  }
  if("posterior" %in% colnames(tmpdf)) {
      tmpdf["posterior"] <- as.numeric(tmpdf["posterior"])
  }

  df <- dplyr::bind_rows(df, tmpdf)
}

write.csv(df, file=argv$filename, row.names=FALSE)