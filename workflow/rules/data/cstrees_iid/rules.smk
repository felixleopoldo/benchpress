if "cstrees_params" in pattern_strings:
    rule sample_cstrees_data:
        input:
            cstree = "{output_dir}/adjmat/{adjmat}/seed={seed}.csv",
            #params="{output_dir}/parameters/"+pattern_strings["cstrees_params"]+"/adjmat=/{adjmat}.csv" # This could probably be relaxed
        output:
            data="{output_dir}/data" \
                "/adjmat=/{adjmat}"\
                "/parameters=/"+pattern_strings["cstrees_params"] + "" \
                "data=/"+pattern_strings["cstrees_iid"] + "/" \
                "seed={seed}.csv"
                "/data=/cstrees_iid/n={n}/seed={replicate}.csv"
        container:
            None
        conda:
            "cstrees"
        script:
            "cstree_data.py"
