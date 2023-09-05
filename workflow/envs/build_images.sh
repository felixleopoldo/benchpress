#!/bin/bash

ARCH=-arm64

FLAGS=--push

docker build . -f Dockerfile.rblip -t bpimages/rblip:1.1$ARCH $FLAGS
#docker build . -f ../rules/structure_learnin_algorithms/athomas_jtsamplers/Dockerfile -t bpimages/athomas_jtsamplers:4347c64$ARCH $FLAGS
docker build . -f Dockerfile.jtsamplers -t bpimages/bdgraph:2.7.2$ARCH $FLAGS
docker build . -f Dockerfile.bdgraph -t bpimages/bdgraph:2.7.2$ARCH $FLAGS
docker build . -f Dockerfile.causallearn -t bpimages/causal-learn:0.1.3.4$ARCH $FLAGS
docker build . -f Dockerfile.dualpc -t bpimages/dualpc:585751b$ARCH $FLAGS
docker build . -f Dockerfile.rgraphstuff -t bpimages/rgraphstuff$ARCH $FLAGS
docker build . -f Dockerfile.pcalg -t bpimages/pcalg:2.7-8$ARCH $FLAGS
docker build . -f Dockerfile.bnlearn -t bpimages/bnlearn:4.8.3$ARCH $FLAGS
docker build . -f Dockerfile.bidag -t bpimages/bidag:2.1.4$ARCH $FLAGS
docker build . -f Dockerfile.causalcmd -t bpimages/causalcmd:1.9.0$ARCH $FLAGS
docker build . -f Dockerfile.benchpress -t bpimages/benchpress:2.1.0$ARCH $FLAGS
docker build . -f Dockerfile.causaldag -t bpimages/causaldag:0.1a163$ARCH $FLAGS
docker build . -f Dockerfile.gcastle -t bpimages/gcastle:1.0.3$ARCH $FLAGS
docker build . -f Dockerfile.sandbox -t bpimages/sandbox$ARCH $FLAGS
docker build . -f Dockerfile.datascience-python -t bpimages/datascience-python$ARCH $FLAGS

#docker build ../rules/structure_learnin_algorithms/gobnilp/ -f ../rules/structure_learnin_algorithms/gobnilp/Dockerfile -t bpimages/gobnilp:4347c64$ARCH $FLAGS

git clone https://github.com/snakemake/snakemake.git && \
cd snakemake && \
git checkout tags/v7.32.3 && \
docker build . -t bpimages/snakemake:v7.32.3$ARCH $FLAGS && \
cd - && \
rm -rf snakemake