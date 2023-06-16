multiplot <- function(..., plotlist=NULL, file, cols=1, layout=NULL) {
  library(grid)

  # Make a list from the ... arguments and plotlist
  plots <- c(list(...), plotlist)

  numPlots = length(plots)

  # If layout is NULL, then use 'cols' to determine layout
  if (is.null(layout)) {
    # Make the panel
    # ncol: Number of columns of plots
    # nrow: Number of rows needed, calculated from # of cols
    layout <- matrix(seq(1, cols * ceiling(numPlots/cols)),
                    ncol = cols, nrow = ceiling(numPlots/cols))
  }

 if (numPlots==1) {
    print(plots[[1]])

  } else {
    # Set up the page
    grid.newpage()
    pushViewport(viewport(layout = grid.layout(nrow(layout), ncol(layout))))

    # Make each plot, in the correct location
    for (i in 1:numPlots) {
      # Get the i,j matrix positions of the regions that contain this subplot
      matchidx <- as.data.frame(which(layout == i, arr.ind = TRUE))

      print(plots[[i]], vp = viewport(layout.pos.row = matchidx$row,
                                      layout.pos.col = matchidx$col))
    }
  }
}
split <- function(x) {
    y = str_sub(x,2,-2)
    a = str_split(y, '-')
    u = as.numeric(a[[1]][1])
    v = as.numeric(a[[1]][2])
    c(u,v)
}

fix_edges<-function(x, move='add') {
    a = split(x)
    c(edge=paste(min(a), max(a), sep='-'), orig=min(a), dest=max(a), move=move)
}

get_graph_filenames<-function(name='circle') {
    a = sapply(all.files, function(r)  str_extract(r, name))
    b = names(a[!is.na(a)])
    b
}

get_graph_data<-function(graph_name='circle') {
    files = get_graph_filenames(graph_name)
    true_graph = sapply(files, function(r)  str_extract(r, 'adjmat'))
    true_graph = names(true_graph[!is.na(true_graph)])

    true_g = read.csv(true_graph)
    
    adjvec = sapply(files, function(r)  str_extract(r, 'adjvec'))
    adjvec = names(adjvec[!is.na(adjvec)])

    data = sapply(files, function(r)  str_extract(r, 'seed'))
    data = names(data[!is.na(data)])

    dt = fread(adjvec)
    data = read.csv(data)
    list(true_g, dt, data)
    
}
edge_to_str <-function(ed) {
    ed = as_edgelist(g)-1
    paste(ed[,1], ed[,2], sep='-')
}
