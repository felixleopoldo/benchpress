#!/bin/bash

#CP=$(pwd)/workflow/rules/structure_learning_algorithms/athomas_jtsampler/jtsampler
CP=/jtsampler

if [ ${snakemake_wildcards[timeout]} = "None" ]; then
    /usr/bin/time -q -f "%e" -o ${snakemake_output[time]} java -classpath $CP EstimateGM \
    -r ${snakemake_wildcards[replicate]} \
    -n ${snakemake_wildcards[num_samples]} \
    -s ${snakemake_wildcards[sampler]} \
    -a ${snakemake_wildcards[edge_penalty]} \
    -c ${snakemake_wildcards[size_maxclique]} < ${snakemake_input[data]} > ${snakemake_output[seqgraph]}
else
    CMD="java -classpath $CP EstimateGM \
    -r ${snakemake_wildcards[replicate]} \
    -n ${snakemake_wildcards[num_samples]} \
    -s ${snakemake_wildcards[sampler]} \
    -a ${snakemake_wildcards[edge_penalty]} \
    -c ${snakemake_wildcards[size_maxclique]}" 
    /usr/bin/time -q -f "%e" -o ${snakemake_output[time]} timeout -s SIGINT ${snakemake_wildcards[timeout]} bash -c '$CMD' < ${snakemake_input[data]} > ${snakemake_output[seqgraph]}
fi