rule copy_fixed_data:
    input:        
        "resources/data/mydatasets/{filename}" # this ensures that the file exists and is copied again if changed.
    output:
        data="{output_dir}/data/adjmat=/{adjmat}/parameters=/None/data=/fixed/filename={filename}/n={n}/seed={seed}.csv"
    shell:
        "cp {input} {output.data}"
