#!/bin/bash

CP=$(pwd)/workflow/rules/structure_learning_algorithms/athomas_jtsampler/jtsampler
CP=/jtsampler

if [ ${snakemake_wildcards[timeout]} = "None" ]; then
    /usr/bin/time -q -f "%e" -o ${snakemake_output[time]} java -classpath $CP EstimateGM \
    -r ${snakemake_wildcards[replicate]} \
    -n ${snakemake_wildcards[n]} \
    -s ${snakemake_wildcards[s]} \
    -a ${snakemake_wildcards[a]} \
    -c ${snakemake_wildcards[c]} < ${snakemake_input[data]} > ${snakemake_output[seqgraph]}
else
    /usr/bin/time -q -f "%e" -o ${snakemake_output[time]} timeout -s SIGINT ${snakemake_wildcards[timeout]} bash -c 'java -classpath $CP EstimateGM -r ${snakemake_wildcards[replicate]} < ${snakemake_input[data]} > ${snakemake_output[seqgraph]}'
fi