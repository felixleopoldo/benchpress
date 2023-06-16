#!/bin/bash

CP=$(pwd)/workflow/rules/structure_learning_algorithms/athomas_jtsampler/jtsampler
#CP=/jtsampler

if [ ${snakemake_wildcards[timeout]} = "None" ]; then
    if [ ${snakemake_wildcards[full_output]} = "True" ]; then
        /usr/bin/time -f "%e" -o ${snakemake_output[time]} java -classpath $CP EstimateGM \
                      -r ${snakemake_wildcards[replicate]} \
                      -n ${snakemake_wildcards[num_samples]} \
                      -s ${snakemake_wildcards[sampler]} \
                      -a ${snakemake_wildcards[edge_penalty]} \
                      -c ${snakemake_wildcards[size_maxclique]} \
                      -F < ${snakemake_input[data]} > ${snakemake_output[seqgraph_full]}
        ## convet to benchpress file
        awk -F, -v OFS=',' 'NR <= 4 || $5 == 0 {print $1, $2, $3, $4}' ${snakemake_output[seqgraph_full]} > ${snakemake_output[seqgraph]}
    else
        /usr/bin/time -f "%e" -o ${snakemake_output[time]} java -classpath $CP EstimateGM \
                      -r ${snakemake_wildcards[replicate]} \
                      -n ${snakemake_wildcards[num_samples]} \
                      -s ${snakemake_wildcards[sampler]} \
                      -a ${snakemake_wildcards[edge_penalty]} \
                      -c ${snakemake_wildcards[size_maxclique]} < ${snakemake_input[data]} > ${snakemake_output[seqgraph]}
   fi
else
    /usr/bin/time -f "%e" -o ${snakemake_output[time]} timeout -s SIGINT ${snakemake_wildcards[timeout]} bash -c 'java -classpath $CP EstimateGM -r ${snakemake_wildcards[replicate]} < ${snakemake_input[data]} > ${snakemake_output[seqgraph]}'
fi






#java -classpath $CP EstimateGM -r 1    -n 1000    -s 2 -a 10000 < results/data/adjmat\=/bdgraph_graphsim/p\=25/graph\=random/class\=None/size\=None/prob\=0.5/seed\=1/parameters\=/bdgraph_rgwish/b\=3/threshold_conv\=1e-07/seed\=1/data\=/iid/n\=100/seed\=1.csv 
