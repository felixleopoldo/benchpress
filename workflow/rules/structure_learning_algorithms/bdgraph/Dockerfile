FROM r-base:4.3.1

RUN R -e "install.packages('remotes')" 
RUN R -e 'library(remotes); install_version("BDgraph", "2.72")'
RUN R -e 'library(remotes); install_version("R.utils")'
