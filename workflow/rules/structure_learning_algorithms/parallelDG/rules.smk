if "parallelDG" in pattern_strings:

    rule parallelDG:
        input:
            data=alg_input_data(),
        output:
            adjvecs=alg_output_seqgraph_path("parallelDG"),
            time=alg_output_time_path("parallelDG"),
        container:
            docker_image("parallelDG")
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

    rule parallelDG_est:
        input:
            "workflow/scripts/evaluation/graphtraj_est.py",
            traj=alg_output_seqgraph_path_nocomp("parallelDG"),
        output:
            adjmat=alg_output_adjmat_path("parallelDG"),  #here is the difference from order_mcmc. matching diffferently.
        params:
            graph_type="chordal",
            estimator="map",
        container:
            docker_image("networkx")
        script:
            "../scripts/evaluation/graphtraj_est.py"