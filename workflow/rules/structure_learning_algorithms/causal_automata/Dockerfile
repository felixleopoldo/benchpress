# syntax=docker/dockerfile:1
#
# Benchpress CPU image for the causal-automata structure-learning module.
# Build:  docker build -t causal_automata:0.3.6 \
#           -f workflow/rules/structure_learning_algorithms/causal_automata/Dockerfile .
# Push:   docker tag causal_automata:0.3.6 <registry>/causal_automata:0.3.6
#         docker push <registry>/causal_automata:0.3.6
#
# Uses CPU JAX for portable Singularity/Apptainer / upstream Benchpress runs.
# For GPU hosts (RunPod), see Dockerfile.gpu and build with:
#   apptainer build causal_automata_gpu.sif Dockerfile.gpu

FROM python:3.10-slim-bookworm

RUN apt-get update \
    && apt-get install -y --no-install-recommends build-essential \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir \
        pandas \
        "causal-automata[cpu]==0.3.6"
