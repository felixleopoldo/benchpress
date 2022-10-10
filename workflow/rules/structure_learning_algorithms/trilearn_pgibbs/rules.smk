
if "trilearn_pgibbs" in pattern_strings:

    rule trilearn:
        input:
            data=alg_input_data(),
        output:
            adjvecs=alg_output_seqgraph_path("trilearn_pgibbs"),
            time=alg_output_time_path("trilearn_pgibbs"),
        container:
            docker_image("trilearn")
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

    rule trilearn_est:
        input:
            "workflow/scripts/evaluation/graphtraj_est.py",
            traj=alg_output_seqgraph_path_nocomp("trilearn_pgibbs"),
        output:
            adjmat=alg_output_adjmat_path("trilearn_pgibbs"),  #here is the difference from order_mcmc. matching diffferently.
        params:
            graph_type="chordal",
            estimator="map",
        container:
            docker_image("networkx")
        script:
            "../scripts/evaluation/graphtraj_est.py"