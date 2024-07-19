# Build command string 
echo "Running Tetrad FGES"

CMD="java -jar /tetrad/causal-cmd-1.10.0-jar-with-dependencies.jar"
CMD="$CMD --data-type ${snakemake_wildcards[datatype]}"
CMD="$CMD --delimiter comma"
CMD="$CMD --prefix ${snakemake_output[adjmat]}"
CMD="$CMD --json-graph"

# Use data without range header for discrete data 
if [ ${snakemake_wildcards[datatype]} = "discrete" ]; then
    # Create temporary datafile without range/cardinality header
    # for discrete data
    sed '2d' ${snakemake_input[data]} > ${snakemake_output[adjmat]}.no_range_header
    CMD="$CMD --dataset ${snakemake_output[adjmat]}.no_range_header"
else
    CMD="$CMD --dataset ${snakemake_input[data]}"
fi

CMD="$CMD --algorithm fges"

# Check if edge constraints are provided
if [ -z ${snakemake_input[edgeConstraints_formatted]} ]; then
    echo "No edge constraints provided"
else
    cat ${snakemake_input[edgeConstraints_formatted]}
    CMD="$CMD --edge-constraints ${snakemake_input[edgeConstraints_formatted]}"
fi

CMD="$CMD --score ${snakemake_wildcards[score]}"
CMD="$CMD --seed ${snakemake_wildcards[seed]}"

if [ ${snakemake_wildcards[score]} = "sem-bic-score" ]; then
    CMD="$CMD --penaltyDiscount ${snakemake_wildcards[penaltyDiscount]}"
    CMD="$CMD --semBicStructurePrior ${snakemake_wildcards[semBicStructurePrior]}"
fi

if [ ${snakemake_wildcards[score]} = "bdeu-score" ]; then
    CMD="$CMD --priorEquivalentSampleSize ${snakemake_wildcards[samplePrior]}"
fi

# Run the command
if [ ${snakemake_wildcards[timeout]} != "None" ]; then 
     # run with timeout
    /usr/bin/time -f "%e" -o ${snakemake_output[time]} timeout --signal SIGKILL ${snakemake_wildcards[timeout]} bash -c '$CMD'
else 
    # no timeout set
    /usr/bin/time -f "%e" -o ${snakemake_output[time]} $CMD
fi

# Process the output
if [ -f ${snakemake_output[adjmat]}_graph.json ]; then 
        
    Rscript workflow/scripts/utils/tetrad_graph_to_adjmat.R --jsongraph ${snakemake_output[adjmat]}_graph.json --filename ${snakemake_output[adjmat]}  
    rm -f ${snakemake_output[adjmat]}.no_range_header 
    rm ${snakemake_output[adjmat]}_graph.json 
    rm ${snakemake_output[adjmat]}_out.txt; # prefix is not the same in the new versin
    
else 
    echo Writing empty files in FGES
    # if timeout was reached, create empty files
    touch ${snakemake_output[adjmat]}
    echo None > ${snakemake_output[time]}
fi
