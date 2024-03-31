def fix_none_startalg(wildcards):
        if wildcards["startalg"] == "None":
            return []
        else:
            return "{output_dir}/adjvecs/{data}/algorithm=/"+ wildcards['startalg']+"/seed={seed}/adjvecs_fulloutput.csv"

def extract_filename(filename):
    return filename.replace("_fulloutput.tar.gz", "fulloutput_tobecompressed.csv")
    



rule extract_dualgl:
    input:
        "{whatever}/adjvecs_fulloutput.tar.gz"
    output:
        temp("{whatever}/adjvecs_fulloutput.csv")
    shell:
        "tar -xf {input} && mv {wildcards.whatever}/adjvecs_fulloutput_tobecompressed.csv {output}"

     
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
        "docker://hallawalla/dualgl:1.4"
    script:
        "screening.R"


