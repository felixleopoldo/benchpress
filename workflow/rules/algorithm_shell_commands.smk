# This is a function which returns the shell commands for most of the algorithms.
# It could also had been a dict.

def alg_shell(algorithm):
    if algorithm == "gt13_multipair":
        return "if [ {wildcards.datatype} = \"discrete\" ]; then \n " \            
            "   tail -n +3 {input.data} > {output.seqgraph}.noheader " \ 
            "   && sed --in-place 's/,/\ /g' {output.seqgraph}.noheader " \
            "   && " \
            "   if [ {wildcards.prior} = \"mbc\" ]; then " \            
            "       java -classpath /jtsampler/classes FitGM -n {wildcards.n_samples} -s 2 -r {wildcards.randomits} -prior mbc -clq {wildcards.clq} -sep {wildcards.sep} -seed {wildcards.mcmc_seed} < {output.seqgraph}.noheader > {output.seqgraph}; " \  
            "   elif [ {wildcards.prior} = \"bc\" ]; then " \
            "       java -classpath /jtsampler/classes FitGM -n {wildcards.n_samples} -s 2 -r {wildcards.randomits} -prior bc -ascore {wildcards.ascore} -bscore {wildcards.bscore} -seed {wildcards.mcmc_seed} < {output.seqgraph}.noheader > {output.seqgraph}; " \
            "   elif [ {wildcards.prior} = \"ep\" ]; then " \            
            "       java -classpath /jtsampler/classes FitGM -n {wildcards.n_samples} -s 2 -r {wildcards.randomits} -prior ep -pen {wildcards.penalty} -seed {wildcards.mcmc_seed} < {output.seqgraph}.noheader > {output.seqgraph} ;" \
            "   else  " \
            "       echo prior not exist ; " \
            "   fi " \
            " fi && " \
            "if [ {wildcards.datatype} = \"continuous\" ]; then  \n " \
            "   tail -n +2 {input.data} > {output.seqgraph}.noheader " \ 
            "   && sed --in-place 's/,/\ /g' {output.seqgraph}.noheader " \
            "   && " \
            "   if [ {wildcards.prior} = \"mbc\" ]; then " \       
            "       java -classpath /jtsampler/classes FitGaussianGM -v  -n {wildcards.n_samples} -s 2 -r {wildcards.randomits} -prior mbc -clq {wildcards.clq} -sep {wildcards.sep} -seed {wildcards.mcmc_seed} < {output.seqgraph}.noheader > {output.seqgraph}; " \  
            "   elif [ {wildcards.prior} = \"bc\" ]; then " \
            "       java -classpath /jtsampler/classes FitGaussianGM -v  -n {wildcards.n_samples} -s 2 -r {wildcards.randomits} -prior bc -ascore {wildcards.ascore} -bscore {wildcards.bscore} -seed {wildcards.mcmc_seed} < {output.seqgraph}.noheader > {output.seqgraph}; " \
            "   elif [ {wildcards.prior} = \"ep\" ]; then " \            
            "       java -classpath /jtsampler/classes FitGaussianGM -v  -n {wildcards.n_samples} -s 2 -r {wildcards.randomits} -prior ep -pen {wildcards.penalty} -seed {wildcards.mcmc_seed} < {output.seqgraph}.noheader > {output.seqgraph} ;" \
            "   else  " \
            "   echo prior not exist ; " \
            "   fi "\
            "fi " \
            "&& echo 1 > {output.time} "


    elif algorithm == "gg99_singlepair":
            return "if [ {wildcards.datatype} = \"discrete\" ]; then \n " \            
            "   tail -n +3 {input.data} > {output.seqgraph}.noheader " \ 
            "   && sed --in-place 's/,/\ /g' {output.seqgraph}.noheader " \
            "   && " \
            "   if [ {wildcards.prior} = \"mbc\" ]; then " \            
            "       java -classpath /jtsampler/classes FitGM -n {wildcards.n_samples} -s 1 -r {wildcards.randomits} -prior mbc -clq {wildcards.clq} -sep {wildcards.sep} -seed {wildcards.mcmc_seed} < {output.seqgraph}.noheader > {output.seqgraph}; " \  
            "   elif [ {wildcards.prior} = \"bc\" ]; then " \
            "       java -classpath /jtsampler/classes FitGM -n {wildcards.n_samples} -s 1 -r {wildcards.randomits} -prior bc -ascore {wildcards.ascore} -bscore {wildcards.bscore} -seed {wildcards.mcmc_seed} < {output.seqgraph}.noheader > {output.seqgraph}; " \
            "   elif [ {wildcards.prior} = \"ep\" ]; then " \            
            "       java -classpath /jtsampler/classes FitGM -n {wildcards.n_samples} -s 1 -r {wildcards.randomits} -prior ep -pen {wildcards.penalty} -seed {wildcards.mcmc_seed} < {output.seqgraph}.noheader > {output.seqgraph} ;" \
            "   else  " \
            "       echo prior not exist ; " \
            "   fi " \
            " fi && " \
            "if [ {wildcards.datatype} = \"continuous\" ]; then  \n " \
            "   tail -n +2 {input.data} > {output.seqgraph}.noheader " \ 
            "   && sed --in-place 's/,/\ /g' {output.seqgraph}.noheader " \
            "   && " \
            "   if [ {wildcards.prior} = \"mbc\" ]; then " \            
            "       java -classpath /jtsampler/classes FitGaussianGM -v -n {wildcards.n_samples} -s 1 -r {wildcards.randomits} -prior mbc -clq {wildcards.clq} -sep {wildcards.sep} -seed {wildcards.mcmc_seed} < {output.seqgraph}.noheader > {output.seqgraph}; " \  
            "   elif [ {wildcards.prior} = \"bc\" ]; then " \
            "       java -classpath /jtsampler/classes FitGaussianGM -v -n {wildcards.n_samples} -s 1 -r {wildcards.randomits} -prior bc -ascore {wildcards.ascore} -bscore {wildcards.bscore} -seed {wildcards.mcmc_seed} < {output.seqgraph}.noheader > {output.seqgraph}; " \
            "   elif [ {wildcards.prior} = \"ep\" ]; then " \            
            "       java -classpath /jtsampler/classes FitGaussianGM -v -n {wildcards.n_samples} -s 1 -r {wildcards.randomits} -prior ep -pen {wildcards.penalty} -seed {wildcards.mcmc_seed} < {output.seqgraph}.noheader > {output.seqgraph} ;" \
            "   else  " \
            "   echo prior not exist ; " \
            "   fi "\
            "fi " \
            "&& echo 1 > {output.time} "

    elif algorithm == "notears":
        return "/usr/bin/time -f \"%e\" -o {output.time} " \  
            "python workflow/scripts/notears/run_notears.py " \
            "--data_filename {input.data} " \
            "--min_rate_of_progress {wildcards.min_rate_of_progress} " \
            "--penalty_growth_rate {wildcards.penalty_growth_rate} " \
            "--optimation_accuracy {wildcards.optimation_accuracy} " \
            "--loss {wildcards.loss} " \
            "--loss_grad {wildcards.loss_grad} " \
            "--filename {output.adjmat} " \     
            "--seed {wildcards.replicate}"        

    elif algorithm == "bnlearn_tabu":
        return "/usr/bin/time -f \"%e\" -o {output.time} " \  
            "Rscript workflow/scripts/run_tabu.R " \
            "--filename_data {input.data} " \
            "--output_dir {wildcards.output_dir} " \
            "--score {wildcards.score} " \
            "--iss {wildcards.iss} " \
            "--iss.mu {wildcards.issmu} " \
            "--iss.w {wildcards.issw} " \
            "--l {wildcards.l} " \
            "--k {wildcards.k} " \
            "--prior {wildcards.prior} " \
            "--beta {wildcards.beta} " \
            "--filename {output.adjmat} " 
            
    if algorithm == "bnlearn_hc":
        return "/usr/bin/time -f \"%e\" -o {output.time} " \  
            "Rscript workflow/scripts/run_hc.R " \
            "--filename_data {input.data} " \
            "--output_dir {wildcards.output_dir} " \
            "--perturb {wildcards.perturb} " \
            "--restart {wildcards.restart} " \
            "--score {wildcards.score} " \
            "--iss {wildcards.iss} " \
            "--iss.mu {wildcards.issmu} " \
            "--iss.w {wildcards.issw} " \
            "--l {wildcards.l} " \
            "--k {wildcards.k} " \
            "--prior {wildcards.prior} " \
            "--beta {wildcards.beta} " \
            "--filename {output.adjmat} " 

    elif algorithm == "rblip_asobs":
        return  "/usr/bin/time -f \"%e\" -o {output.time} " \  
                "Rscript workflow/scripts/run_blip.R " \
                "--filename_data {input.data} " \
                "--output_dir {wildcards.output_dir} " \
                "--time {wildcards.time} " \
                "--scorer.method {wildcards.scorermethod} " \
                "--solver.method {wildcards.solvermethod} " \
                "--indeg {wildcards.indeg} " \  
                "--cores {wildcards.cores} " \
                "--allocated {wildcards.allocated} " \
                "--scorefunction {wildcards.scorefunction} " \
                "--alpha {wildcards.alpha} " \
                "--verbose {wildcards.verbose} " \
                "--filename {output.adjmat} " 

    elif algorithm == "gobnilp":
        return "touch {output.adjmat}.gobnilp.set && " \   
                "echo 'gobnilp/outputfile/adjacencymatrix = \"{output.adjmat}.bn.mat\" ' > {output.adjmat}.gobnilp.set &&" \
                "echo 'gobnilp/outputfile/scoreandtime = \"{output.adjmat}.score_and_time.txt\" ' >> {output.adjmat}.gobnilp.set &&" \
                "if [ {wildcards.continuous} = \"True\" ]; then "\
                "echo 'gobnilp/scoring/continuous = TRUE ' >> {output.adjmat}.gobnilp.set && " \
                "echo 'gobnilp/scoring/score_type = \"{wildcards.score_type}\" ' >> {output.adjmat}.gobnilp.set && " \     
                "echo 'gobnilp/scoring/alpha_mu = {wildcards.alpha_mu} ' >> {output.adjmat}.gobnilp.set && " \
                "echo 'gobnilp/scoring/alpha_omega_minus_nvars = {wildcards.alpha_omega_minus_nvars} ' >> {output.adjmat}.gobnilp.set ; " \
                "fi && " \
                "if [ {wildcards.continuous} = \"False\" ]; then "\
                "echo 'gobnilp/scoring/alpha = {wildcards.alpha} ' >> {output.adjmat}.gobnilp.set ; " \
                "fi && " \
                "echo 'gobnilp/scoring/palim = {wildcards.palim} ' >> {output.adjmat}.gobnilp.set && " \     
                "echo 'gobnilp/scoring/prune = {wildcards.prune} ' >> {output.adjmat}.gobnilp.set && " \     
                "echo 'gobnilp/delimiter = \",\" ' >> {output.adjmat}.gobnilp.set && " \     
                "/myappdir/gobnilp/bin/gobnilp -f=dat -g={output.adjmat}.gobnilp.set {input.data} " \
                " && cat {output.adjmat}.bn.mat > {output.adjmat} " \
                " && sed --in-place 's/\ /,/g' {output.adjmat} " \
                " && head -n 1 {input.data} > {output.adjmat}.header " \
                " && cat {output.adjmat} >> {output.adjmat}.header " \
                " && mv {output.adjmat}.header {output.adjmat} " \ 
                " && cat {output.adjmat}.score_and_time.txt > {output.time} " \                 
                " && rm {output.adjmat}.score_and_time.txt " \
                " && rm {output.adjmat}.bn.mat " \
                " && rm {output.adjmat}.gobnilp.set"

    elif algorithm == "trilearn_pgibbs":
        return  "if [ {wildcards.datatype} = \"discrete\" ]; then "\
                "pgibbs_loglinear_sample -N {wildcards.N} -M {wildcards.M} -f {input} -o . -F {output.adjvecs} --pseudo_observations {wildcards.pseudo_obs} -s {wildcards.mcmc_seed}; " \  
                "elif [ {wildcards.datatype} = \"continuous\" ]; then " \
                "pgibbs_ggm_sample -N {wildcards.N} -M {wildcards.M} -f {input} -o . -F {output.adjvecs} -s {wildcards.mcmc_seed}; " \  
                "fi " \
                "&& echo '1' > {output.time} " 

    elif algorithm == "gg99_singlepair_fortran":
        return  "out=$RANDOM.csv " \
                "&& data=$RANDOM.csv " \
                "&& cp {input.data} $data " \
                "&& /ggsampler/jt -v`head -1 {input.data} | sed 's/[^,]//g' | wc -c` -n{wildcards.n} -b0 -m3 $data -pfx $out -s {wildcards.replicate} " \
                "&& mv $out {output.adjvecs} "\
                "&& rm $data "\
                "&& echo 1 > {output.time}"
