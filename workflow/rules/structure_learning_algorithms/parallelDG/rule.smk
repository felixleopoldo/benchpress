# BUG: 
# 1. not providing index 0 in graph traj.
# 2. does not read labels from data header.
rule:
    name:
        module_name
    input:
        data=alg_input_data(),
    output:
        adjvecs=alg_output_seqgraph_path(module_name),
        time=alg_output_time_path(module_name),
        ntests=touch(alg_output_ntests_path(module_name))
    container:
        "docker://hallawalla/paralleldg:0.9.2" 
    shell:
        """
        if [ {wildcards.timeout} = \"None\" ]; then
            if [ {wildcards.datatype} = \"discrete\" ]; then
                /usr/bin/time -f \"%e\" -o {output.time} parallelDG_loglinear_sample -M {wildcards.M} -R {wildcards.R} -f {input} -o . -F {output.adjvecs} --pseudo_obs {wildcards.pseudo_obs} -s {wildcards.mcmc_seed} -t benchpress;
            elif [ {wildcards.datatype} = \"continuous\" ]; then
                /usr/bin/time -f \"%e\" -o {output.time} parallelDG_ggm_sample -M {wildcards.M} -R {wildcards.R} -f {input} -o . -F {output.adjvecs} -s {wildcards.mcmc_seed} -t benchpress --deltas {wildcards.delta} --graph-prior {wildcards.graph_prior} {wildcards.graph_prior_param} {wildcards.graph_prior_param1};
            fi
        else
            if [ {wildcards.datatype} = \"discrete\" ]; then
                /usr/bin/time -f \"%e\" -o {output.time} timeout -s SIGKILL {wildcards.timeout} bash -c  'parallelDG_loglinear_sample -M {wildcards.M} -R {wildcards.R} -f {input} -o . -F {output.adjvecs} --pseudo_obs {wildcards.pseudo_obs} -s {wildcards.mcmc_seed} -t benchpress';
            elif [ {wildcards.datatype} = \"continuous\" ]; then
                /usr/bin/time -f \"%e\" -o {output.time} timeout -s SIGKILL {wildcards.timeout} bash -c  'parallelDG_ggm_sample -M {wildcards.M} -R {wildcards.R} -f {input} -o . -F {output.adjvecs} -s {wildcards.mcmc_seed} -t benchpress  --deltas {wildcards.delta} --graph-prior {wildcards.graph_prior} {wildcards.graph_prior_param} {wildcards.graph_prior_param1}';
            fi
        fi

        if [ -f {output.adjvecs} ]; then
            sleep 1
        else
            touch {output.adjvecs}
            echo None > {output.time};
        fi
        """
