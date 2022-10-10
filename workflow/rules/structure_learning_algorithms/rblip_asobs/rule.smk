
if "rblip_asobs" in pattern_strings:

    rule blip:
        input:
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("rblip_asobs"),
            time=alg_output_time_path("rblip_asobs"),
        shell:
            alg_shell("rblip_asobs")