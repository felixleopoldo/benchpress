#!/bin/bash
# class path
CP=/jtsampler

if [ ${snakemake_wildcards[timeout]} = "None" ]; then

    /usr/bin/time -f "%e" -o ${snakemake_output[time]} java -classpath $CP EstimateGM \
                    -r ${snakemake_wildcards[replicate]} \
                    -n ${snakemake_wildcards[num_samples]} \
                    -s ${snakemake_wildcards[sampler]} \
                    -a ${snakemake_wildcards[edge_penalty]} \
                    -c ${snakemake_wildcards[size_maxclique]} < ${snakemake_input[data]} > ${snakemake_output[seqgraph]}

else
    /usr/bin/time -f "%e" -o ${snakemake_output[time]} timeout -s SIGINT ${snakemake_wildcards[timeout]} bash -c 'java -classpath $CP EstimateGM -r ${snakemake_wildcards[replicate]} < ${snakemake_input[data]} > ${snakemake_output[seqgraph]}'
fi

# If timeout was reached
if [ -f {output.seqgraph} ]; then
    sleep 1
else
    touch {output.seqgraph}
    echo None > {output.time};
fi
