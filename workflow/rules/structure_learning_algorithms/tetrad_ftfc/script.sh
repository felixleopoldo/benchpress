# Build command string 
CMD="java -jar /tetrad/causal-cmd-1.10.0-jar-with-dependencies.jar"
CMD="$CMD --data-type continuous"
CMD="$CMD --delimiter comma"
CMD="$CMD --json-graph"
CMD="$CMD --prefix ${snakemake_output[adjmat]}"

CMD="$CMD --algorithm ftfc"
CMD="$CMD --dataset ${snakemake_input[data]}"
CMD="$CMD --seed ${snakemake_wildcards[seed]}"

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
