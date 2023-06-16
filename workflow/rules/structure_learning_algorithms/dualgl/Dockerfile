FROM r-base:4.3.0

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    wget \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Install CRAN packages
RUN R -e "install.packages(c('stringr', 'igraph', 'data.table', 'graph', 'huge', 'ZIM', 'mvtnorm', 'speedglm', 'ncvreg', 'bnlearn', 'doParallel', 'SIS', 'snowfall', 'R.utils'), repos='http://cran.us.r-project.org')"

WORKDIR /tmp

# Install XMRF
RUN wget https://cran.r-project.org/src/contrib/Archive/XMRF/XMRF_1.0.tar.gz \
  && R -e 'install.packages("XMRF_1.0.tar.gz", repos = NULL, type="source")' \
  && rm XMRF_1.0.tar.gz

# Install equSA
RUN wget https://cran.r-project.org/src/contrib/Archive/equSA/equSA_1.2.1.tar.gz \
  && R -e 'install.packages("equSA_1.2.1.tar.gz", repos = NULL, type="source")' \
  && rm equSA_1.2.1.tar.gz

# Cleanup
RUN rm -rf /tmp/*

