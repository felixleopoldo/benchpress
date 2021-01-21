import os

# This is an ugly but nice wrapper.
command = None
if snakemake.wildcards["score"] == "bdeu-score":
    # TODO: Remove the data header. Or specify range in gobnilp.
    
    command = ("/usr/bin/time -f \"%e\" -o {time} "  
            "java -jar workflow/scripts/tetrad/causal-cmd-1.1.3-jar-with-dependencies.jar " 
                    "--algorithm fges "
                    "--data-type {datatype} "
                    "--dataset {dataset} "
                    "--delimiter space " 
                    "--score {score} " 
                    "--json-graph "
                    "--structurePrior {structurePrior} " 
                    "--samplePrior {samplePrior} " 
                    "--prefix {adjmat} " 
                    '&& Rscript workflow/scripts/tetrad_graph_to_adjmat.R ' 
                    '--jsongraph {adjmat}_graph.json ' 
                    '--filename {adjmat} ' 
                    '&& ' 
                    'rm {adjmat}_graph.json ' 
                    '&& ' 
                    'rm {adjmat}.txt').format(dataset=snakemake.input["data"], **snakemake.output, **snakemake.wildcards)

if snakemake.wildcards["score"] == "cg-bic-score":
    command = ("/usr/bin/time -f \"%e\" -o {time} "  
            "java -jar workflow/scripts/tetrad/causal-cmd-1.1.3-jar-with-dependencies.jar " 
                    "--algorithm fges "
                    "--data-type {datatype} "
                    "--dataset {dataset} "
                    "--delimiter space " 
                    "--score {score} " 
                    "--json-graph "
                    "--structurePrior {structurePrior} " 
                    "--prefix {adjmat} " 
                    '&& Rscript workflow/scripts/tetrad_graph_to_adjmat.R ' 
                    '--jsongraph {adjmat}_graph.json ' 
                    '--filename {adjmat} ' 
                    '&& ' 
                    'rm {adjmat}_graph.json ' 
                    '&& ' 
                    'rm {adjmat}.txt').format(dataset=snakemake.input["data"], **snakemake.output, **snakemake.wildcards)

os.system(command)