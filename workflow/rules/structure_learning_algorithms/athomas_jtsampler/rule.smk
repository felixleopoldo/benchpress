import os

def change_filename(original_string):
    return original_string.replace("adjvecs_", "adjvecs_fulloutput_")

def compress(original_string):
    return original_string.replace(".csv", ".tar.gz")

rule athomas_jtsampler:
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
        rules.athomas_jtsampler.output.seqgraph_full
    output:
        compress(rules.athomas_jtsampler.output.seqgraph_full)
    shell:
        """
        tar -czf {output} {input}
        rm {input}
        """