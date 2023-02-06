rule:
    """ 
    The variable module_name is determined from the folder name
    and set in the Snakefile.
    """
    name:
        module_name
    input:
        data = alg_input_data()        
    output:
        adjvecs=alg_output_seqgraph_path(module_name),
        time=alg_output_time_path(module_name),
        ntests=touch(alg_output_ntests_path(module_name))
    container:
        "docker://onceltuca/pgreen_gg99:1.0"
    shell:
        "out=$RANDOM.csv " \
        "&& data=$RANDOM.csv " \
        "&& cp {input.data} $data " \
        "&& /ggsampler/jt -v`head -1 {input.data} | sed 's/[^,]//g' | wc -c` -n{wildcards.n} -b0 -m3 $data -pfx $out -s {wildcards.replicate} " \
        "&& mv $out {output.adjvecs} "\
        "&& rm $data "\
        "&& echo 1 > {output.time}"