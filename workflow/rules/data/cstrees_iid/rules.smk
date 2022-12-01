rule sample_cstrees_data:
    input:
        cstree = "{output_dir}/adjmat/{adjmat}/seed={replicate}.csv",
        #params="{output_dir}/parameters/"+pattern_strings["cstrees_params"]+"/adjmat=/{adjmat}.csv" # This could probably be relaxed
    output:
        data="{output_dir}/data" \
             "/adjmat=/{adjmat}"\
             "/parameters=/"+pattern_strings["cstrees_params"] + "" \
             "/data=/cstrees_iid/n={n}/seed={replicate}.csv"
    container:
        None
    conda:
        "cstrees.yml"
    script:
        "cstree_data.py"
