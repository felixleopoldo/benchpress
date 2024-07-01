import snakemake
import networkx as nx
import pandas as pd
import workflow.rules.filename_patterns as fn_patterns
from workflow.rules.module_patterns import * 


import json


def alg_obj_to_path(alg, alg_json_obj, datafile):
    
    with open("config/config.json") as json_file:
        config = json.load(json_file)


    pattern_strings = gen_pattern_strings(config) # patterns for all modules
            
    adjmat_path_pattern = fn_patterns.alg_output_adjmat_path2(pattern_strings[alg])
    
    # copy the datafile to mydata folder
    pathstring = adjmat_path_pattern.format(**alg_json_obj, 
                          output_dir="results", 
                          data="fixed/filename=resources/data/mydatasets/"+datafile+"/n=100/seed=1/params/=None",
                          replicate="1"
                          )
    # or use expand function
    return pathstring
    
def estimate(alg, alg_json_obj, datafile):
    """Estimates a graph.
    Internally it transferres the json to a path and runs bp.

    Args:
        alg_json (_type_): This is ajson snippet (algorithm object) taken from e.g. docs.
    """
    
    
    pathstring = alg_obj_to_path(alg, alg_json_obj, datafile)
    
    
    # might also set workdir
    snakemake.snakemake("workflow/Snakemake", targets=[pathstring], use_singularity=True)    
    
    # read the adjmat to file
    
    adjmat = pd.read_csv(pathstring)
    graph = nx.from_numpy_array(adjmat)
    
    return graph    