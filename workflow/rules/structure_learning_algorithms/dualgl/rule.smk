def fix_none_startalg(wildcards):
        if wildcards["startalg"] == "None":
            return []
        else:
            return "{output_dir}/adjvecs/{data}/algorithm=/"+ wildcards['startalg']+"/seed={replicate}/adjvecs_fulloutput_tobecompressed.csv"

rule:
    name:
        module_name
    input:
        data=alg_input_data(),
        seqgraph=fix_none_startalg
    output:
        adjmat=alg_output_adjmat_path(module_name),
        time=touch(alg_output_time_path(module_name)),
        ntests=touch(alg_output_ntests_path(module_name))
    container:
        "docker://hallawalla/dualgl:0.1"
    script:
        "screening.R"
