
def alg_shell(algorithm):
    if algorithm == "gt13_multipair":
        return """if [ {wildcards.datatype} = \"discrete\" ]; then
               tail -n +3 {input.data} > {output.seqgraph}.noheader
               sed --in-place 's/,/\ /g' {output.seqgraph}.noheader

               if [ {wildcards.prior} = \"mbc\" ]; then
                    if [ {wildcards.timeout} = \"None\" ]; then
                        /usr/bin/time -q -f \"%e\" -o {output.time} java -classpath /jtsampler/classes FitGM -n {wildcards.n_samples} -s 2 -r {wildcards.randomits} -prior mbc -clq {wildcards.clq} -sep {wildcards.sep} -seed {wildcards.mcmc_seed} < {output.seqgraph}.noheader > {output.seqgraph};
                    else
                        /usr/bin/time -q -f \"%e\" -o {output.time} timeout -s SIGINT {wildcards.timeout} bash -c  'java -classpath /jtsampler/classes FitGM -n {wildcards.n_samples} -s 2 -r {wildcards.randomits} -prior mbc -clq {wildcards.clq} -sep {wildcards.sep} -seed {wildcards.mcmc_seed} < {output.seqgraph}.noheader > {output.seqgraph}';
                    fi
               elif [ {wildcards.prior} = \"bc\" ]; then
                    if [ {wildcards.timeout} = \"None\" ]; then
                        /usr/bin/time -q -f \"%e\" -o {output.time} java -classpath /jtsampler/classes FitGM -n {wildcards.n_samples} -s 2 -r {wildcards.randomits} -prior bc -ascore {wildcards.ascore} -bscore {wildcards.bscore} -seed {wildcards.mcmc_seed} < {output.seqgraph}.noheader > {output.seqgraph};
                    else
                        /usr/bin/time -q -f \"%e\" -o {output.time} timeout -s SIGINT {wildcards.timeout} bash -c  'java -classpath /jtsampler/classes FitGM -n {wildcards.n_samples} -s 2 -r {wildcards.randomits} -prior bc -ascore {wildcards.ascore} -bscore {wildcards.bscore} -seed {wildcards.mcmc_seed} < {output.seqgraph}.noheader > {output.seqgraph}';
                    fi
               elif [ {wildcards.prior} = \"ep\" ]; then
                   if [ {wildcards.timeout} = \"None\" ]; then
                       /usr/bin/time -q -f \"%e\" -o {output.time} java -classpath /jtsampler/classes FitGM -n {wildcards.n_samples} -s 2 -r {wildcards.randomits} -prior ep -pen {wildcards.penalty} -seed {wildcards.mcmc_seed} < {output.seqgraph}.noheader > {output.seqgraph} ;
                    else
                        /usr/bin/time -q -f \"%e\" -o {output.time} timeout -s SIGINT {wildcards.timeout} bash -c  'java -classpath /jtsampler/classes FitGM -n {wildcards.n_samples} -s 2 -r {wildcards.randomits} -prior ep -pen {wildcards.penalty} -seed {wildcards.mcmc_seed} < {output.seqgraph}.noheader > {output.seqgraph}' ;
                    fi
               fi
             fi
            if [ {wildcards.datatype} = \"continuous\" ]; then
               tail -n +2 {input.data} > {output.seqgraph}.noheader
               sed --in-place 's/,/\ /g' {output.seqgraph}.noheader
               if [ {wildcards.prior} = \"mbc\" ]; then
                   if [ {wildcards.timeout} = \"None\" ]; then
                       /usr/bin/time -q -f \"%e\" -o {output.time} java -classpath /jtsampler/classes FitGaussianGM -v  -n {wildcards.n_samples} -s 2 -r {wildcards.randomits} -prior mbc -clq {wildcards.clq} -sep {wildcards.sep} -seed {wildcards.mcmc_seed} < {output.seqgraph}.noheader > {output.seqgraph};
                    else
                        /usr/bin/time -q -f \"%e\" -o {output.time} timeout -s SIGINT {wildcards.timeout} bash -c  'java -classpath /jtsampler/classes FitGaussianGM -v  -n {wildcards.n_samples} -s 2 -r {wildcards.randomits} -prior mbc -clq {wildcards.clq} -sep {wildcards.sep} -seed {wildcards.mcmc_seed} < {output.seqgraph}.noheader > {output.seqgraph}';
                    fi
               elif [ {wildcards.prior} = \"bc\" ]; then
                   if [ {wildcards.timeout} = \"None\" ]; then
                       /usr/bin/time -q -f \"%e\" -o {output.time} java -classpath /jtsampler/classes FitGaussianGM -v  -n {wildcards.n_samples} -s 2 -r {wildcards.randomits} -prior bc -ascore {wildcards.ascore} -bscore {wildcards.bscore} -seed {wildcards.mcmc_seed} < {output.seqgraph}.noheader > {output.seqgraph};
                    else
                        /usr/bin/time -q -f \"%e\" -o {output.time} timeout -s SIGINT {wildcards.timeout} bash -c  'java -classpath /jtsampler/classes FitGaussianGM -v  -n {wildcards.n_samples} -s 2 -r {wildcards.randomits} -prior bc -ascore {wildcards.ascore} -bscore {wildcards.bscore} -seed {wildcards.mcmc_seed} < {output.seqgraph}.noheader > {output.seqgraph}';
                    fi
               elif [ {wildcards.prior} = \"ep\" ]; then
                   if [ {wildcards.timeout} = \"None\" ]; then
                       /usr/bin/time -q -f \"%e\" -o {output.time} java -classpath /jtsampler/classes FitGaussianGM -v  -n {wildcards.n_samples} -s 2 -r {wildcards.randomits} -prior ep -pen {wildcards.penalty} -seed {wildcards.mcmc_seed} < {output.seqgraph}.noheader > {output.seqgraph} ;
                    else
                        /usr/bin/time -q -f \"%e\" -o {output.time} timeout -s SIGINT {wildcards.timeout} bash -c  'java -classpath /jtsampler/classes FitGaussianGM -v  -n {wildcards.n_samples} -s 2 -r {wildcards.randomits} -prior ep -pen {wildcards.penalty} -seed {wildcards.mcmc_seed} < {output.seqgraph}.noheader > {output.seqgraph}';
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