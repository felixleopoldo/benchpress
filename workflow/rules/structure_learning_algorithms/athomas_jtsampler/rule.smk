import os

def change_filename(original_string):
    return original_string.replace("adjvecs_", "adjvecs_fulloutput_")

def compress(original_string):
    return original_string.replace("adjvecs_fulloutput_tobecompressed.csv", "adjvecs_fulloutput.tar.gz")

SEQGRAPH_PATH = alg_output_seqgraph_path(module_name)
SEQGRAPH_FULL_PATH = change_filename(SEQGRAPH_PATH)
SEQGRAPH_COMPRESSED_PATH = compress(SEQGRAPH_FULL_PATH)


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


rule compress_file:
    input:
        SEQGRAPH_FULL_PATH
    output:
        SEQGRAPH_COMPRESSED_PATH
    shell:
        "tar -czf {file_out} {file_in}"
        
