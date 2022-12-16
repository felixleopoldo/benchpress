
def fix_none_startalg(wildcards):
        if wildcards["startalg"] == "None":
            return []
        else:
            return "{output_dir}/adjmat_estimate/{data}/algorithm=/{startalg}/seed={replicate}/adjmat.csv",

rule:
    name: module_name
    input:
        data=alg_input_data(),
        startgraph_file=fix_none_startalg,
    output:  
        seqgraph=alg_output_seqgraph_path(module_name),
        time=alg_output_time_path(module_name),
        ntests=touch(alg_output_ntests_path(module_name))
    container:
        "docker://onceltuca/bdgraph:2.64"
    script:
        "script.R"
