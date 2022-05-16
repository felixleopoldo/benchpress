# This is a function which returns the shell commands for most of the algorithms.
# It could also had been a dict.

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

    elif algorithm == "gg99_singlepair":
            return """
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


    elif algorithm == "notears":
        return  """ 
                /usr/bin/time -f \"%e\" -o {output.time}  \
                python workflow/scripts/structure_learning_algorithms/jmoss20_notears.py  \
                --data_filename {input.data}  \
                --min_rate_of_progress {wildcards.min_rate_of_progress}  \
                --penalty_growth_rate {wildcards.penalty_growth_rate}  \
                --optimation_accuracy {wildcards.optimation_accuracy}  \
                --loss {wildcards.loss}  \
                --timeout {wildcards.timeout}  \
                --loss_grad {wildcards.loss_grad}  \
                --filename {output.adjmat} \
                --seed {wildcards.replicate} ;
           """

    elif algorithm == "rblip_asobs":
        return  "/usr/bin/time -f \"%e\" -o {output.time} " \
                "Rscript workflow/scripts/structure_learning_algorithms/rblip_asobs.R " \
                "--filename_data {input.data} " \
                "--output_dir {wildcards.output_dir} " \
                "--time {wildcards.timeout} " \
                "--scorer.method {wildcards.scorermethod} " \
                "--solver.method {wildcards.solvermethod} " \
                "--indeg {wildcards.indeg} " \
                "--cores {wildcards.cores} " \
                "--allocated {wildcards.allocated} " \
                "--scorefunction {wildcards.scorefunction} " \
                "--alpha {wildcards.alpha} " \
                "--verbose {wildcards.verbose_level} " \
                "--filename {output.adjmat} "

    elif algorithm == "gobnilp":
        # Configure the gobnilp.set
        command= """touch {output.adjmat}.gobnilp.set
                echo -e gobnilp/outputfile/adjacencymatrix = \134\\042{output.adjmat}\134\\042 > {output.adjmat}.gobnilp.set
                echo -e gobnilp/outputfile/scoreandtime = \134\\042{output.adjmat}.scoretime\134\\042 >> {output.adjmat}.gobnilp.set
                echo -e gobnilp/dagconstraintsfile = \134\\042{input.constraints}\134\\042 >> {output.adjmat}.gobnilp.set
                echo -e misc/catchctrlc = FALSE >> {output.adjmat}.gobnilp.set
                echo -e gobnilp/writebestsols = TRUE >> {output.adjmat}.gobnilp.set
                if [ {wildcards.continuous} = \"True\" ]; then
                    echo -e gobnilp/scoring/continuous = TRUE >> {output.adjmat}.gobnilp.set
                    echo -e gobnilp/scoring/score_type = \134\\042{wildcards.score_type}\134\\042 >> {output.adjmat}.gobnilp.set
                    echo -e gobnilp/scoring/alpha_mu = {wildcards.alpha_mu} >> {output.adjmat}.gobnilp.set
                    echo -e gobnilp/scoring/alpha_omega_minus_nvars = {wildcards.alpha_omega_minus_nvars} >> {output.adjmat}.gobnilp.set ;
                fi
                if [ {wildcards.continuous} = \"False\" ]; then
                    echo -e gobnilp/scoring/alpha = {wildcards.alpha} >> {output.adjmat}.gobnilp.set ;
                fi
                echo -e gobnilp/scoring/palim = {wildcards.palim} >> {output.adjmat}.gobnilp.set
                if [ {wildcards.time_limit} != \"None\" ]; then
		            echo -e limits/time = {wildcards.time_limit} >> {output.adjmat}.gobnilp.set ;
                fi
                if [ {wildcards.gap_limit} != \"None\" ]; then
                    echo -e limits/gap = {wildcards.gap_limit} >> {output.adjmat}.gobnilp.set ;
                fi
                echo -e gobnilp/scoring/prune = {wildcards.prune} >> {output.adjmat}.gobnilp.set
                echo -e gobnilp/delimiter = \134\042,\134\042 >> {output.adjmat}.gobnilp.set
                cat resources/extra_args/{wildcards.extra_args} >> {output.adjmat}.gobnilp.set
                if [ {wildcards.timeout} != \"None\" ]; then                    
                    (timeout --signal=SIGKILL {wildcards.timeout} bash -c '/myappdir/gobnilp/bin/gobnilp -f=dat -g={output.adjmat}.gobnilp.set {input.data}' || exit 0)
                else
                    /myappdir/gobnilp/bin/gobnilp -f=dat -g={output.adjmat}.gobnilp.set {input.data};
                fi
                if [ -f {output.adjmat} ]; then
                    sed --in-place s/\ /,/g {output.adjmat}
                    head -n 1 {input.data} > {output.adjmat}.header
                    cat {output.adjmat} >> {output.adjmat}.header
                    awk '{{print $2}}' {output.adjmat}.scoretime > {output.time}
                    mv {output.adjmat}.header {output.adjmat}
                    rm -f {output.adjmat}.scoretime;
                else
                    touch {output.adjmat}
                    echo None > {output.time};
                fi
                rm -f {output.adjmat}.gobnilp.set """
        return command

    elif algorithm == "trilearn_pgibbs":
        return  """
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

    elif algorithm == "gg99_singlepair_fortran":
        return  "out=$RANDOM.csv " \
                "&& data=$RANDOM.csv " \
                "&& cp {input.data} $data " \
                "&& /ggsampler/jt -v`head -1 {input.data} | sed 's/[^,]//g' | wc -c` -n{wildcards.n} -b0 -m3 $data -pfx $out -s {wildcards.replicate} " \
                "&& mv $out {output.adjvecs} "\
                "&& rm $data "\
                "&& echo 1 > {output.time}"

    elif algorithm == "parallelDG":
        return  """
                if [ {wildcards.timeout} = \"None\" ]; then
                    if [ {wildcards.datatype} = \"discrete\" ]; then
                        /usr/bin/time -f \"%e\" -o {output.time} parallelDG_loglinear_sample -M {wildcards.M} -R {wildcards.R} -f {input} -o . -F {output.adjvecs} --pseudo_obs {wildcards.pseudo_obs} -s {wildcards.mcmc_seed} -t benchpress;
                    elif [ {wildcards.datatype} = \"continuous\" ]; then
                        /usr/bin/time -f \"%e\" -o {output.time} parallelDG_ggm_sample -M {wildcards.M} -R {wildcards.R} -f {input} -o . -F {output.adjvecs} -s {wildcards.mcmc_seed} -t bechpress;
                    fi
                else
                     if [ {wildcards.datatype} = \"discrete\" ]; then
                        /usr/bin/time -f \"%e\" -o {output.time} timeout -s SIGKILL {wildcards.timeout} bash -c  'parallelDG_loglinear_sample -M {wildcards.M} -R {wildcards.R} -f {input} -o . -F {output.adjvecs} --pseudo_obs {wildcards.pseudo_obs} -s {wildcards.mcmc_seed} -t benchpress';
                    elif [ {wildcards.datatype} = \"continuous\" ]; then
                        /usr/bin/time -f \"%e\" -o {output.time} timeout -s SIGKILL {wildcards.timeout} bash -c  'parallelDG_ggm_sample -M {wildcards.M} -R {wildcards.R} -f {input} -o . -F {output.adjvecs} -s {wildcards.mcmc_seed} -t benchpress';
                    fi
                fi

                if [ -f {output.adjvecs} ]; then
                    sleep 1
                else
                    touch {output.adjvecs}
                    echo None > {output.time};
                fi
                """
