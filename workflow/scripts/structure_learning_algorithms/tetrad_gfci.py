import os

cmd = ""
if snakemake.wildcards["datatype"] == "discrete":
    cmd += "sed '2d' {dataset} > {adjmat}.no_range_header && "

cmd += "/usr/bin/time -f \"%e\" -o {time} "  
if snakemake.wildcards["timeout"] != "None":
    cmd += "timeout --signal SIGKILL {timeout} bash -c 'java -jar /tetrad/causal-cmd-1.1.3-jar-with-dependencies.jar " 
else:
    cmd += "bash -c 'java -jar /tetrad/causal-cmd-1.1.3-jar-with-dependencies.jar " 

#cmd += "java -jar /tetrad/causal-cmd-1.1.3-jar-with-dependencies.jar " 
cmd += "--algorithm gfci "
cmd += "--data-type {datatype} "

if snakemake.wildcards["datatype"] == "discrete":
    cmd += "--dataset {adjmat}.no_range_header "
else:
    cmd += "--dataset {dataset} "

cmd += "--delimiter comma " 
cmd += "--score {score} " 
cmd += "--test {test} " 

if snakemake.wildcards["test"] in ["fisher-z-test", "chi-square-test"]:
    cmd += "--alpha {alpha} " 

cmd += "--json-graph "
cmd += "--structurePrior {structurePrior} " 

if snakemake.wildcards["score"] in ["sem-bic"]:
    cmd += "--penaltyDiscount {penaltyDiscount} "

if snakemake.wildcards["score"] in ["bdeu-score"]:
    cmd += "--samplePrior {samplePrior} "

cmd += "--prefix {adjmat} '" 

command = cmd.format(dataset=snakemake.input["data"], **snakemake.output, **snakemake.wildcards)

os.system(command)

cmd = """
        if [ -f {adjmat}_graph.json ]; then 
            Rscript workflow/scripts/utlis/tetrad_graph_to_adjmat.R --jsongraph {adjmat}_graph.json --filename {adjmat}  
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



# cmd += '&& Rscript workflow/scripts/tetrad_graph_to_adjmat.R ' 
# cmd += '--jsongraph {adjmat}_graph.json ' 
# cmd += "--filename {adjmat} " 

# if snakemake.wildcards["datatype"] == "discrete":
#     cmd += "&& rm -f {adjmat}.no_range_header "

# cmd += '&& ' 
# cmd += 'rm {adjmat}_graph.json ' 
# cmd += '&& ' 
# cmd += 'rm {adjmat}.txt'

# command = cmd.format(dataset=snakemake.input["data"], **snakemake.output, **snakemake.wildcards)

# os.system(command)