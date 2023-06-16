import os

def change_filename(original_string):
    return original_string.replace("adjvecs_", "adjvecs_fulloutput_")

rule athomas_jtsampler:
    input:
        data=alg_input_data(),
    output:
        seqgraph=touch(alg_output_seqgraph_path(module_name)),
        seqgraph_full=touch(change_filename(alg_output_seqgraph_path(module_name))),
        time=touch(alg_output_time_path(module_name)),
        ntests=touch(alg_output_ntests_path(module_name))
    container:
       "docker://hallawalla/athomas_jtsampler:1.3"
    script:
        "script.sh"

