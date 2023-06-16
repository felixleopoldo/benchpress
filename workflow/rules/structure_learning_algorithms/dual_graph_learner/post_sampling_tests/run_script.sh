#!/bin/bash

CP=$/home/mo/src/jtsampler/jtsampler

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



java -classpath $CP EstimateGM  -n 4000 -pd 1 -s 0 -a 0.0 -c 10000 < seed\=1_data.csv .
java EstimateGM  -n 4000000 -pd 1 -s 0 -a 0.0 -c 10000 < graphs/seed_1_circle.csv  > graphs/adjvec_circle.csv
java EstimateGM  -n 4000000 -pd 1 -s 0 -a 0.0 -c 10000 < graphs/seed_1_lattice.csv  > graphs/adjvec_lattice.csv
java EstimateGM  -n 4000000 -pd 1 -s 0 -a 0.0 -c 10000 < graphs/seed_1_0.5_random.csv  > graphs/adjvec_1_0.5_random.csv
java EstimateGM  -n 400000 -pd 1 -s 0 -a 0.0 -c 100 < graphs/seed_1_0.1_random.csv  > graphs/adjvec_1_0.1_random.csv



java EstimateGM  -n 4000000 -pd 1 -s 0 -a 0.0 -c 10000 < graphs/seed_1_autoregg.csv  > graphs/adjvec_autoregg.csv.csv
java EstimateGM  -n 4000000 -pd 1 -s 1 -a 0.0 -c 10000 < graphs/seed_1_autoregg.csv  > graphs/adjvec_autoregg.csv.csv



java EstimateGM  -n 4000000 -pd 1 -s 1 -a 0.0 -c 100 < graphs/seed_1_lattice.csv  > graphs/adjvec_lattice.csv

## 22 min
