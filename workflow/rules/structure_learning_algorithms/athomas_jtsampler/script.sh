#!/bin/bash

#CP=$(pwd)/workflow/rules/structure_learning_algorithms/athomas_jtsampler/jtsampler
CP=/jtsampler

if [ ${snakemake_wildcards[timeout]} = "None" ]; then
    /usr/bin/time -f "%e" -o ${snakemake_output[time]} java -classpath $CP EstimateGM \
    -r ${snakemake_wildcards[replicate]} \
    -n ${snakemake_wildcards[n]} \
    -s ${snakemake_wildcards[s]} \
    -a ${snakemake_wildcards[a]} \
    -c ${snakemake_wildcards[c]} < ${snakemake_input[data]} > ${snakemake_output[seqgraph]}
else
    /usr/bin/time -f "%e" -o ${snakemake_output[time]} timeout -s SIGINT ${snakemake_wildcards[timeout]} bash -c 'java -classpath $CP EstimateGM -r ${snakemake_wildcards[replicate]} < ${snakemake_input[data]} > ${snakemake_output[seqgraph]}'
fi



#java -classpath $CP EstimateGM -r 1    -n 1000    -s 2 -a 10000 < results/data/adjmat\=/bdgraph_graphsim/p\=25/graph\=random/class\=None/size\=None/prob\=0.5/seed\=1/parameters\=/bdgraph_rgwish/b\=3/threshold_conv\=1e-07/seed\=1/data\=/iid/n\=100/seed\=1.csv 
