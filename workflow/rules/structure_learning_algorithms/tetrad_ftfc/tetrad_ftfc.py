import os

cmd = ""
cmd += "/usr/bin/time -f \"%e\" -o {time} "

if snakemake.wildcards["timeout"] != "None":
    cmd += "timeout --signal SIGKILL {timeout} bash -c 'java -jar /tetrad/causal-cmd-1.1.3-jar-with-dependencies.jar "
else:
    cmd += "bash -c 'java -jar /tetrad/causal-cmd-1.1.3-jar-with-dependencies.jar "

cmd += "--algorithm ftfc " #cmd += "--algorithm fofc "
cmd += "--data-type continuous "
cmd +="--dataset {dataset} "
cmd += "--delimiter comma " 
cmd += "--json-graph "
cmd += "--prefix {adjmat} '" 

command = cmd.format(dataset=snakemake.input["data"], **snakemake.output, **snakemake.wildcards)

os.system(command)

cmd = """
        if [ -f {adjmat}_graph.json ]; then
            Rscript workflow/scripts/utils/tetrad_graph_to_adjmat.R --jsongraph {adjmat}_graph.json --filename {adjmat}
            rm -f {adjmat}.no_range_header
            rm {adjmat}_graph.json
            rm {adjmat}.txt;
        else
            touch {adjmat}
            echo None > {time}
        fi
        """

command = cmd.format(dataset=snakemake.input["data"], **snakemake.output, **snakemake.wildcards)

os.system(command)
