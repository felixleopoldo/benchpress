def alg_shell(algorithm):
    if algorithm == "greenthomas":
        #"&& /usr/bin/time -f \"%e\" -o {output.time} " \  
        return "tail -n +3 {input.data} > {input.data}.noheader " \    
            "&& cd workflow/scripts/thomasgreen && java EstimateMultinomialGM -v 0 " \
            "-s 0 "\
            "-n {wildcards.n_samples} "\
            "-r {wildcards.randomits} "\
            "-p {wildcards.penalty} < ../{input.data}.noheader > ../{output.adjmat}.adjlist " \
            "&& python workflow/scripts/adjlist_to_adjmat.py ../{output.adjmat}.adjlist ../{output.adjmat} " \
            "&& rm ../{output.adjmat}.adjlist ../{input.data}.noheader "\
            "&& echo 1 > ../{output.time}"

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

    elif algorithm == "tabu":
        return "/usr/bin/time -f \"%e\" -o {output.time} " \  
            "Rscript workflow/scripts/run_tabu.R " \
            "--filename_data {input.data} " \
            "--output_dir {wildcards.output_dir} " \
            "--score {wildcards.score} " \
            "--iss {wildcards.iss} " \
            "--iss.mu {wildcards.issmu} " \
            "--l {wildcards.l} " \
            "--k {wildcards.k} " \
            "--prior {wildcards.prior} " \
            "--beta {wildcards.beta} " \
            "--filename {output.adjmat} " 

    if algorithm == "hc":
        return "/usr/bin/time -f \"%e\" -o {output.time} " \  
            "Rscript workflow/scripts/run_hc.R " \
            "--filename_data {input.data} " \
            "--output_dir {wildcards.output_dir} " \
            "--perturb {wildcards.perturb} " \
            "--restart {wildcards.restart} " \
            "--score {wildcards.score} " \
            "--iss {wildcards.iss} " \
            "--iss.mu {wildcards.issmu} " \
            "--l {wildcards.l} " \
            "--k {wildcards.k} " \
            "--prior {wildcards.prior} " \
            "--beta {wildcards.beta} " \
            "--filename {output.adjmat} " 

    elif algorithm == "blip":
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
                
    elif algorithm == "itsearch":
        return "/usr/bin/time -f \"%e\" -o {output.time} " \  
                "Rscript workflow/scripts/run_iterative_search.R "\
                "--filename_data {input.data} "\
                "--filename {output.adjmat} " \
                "--output_dir {wildcards.output_dir} "\
                "--seed {wildcards.replicate} "\
                "--map {wildcards.MAP} "\
                "--scoretype {wildcards.scoretype} " \
                "--chi {wildcards.chi} " \
                "--edgepf {wildcards.edgepf} " \
                "--am {wildcards.am} " \
                "--aw {wildcards.aw} " \
                "--plus1it {wildcards.plus1it} " \
                "--posterior {wildcards.posterior} " \
                "--title itsearch"

    elif algorithm == "pcalg":
        return  "/usr/bin/time -f \"%e\" -o {output.time} " \  
                "Rscript workflow/scripts/run_pcalg.R " \
                "--filename_data {input.data} "\
                "--alpha {wildcards.alpha} "\
                "--NAdelete {wildcards.NAdelete} "\
                "--mmax {wildcards.mmax} "\
                "--u2pd {wildcards.u2pd} "\
                "--skelmethod {wildcards.skelmethod} "\
                "--output_dir {wildcards.output_dir} "\
                "--seed {wildcards.replicate} "\
                "--filename {output.adjmat} "

    elif algorithm == "mmhc":
        return  "/usr/bin/time -f \"%e\" -o {output.time} " \  
                "Rscript workflow/scripts/run_mmhc.R "\
                "--filename_data {input.data} "\
                "--alpha {wildcards.alpha} "\
                "--output_dir {wildcards.output_dir} "\
                "--seed {wildcards.replicate} "\
                "--filename {output.adjmat} "

    elif algorithm == "h2pc":
        return  "/usr/bin/time -f \"%e\" -o {output.time} " \  
                "Rscript workflow/scripts/run_h2pc.R "\
                "--filename_data {input.data} "\
                "--alpha {wildcards.alpha} "\
                "--output_dir {wildcards.output_dir} "\
                "--seed {wildcards.replicate} "\
                "--filename {output.adjmat} "

    elif algorithm == "interiamb":
        return  "/usr/bin/time -f \"%e\" -o {output.time} " \  
                "Rscript workflow/scripts/run_inter-iamb.R "\
                "--filename_data {input.data} "\
                "--alpha {wildcards.alpha} "\
                "--output_dir {wildcards.output_dir} "\
                "--seed {wildcards.replicate} "\
                "--filename {output.adjmat} "

    elif algorithm == "gs":
        return  "/usr/bin/time -f \"%e\" -o {output.time} " \  
                "Rscript workflow/scripts/run_gs.R "\
                "--filename_data {input.data} "\
                "--alpha {wildcards.alpha} "\
                "--output_dir {wildcards.output_dir} "\
                "--seed {wildcards.replicate} "\
                "--filename {output.adjmat} "

    elif algorithm == "gobnilp":
        return "touch {output.adjmat}.gobnilp.set && " \   
                "echo 'gobnilp/outputfile/adjacencymatrix = \"{output.adjmat}.bn.mat\" ' > {output.adjmat}.gobnilp.set &&" \
                "echo 'gobnilp/outputfile/scoreandtime = \"{output.adjmat}.score_and_time.txt\" ' >> {output.adjmat}.gobnilp.set &&" \
                "echo 'gobnilp/scoring/palim = {wildcards.palim} ' >> {output.adjmat}.gobnilp.set && " \     
                "echo 'gobnilp/scoring/alpha = {wildcards.alpha} ' >> {output.adjmat}.gobnilp.set && " \
                "echo 'gobnilp/scoring/prune = {wildcards.prune} ' >> {output.adjmat}.gobnilp.set && " \     
                "/myappdir/gobnilp163/bin/gobnilp -f=dat -g={output.adjmat}.gobnilp.set {input.data} " \
                " && cat {output.adjmat}.bn.mat > {output.adjmat} " \
                " && cat {output.adjmat}.score_and_time.txt > {output.time} " \ 
                " && rm {output.adjmat}.bn.mat " \
                " && rm {output.adjmat}.score_and_time.txt " \
                " && rm {output.adjmat}.gobnilp.set"

    elif algorithm ==  "fges":
        return "/usr/bin/time -f \"%e\" -o {output.time} " \  
                "java -jar workflow/scripts/tetrad/causal-cmd-1.1.3-jar-with-dependencies.jar " \
                "--algorithm fges "\
                "--data-type {wildcards.datatype} "\
                "--dataset {input.data} "\
                "--delimiter space " \
                "--score {wildcards.score} "\
                "--json-graph "\
                "--structurePrior {wildcards.structurePrior} " \
                "--samplePrior {wildcards.samplePrior} " \
                "--prefix {output.adjmat} " \
                '&& Rscript workflow/scripts/tetrad_graph_to_adjmat.R ' \
                '--jsongraph {output.adjmat}_graph.json ' \
                '--filename {output.adjmat} ' \
                '&& ' \
                'rm {output.adjmat}_graph.json ' \
                '&& ' \
                'rm {output.adjmat}.txt'

    elif algorithm ==  "fci":
        return "/usr/bin/time -f \"%e\" -o {output.time} " \  
                "java -jar workflow/scripts/tetrad/causal-cmd-1.1.3-jar-with-dependencies.jar " \
                "--algorithm fci "\
                "--data-type {wildcards.datatype} "\
                "--dataset {input.data} "\
                "--delimiter space " \
                "--test {wildcards.test} "\
                "--alpha {wildcards.alpha} "\
                "--json-graph "\                
                "--prefix {output.adjmat} " \
                '&& Rscript workflow/scripts/tetrad_graph_to_adjmat.R ' \
                '--jsongraph {output.adjmat}_graph.json ' \
                '--filename {output.adjmat} ' \
                '&& ' \
                'rm {output.adjmat}_graph.json ' \
                '&& ' \
                'rm {output.adjmat}.txt'
                
    elif algorithm ==  "gfci":
        return "/usr/bin/time -f \"%e\" -o {output.time} " \  
                "java -jar workflow/scripts/tetrad/causal-cmd-1.1.3-jar-with-dependencies.jar " \
                "--algorithm gfci "\
                "--data-type {wildcards.datatype} "\
                "--dataset {input.data} "\
                "--delimiter space " \
                "--test {wildcards.test} "\
                "--alpha {wildcards.alpha} "\
                "--score {wildcards.score} "\
                "--structurePrior 1 "\
                "--json-graph "\ 
                "--prefix {output.adjmat} " \
                '&& Rscript workflow/scripts/tetrad_graph_to_adjmat.R ' \
                '--jsongraph {output.adjmat}_graph.json ' \
                '--filename {output.adjmat} ' \
                '&& ' \
                'rm {output.adjmat}_graph.json ' \
                '&& ' \
                'rm {output.adjmat}.txt'

    elif algorithm ==  "rfci":
        return "/usr/bin/time -f \"%e\" -o {output.time} " \  
                "java -jar workflow/scripts/tetrad/causal-cmd-1.1.3-jar-with-dependencies.jar " \
                "--algorithm rfci "\
                "--data-type {wildcards.datatype} "\
                "--dataset {input.data} "\
                "--delimiter space " \
                "--test {wildcards.test} "\
                "--alpha {wildcards.alpha} "\
                "--json-graph "\                
                "--prefix {output.adjmat} " \
                '&& Rscript workflow/scripts/tetrad_graph_to_adjmat.R ' \
                '--jsongraph {output.adjmat}_graph.json ' \
                '--filename {output.adjmat} ' \
                '&& ' \
                'rm {output.adjmat}_graph.json ' \
                '&& ' \
                'rm {output.adjmat}.txt'

    elif algorithm == "order_mcmc":
        return "/usr/bin/time -f \"%e\" -o {output.time} " \  
                "Rscript workflow/scripts/run_order_mcmc.R " \
                "--filename {output.adjvecs} " \
                "--filename_data {input.data} " \
                "--filename_startspace {input.startspace} " \   
                "--scoretype {wildcards.scoretype} " \
                "--chi {wildcards.chi} " \
                "--edgepf {wildcards.edgepf} " \
                "--aw {wildcards.aw} " \
                "--am {wildcards.am} " \
                "--output_dir {wildcards.output_dir} " \
                "--seed {wildcards.replicate} "

    elif algorithm == "trilearn_loglin":
        return "cp {input} {input}.tmp.csv " \
                "&& sed --in-place 's/\ /,/g' {input.data}.tmp.csv " \
                "&& pgibbs_loglinear_sample -N {wildcards.N} -M {wildcards.M} -f {input.data}.tmp.csv -o . -F {output.adjvecs} " \
                "&& rm {input.data}.tmp.csv " \
                "&& echo '1' > {output.time} "
