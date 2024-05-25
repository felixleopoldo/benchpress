import os
import json

def dict_to_summary(d):
    s = ""
    for key, val in d.items():
        s += "python workflow/rules/evaluation/benchmarks/add_column.py --filename {res} --colname "+key+" --colval {"+key+"} \n "
    return s

algorithm = snakemake.params["alg"]

with open(snakemake.params["config"]) as json_file:    
    config = json.load(json_file)

cmd="""
Rscript workflow/rules/evaluation/benchmarks/run_summarise.R  --adjmat_true {adjmat_true} --adjmat_est {adjmat_est}  --filename {res}  
python workflow/rules/evaluation/benchmarks/add_column.py --filename {res} --colname seed       --colval {seed}
python workflow/rules/evaluation/benchmarks/add_column.py --filename {res} --colname algorithm       --colval {alg} 
python workflow/rules/evaluation/benchmarks/add_column.py --filename {res} --colname adjmat          --colval {adjmat} 
python workflow/rules/evaluation/benchmarks/add_column.py --filename {res} --colname parameters      --colval {bn} 
python workflow/rules/evaluation/benchmarks/add_column.py --filename {res} --colname data            --colval {data} 
python workflow/rules/evaluation/benchmarks/add_column.py --filename {res} --colname time            --colval `cat {time}`
python workflow/rules/evaluation/benchmarks/add_column.py --filename {res} --colname ntests          --colval None 
"""
cmd += dict_to_summary(config["resources"]["structure_learning_algorithms"][algorithm][0])
 
command = cmd.format(**snakemake.input, **snakemake.params, **snakemake.output, **snakemake.wildcards)

os.system(command)