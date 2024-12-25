# Build command string 
CMD="java -jar /tetrad/causal-cmd-1.10.0-jar-with-dependencies.jar"
CMD="$CMD --prefix ${snakemake_output[adjmat]}"
CMD="$CMD --dataset ${snakemake_input[data]}"
CMD="$CMD --delimiter comma"
CMD="$CMD --json-graph"

CMD="$CMD --algorithm fask"

# Check if edge constraints are provided
if [ -z ${snakemake_input[edgeConstraints_formatted]} ]; then
    echo "No edge constraints provided"
else
    CMD="$CMD --knowledge ${snakemake_input[edgeConstraints_formatted]}"
    cat ${snakemake_input[edgeConstraints_formatted]}
fi

CMD="$CMD --data-type continuous"
CMD="$CMD --test ${snakemake_wildcards[test]}"
CMD="$CMD --score ${snakemake_wildcards[score]}"
CMD="$CMD --seed ${snakemake_wildcards[seed]}"

CMD="$CMD --semBicStructurePrior ${snakemake_wildcards[semBicStructurePrior]}"
if [ ${snakemake_wildcards[score]} = "sem-bic-score" ]; then
    CMD="$CMD --penaltyDiscount ${snakemake_wildcards[penaltyDiscount]}"
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
    rm ${snakemake_output[adjmat]}_out.txt; 
else 
    # if timeout was reached, create empty files
    touch ${snakemake_output[adjmat]}
    echo None > ${snakemake_output[time]}
fi
