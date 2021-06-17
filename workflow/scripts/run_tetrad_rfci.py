import os

cmd=""
if snakemake.wildcards["datatype"] == "discrete":
    cmd += "sed '2d' {dataset} > {adjmat}.no_range_header && "

cmd += "/usr/bin/time -f \"%e\" -o {time} "  
cmd += "java -jar workflow/scripts/tetrad/causal-cmd-1.1.3-jar-with-dependencies.jar " 
cmd += "--algorithm rfci "
cmd +="--data-type {datatype} "

if snakemake.wildcards["datatype"] == "discrete":
    cmd += "--dataset {adjmat}.no_range_header "
else:
    cmd +="--dataset {dataset} "

cmd +="--delimiter comma " 
cmd +="--test {test} " 

if snakemake.wildcards["test"] in ["fisher-z-test", "chi-square-test"]:
    cmd +="--alpha {alpha} " 

cmd +="--json-graph "
cmd +="--prefix {adjmat} " 
cmd +='&& Rscript workflow/scripts/tetrad_graph_to_adjmat.R ' 
cmd +='--jsongraph {adjmat}_graph.json ' 
cmd +='--filename {adjmat} ' 

if snakemake.wildcards["datatype"] == "discrete":
    cmd += "&& rm -f {adjmat}.no_range_header "

cmd +='&& ' 
cmd +='rm {adjmat}_graph.json ' 
cmd +='&& ' 
cmd +='rm {adjmat}.txt'

command = (cmd).format(dataset=snakemake.input["data"], **snakemake.output, **snakemake.wildcards)

os.system(command)

