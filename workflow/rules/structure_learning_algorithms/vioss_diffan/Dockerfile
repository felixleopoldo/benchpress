FROM r-base:4.2.2

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends build-essential libpq-dev python3.12 python3-pip python3-setuptools python3-dev
RUN apt install python-is-python3
RUN apt install -y git-all

# Install python packages

# start virtual environment
RUN apt install python3.12-venv -y

ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"


RUN pip install contextlib2
RUN pip install numpy
RUN pip install torch
RUN pip install functorch
RUN pip install tqdm
RUN pip install cdt

RUN pip install networkx==2.7
RUN pip install gcastle


RUN R -e "if (!requireNamespace(\"BiocManager\", quietly = TRUE)) {install.packages(\"BiocManager\", repo=\"http://cran.rstudio.com/\")}" --no-save 
RUN R -e "BiocManager::install()"  --no-save 
RUN R -e "BiocManager::install(\"gRbase\")" --no-save 
RUN R -e "BiocManager::install(\"RBGL\")" --no-save 
RUN R -e "BiocManager::install(\"Rgraphviz\")" --no-save 
RUN R -e "BiocManager::install(\"gRain\")" --no-save 

RUN R -e "install.packages(\"pcalg\")" --no-save

RUN R -e 'install.packages(c("remotes"))'
RUN R -e 'remotes::install_github("https://github.com/cran/SID")'

RUN git clone https://github.com/vios-s/DiffAN.git

WORKDIR /DiffAN

