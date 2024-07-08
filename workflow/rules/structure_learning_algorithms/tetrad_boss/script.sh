# Build command string 
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

CMD="$CMD --algorithm boss"

CMD="$CMD --knowledge ${snakemake_input[edgeConstraints_formatted]}"
cat ${snakemake_input[edgeConstraints_formatted]}

CMD="$CMD --default"
CMD="$CMD --seed ${snakemake_wildcards[seed]}"

CMD="$CMD --useBes ${snakemake_wildcards[useBes]}"
CMD="$CMD --numStarts 1"
CMD="$CMD --allowInternalRandomness ${snakemake_wildcards[allowInternalRandomness]}"


#CMD="$CMD --test fisher-z-test"
CMD="$CMD --score ${snakemake_wildcards[score]}"

if [ ${snakemake_wildcards[score]} = "sem-bic-score" ]; then
    CMD="$CMD --semBicStructurePrior ${snakemake_wildcards[semBicStructurePrior]}"
    CMD="$CMD --penaltyDiscount ${snakemake_wildcards[penaltyDiscount]}"
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
    echo Writing empty files for BOSS
    # if timeout was reached, create empty files
    touch ${snakemake_output[adjmat]}
    echo None > ${snakemake_output[time]}
fi
