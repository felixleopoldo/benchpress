FROM bpimages/pcalg:2.7-8

RUN R -e 'library(remotes); install_github("bips-hb/tpc", ref="137e18b")'

RUN apt update -y
RUN apt install cmake -y
RUN apt-get install libgsl-dev -y
RUN R -e 'library(remotes); install_github("bips-hb/micd", ref="3babeb0")'