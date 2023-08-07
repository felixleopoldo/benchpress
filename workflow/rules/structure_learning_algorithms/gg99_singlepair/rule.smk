rule:
    name:
        module_name
    input:
        data=alg_input_data(),
    output:
        seqgraph=alg_output_seqgraph_path(module_name),
        time=alg_output_time_path(module_name),
        ntests=touch(alg_output_ntests_path(module_name))
    container:
        "docker://bpimages/thomasgreen:1.19-bp"
    shell:
        """
            if [ {wildcards.timeout} = \"None\" ]; then
                if [ {wildcards.datatype} = \"discrete\" ]; then
                    tail -n +3 {input.data} > {output.seqgraph}.noheader
                    sed --in-place 's/,/\ /g' {output.seqgraph}.noheader
                    if [ {wildcards.prior} = \"mbc\" ]; then
                        /usr/bin/time -q -f \"%e\" -o {output.time} java -classpath /jtsampler/classes FitGM -n {wildcards.n_samples} -s 1 -r {wildcards.randomits} -prior mbc -clq {wildcards.clq} -sep {wildcards.sep} -seed {wildcards.mcmc_seed} < {output.seqgraph}.noheader > {output.seqgraph};
                    elif [ {wildcards.prior} = \"bc\" ]; then
                        /usr/bin/time -q -f \"%e\" -o {output.time} java -classpath /jtsampler/classes FitGM -n {wildcards.n_samples} -s 1 -r {wildcards.randomits} -prior bc -ascore {wildcards.ascore} -bscore {wildcards.bscore} -seed {wildcards.mcmc_seed} < {output.seqgraph}.noheader > {output.seqgraph};
                    elif [ {wildcards.prior} = \"ep\" ]; then
                        /usr/bin/time -q -f \"%e\" -o {output.time} java -classpath /jtsampler/classes FitGM -n {wildcards.n_samples} -s 1 -r {wildcards.randomits} -prior ep -pen {wildcards.penalty} -seed {wildcards.mcmc_seed} < {output.seqgraph}.noheader > {output.seqgraph} ;
                    fi
                fi
                if [ {wildcards.datatype} = \"continuous\" ]; then
                    tail -n +2 {input.data} > {output.seqgraph}.noheader
                    sed --in-place 's/,/\ /g' {output.seqgraph}.noheader
                    if [ {wildcards.prior} = \"mbc\" ]; then
                        /usr/bin/time -q -f \"%e\" -o {output.time} java -classpath /jtsampler/classes FitGaussianGM -v -n {wildcards.n_samples} -s 1 -r {wildcards.randomits} -prior mbc -clq {wildcards.clq} -sep {wildcards.sep} -seed {wildcards.mcmc_seed} < {output.seqgraph}.noheader > {output.seqgraph};
                    elif [ {wildcards.prior} = \"bc\" ]; then
                        /usr/bin/time -q -f \"%e\" -o {output.time} java -classpath /jtsampler/classes FitGaussianGM -v -n {wildcards.n_samples} -s 1 -r {wildcards.randomits} -prior bc -ascore {wildcards.ascore} -bscore {wildcards.bscore} -seed {wildcards.mcmc_seed} < {output.seqgraph}.noheader > {output.seqgraph};
                    elif [ {wildcards.prior} = \"ep\" ]; then
                        /usr/bin/time -q -f \"%e\" -o {output.time} java -classpath /jtsampler/classes FitGaussianGM -v -n {wildcards.n_samples} -s 1 -r {wildcards.randomits} -prior ep -pen {wildcards.penalty} -seed {wildcards.mcmc_seed} < {output.seqgraph}.noheader > {output.seqgraph} ;
                    fi
                fi
            else
            if [ {wildcards.datatype} = \"discrete\" ]; then
                    tail -n +3 {input.data} > {output.seqgraph}.noheader
                    sed --in-place 's/,/\ /g' {output.seqgraph}.noheader
                    if [ {wildcards.prior} = \"mbc\" ]; then
                        /usr/bin/time -q -f \"%e\" -o {output.time} timeout -s SIGINT {wildcards.timeout} bash -c  'java -classpath /jtsampler/classes FitGM -n {wildcards.n_samples} -s 1 -r {wildcards.randomits} -prior mbc -clq {wildcards.clq} -sep {wildcards.sep} -seed {wildcards.mcmc_seed} < {output.seqgraph}.noheader > {output.seqgraph}';
                    elif [ {wildcards.prior} = \"bc\" ]; then
                        /usr/bin/time -q -f \"%e\" -o {output.time} timeout -s SIGINT {wildcards.timeout} bash -c  'java -classpath /jtsampler/classes FitGM -n {wildcards.n_samples} -s 1 -r {wildcards.randomits} -prior bc -ascore {wildcards.ascore} -bscore {wildcards.bscore} -seed {wildcards.mcmc_seed} < {output.seqgraph}.noheader > {output.seqgraph}';
                    elif [ {wildcards.prior} = \"ep\" ]; then
                        /usr/bin/time -q -f \"%e\" -o {output.time} timeout -s SIGINT {wildcards.timeout} bash -c  'java -classpath /jtsampler/classes FitGM -n {wildcards.n_samples} -s 1 -r {wildcards.randomits} -prior ep -pen {wildcards.penalty} -seed {wildcards.mcmc_seed} < {output.seqgraph}.noheader > {output.seqgraph}' ;
                    fi
                fi
                if [ {wildcards.datatype} = \"continuous\" ]; then
                    tail -n +2 {input.data} > {output.seqgraph}.noheader
                    sed --in-place 's/,/\ /g' {output.seqgraph}.noheader
                    if [ {wildcards.prior} = \"mbc\" ]; then
                        /usr/bin/time -q -f \"%e\" -o {output.time} timeout -s SIGINT {wildcards.timeout} bash -c  'java -classpath /jtsampler/classes FitGaussianGM -v -n {wildcards.n_samples} -s 1 -r {wildcards.randomits} -prior mbc -clq {wildcards.clq} -sep {wildcards.sep} -seed {wildcards.mcmc_seed} < {output.seqgraph}.noheader > {output.seqgraph}';
                    elif [ {wildcards.prior} = \"bc\" ]; then
                        /usr/bin/time -q -f \"%e\" -o {output.time} timeout -s SIGINT {wildcards.timeout} bash -c  'java -classpath /jtsampler/classes FitGaussianGM -v -n {wildcards.n_samples} -s 1 -r {wildcards.randomits} -prior bc -ascore {wildcards.ascore} -bscore {wildcards.bscore} -seed {wildcards.mcmc_seed} < {output.seqgraph}.noheader > {output.seqgraph}';
                    elif [ {wildcards.prior} = \"ep\" ]; then
                        /usr/bin/time -q -f \"%e\" -o {output.time} timeout -s SIGINT {wildcards.timeout} bash -c  'java -classpath /jtsampler/classes FitGaussianGM -v -n {wildcards.n_samples} -s 1 -r {wildcards.randomits} -prior ep -pen {wildcards.penalty} -seed {wildcards.mcmc_seed} < {output.seqgraph}.noheader > {output.seqgraph}' ;
                    fi
                fi
            fi

            rm -f {output.seqgraph}.noheader
            if [ -f {output.seqgraph} ]; then
                sleep 1
            else
                touch {output.seqgraph}
                echo None > {output.time};
            fi
            """