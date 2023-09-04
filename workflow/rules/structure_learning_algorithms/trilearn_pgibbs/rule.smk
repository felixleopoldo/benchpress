
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
        "docker://bpimages/trilearn:2.0.1-arm64"
    shell:
        """
        if [ {wildcards.timeout} = \"None\" ]; then
            if [ {wildcards.datatype} = \"discrete\" ]; then
                /usr/bin/time -f \"%e\" -o {output.time} pgibbs_loglinear_sample -N {wildcards.n_particles} -M {wildcards.M} -f {input} -o . -F {output.adjvecs} --pseudo_observations {wildcards.pseudo_obs} -s {wildcards.mcmc_seed};
            elif [ {wildcards.datatype} = \"continuous\" ]; then
                /usr/bin/time -f \"%e\" -o {output.time} pgibbs_ggm_sample -N {wildcards.n_particles} -M {wildcards.M} -f {input} -o . -F {output.adjvecs} -s {wildcards.mcmc_seed};
            fi
        else
                if [ {wildcards.datatype} = \"discrete\" ]; then
                /usr/bin/time -f \"%e\" -o {output.time} timeout -s SIGKILL {wildcards.timeout} bash -c  'pgibbs_loglinear_sample -N {wildcards.n_particles} -M {wildcards.M} -f {input} -o . -F {output.adjvecs} --pseudo_observations {wildcards.pseudo_obs} -s {wildcards.mcmc_seed}';
            elif [ {wildcards.datatype} = \"continuous\" ]; then
                /usr/bin/time -f \"%e\" -o {output.time} timeout -s SIGKILL {wildcards.timeout} bash -c  'pgibbs_ggm_sample -N {wildcards.n_particles} -M {wildcards.M} -f {input} -o . -F {output.adjvecs} -s {wildcards.mcmc_seed}';
            fi
        fi

        if [ -f {output.adjvecs} ]; then
            sleep 1
        else
            touch {output.adjvecs}
            echo None > {output.time};
        fi
        """
