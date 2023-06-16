import os

def change_filename(original_string):
    return original_string.replace("adjvecs_", "adjvecs_fulloutput_")

def compress(original_string):
    return original_string.replace("adjvecs_fulloutput_tobecompressed.csv", "adjvecs_fulloutput.tar.gz")

rule:
    name:
        module_name
    input:
        data=alg_input_data(),
    output:
        seqgraph=touch(alg_output_seqgraph_path(module_name)),
        seqgraph_full=touch(change_filename(alg_output_seqgraph_path(module_name))),
        time=touch(alg_output_time_path(module_name)),
        ntests=touch(alg_output_ntests_path(module_name))
    container:
        None
    script:
        "script.sh"

        
