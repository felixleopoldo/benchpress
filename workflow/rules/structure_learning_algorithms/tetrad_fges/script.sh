if [ ${snakemake_wildcards[datatype]} = "discrete" ]; then
    sed '2d' ${snakemake_wildcards[dataset]} > ${snakemake_output[adjmat]}.no_range_header
fi

# Build command string 
CMD="java -jar /tetrad/causal-cmd-1.1.3-jar-with-dependencies.jar"
CMD="$CMD --algorithm fges"
CMD="$CMD --data-type ${snakemake_wildcards[datatype]}"
CMD="$CMD --delimiter comma"
CMD="$CMD --score ${snakemake_wildcards[score]}"
CMD="$CMD --json-graph"
CMD="$CMD --structurePrior ${snakemake_wildcards[structurePrior]}"

if [ ${snakemake_wildcards[score]} = "sem-bic" ]; then
    CMD="$CMD --penaltyDiscount ${snakemake_wildcards[penaltyDiscount]}"
fi

if [ ${snakemake_wildcards[score]} = "bdeu-score" ]; then
    CMD="$CMD --samplePrior ${snakemake_wildcards[samplePrior]}"
fi

CMD="$CMD --prefix ${snakemake_output[adjmat]}"

if [ ${snakemake_wildcards[datatype]} = "discrete" ]; then
    CMD="$CMD --dataset ${snakemake_output[adjmat]}.no_range_header"
else
    CMD="$CMD --dataset ${snakemake_input[data]}"
fi

# Run the command
if [ ${snakemake_wildcards[timeout]} != "None" ]; then                    
    /usr/bin/time -f "%e" -o ${snakemake_output[time]} timeout --signal SIGKILL ${snakemake_wildcards[timeout]} bash -c '$CMD'
else
    echo "No timeout set"
    /usr/bin/time -f "%e" -o ${snakemake_output[time]} $CMD
fi

# Process the output
if [ -f ${snakemake_output[adjmat]}_graph.json ]; then 
    echo "Processing output"
    Rscript workflow/scripts/utils/tetrad_graph_to_adjmat.R --jsongraph ${snakemake_output[adjmat]}_graph.json --filename ${snakemake_output[adjmat]}  
    rm -f ${snakemake_output[adjmat]}.no_range_header 
    rm ${snakemake_output[adjmat]}_graph.json 
    rm ${snakemake_output[adjmat]}.txt; 
else # if timeout was reached, create empty files
    echo "No output"    
    touch ${snakemake_output[adjmat]}
    echo None > ${snakemake_output[time]}
fi
