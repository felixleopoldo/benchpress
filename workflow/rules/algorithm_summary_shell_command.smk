# This file contains the shell commands from each structure learning for saving 
# its benchmarks in a csv file along with the parameter setings.

def dict_to_summary(d):
    s = ""
    for key, val in d.items():
        s += " && python workflow/scripts/utils/add_column.py --filename {output} --colname "+key+" --colval {wildcards."+key+"} "
    ret = sep.join([key+"={"+key+"}" for key,val in c.items()])
    return ret

def summarise_alg_shell(algorithm):
    if algorithm == "gt13_multipair":
        return  "Rscript workflow/scripts/evaluation/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output.res} " \ 
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname replicate       --colval {wildcards.replicate} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname algorithm       --colval gt13_multipair " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \       
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} "  \       
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \       
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname n_samples       --colval {wildcards.n_samples} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname randomits       --colval {wildcards.randomits} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname penalty         --colval {wildcards.penalty} " \ 
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname prior           --colval {wildcards.prior} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname ascore          --colval {wildcards.ascore} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname bscore          --colval {wildcards.bscore} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname clq             --colval {wildcards.clq} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname sep             --colval {wildcards.sep} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname mcmc_seed       --colval {wildcards.mcmc_seed} " \               
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname datatype       --colval {wildcards.datatype} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname timeout       --colval {wildcards.timeout} " \               
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname time            --colval `cat {input.time}` " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname ntests             --colval None " \

    elif algorithm == "gg99_singlepair":
        return  "Rscript workflow/scripts/evaluation/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output.res} " \ 
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname replicate       --colval {wildcards.replicate} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname algorithm       --colval gg99_singlepair " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \       
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} "  \       
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \       
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname n_samples       --colval {wildcards.n_samples} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname randomits       --colval {wildcards.randomits} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname penalty         --colval {wildcards.penalty} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname prior           --colval {wildcards.prior} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname ascore          --colval {wildcards.ascore} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname bscore          --colval {wildcards.bscore} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname clq             --colval {wildcards.clq} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname sep             --colval {wildcards.sep} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname mcmc_seed       --colval {wildcards.mcmc_seed} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname datatype       --colval {wildcards.datatype} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname timeout       --colval {wildcards.timeout} " \               
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname time            --colval `cat {input.time}` " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname ntests             --colval None " \

    elif algorithm == "bnlearn_tabu":
        return  "Rscript workflow/scripts/evaluation/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output.res} " \ 
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname replicate       --colval {wildcards.replicate} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname algorithm       --colval bnlearn_tabu " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \       
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} "  \       
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \       
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname score           --colval {wildcards.score} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname iss             --colval {wildcards.iss} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname issmu          --colval {wildcards.issmu} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname issw          --colval {wildcards.issw} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname l               --colval {wildcards.l} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname k               --colval {wildcards.k} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname prior           --colval {wildcards.prior} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname beta            --colval {wildcards.beta} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname start           --colval null " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname whitelist       --colval null " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname blacklist       --colval null " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname debug           --colval false " \ 
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname tabu            --colval 10 " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname maxtabu        --colval tabu " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname maxiter        --colval Inf " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname maxp            --colval Inf " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname optimized       --colval true " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname timeout       --colval {wildcards.timeout} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname time            --colval `cat {input.time}` " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname ntests             --colval `cat {input.ntests}` " \

    elif algorithm == "notears":
        return  "Rscript workflow/scripts/evaluation/run_summarise.R " \
        "--adjmat_true {input.adjmat_true} " \
        "--adjmat_est {input.adjmat_est} " \
        "--filename {output.res} " \ 
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname replicate       --colval {wildcards.replicate} " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname algorithm       --colval notears " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \       
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} "  \       
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \       
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname min_rate_of_progress        --colval {wildcards.min_rate_of_progress} " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname penalty_growth_rate        --colval {wildcards.penalty_growth_rate} " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname optimation_accuracy         --colval {wildcards.optimation_accuracy} " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname loss                        --colval {wildcards.loss} " \ 
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname loss_grad           --colval {wildcards.loss_grad} " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname timeout       --colval {wildcards.timeout} "\
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname time            --colval `cat {input.time}` " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname ntests             --colval None " \

    elif algorithm == "sklearn_glasso":
        return  "Rscript workflow/scripts/evaluation/run_summarise.R " \
        "--adjmat_true {input.adjmat_true} " \
        "--adjmat_est {input.adjmat_est} " \
        "--filename {output.res} " \ 
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname replicate       --colval {wildcards.replicate} " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname algorithm       --colval sklearn_glasso " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \       
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} "  \       
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \       
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname alpha           --colval {wildcards.alpha} " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname mode            --colval {wildcards.mode} " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname tol             --colval {wildcards.tol} " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname enet_tol        --colval {wildcards.enet_tol} " \ 
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname verbose         --colval {wildcards.verbose} " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname precmat_threshold        --colval {wildcards.precmat_threshold} " \ 
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname assume_centered --colval {wildcards.assume_centered} " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname timeout       --colval {wildcards.timeout} "\
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname time            --colval `cat {input.time}` " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname ntests             --colval None " \

    if algorithm == "bnlearn_hc":
        return  "Rscript workflow/scripts/evaluation/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output.res} " \ 
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname replicate       --colval {wildcards.replicate} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname algorithm       --colval bnlearn_hc " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \       
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} "  \       
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \       
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname score           --colval {wildcards.score} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname iss             --colval {wildcards.iss} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname issmu          --colval {wildcards.issmu} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname issw          --colval {wildcards.issw} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname l               --colval {wildcards.l} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname k               --colval {wildcards.k} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname prior           --colval {wildcards.prior} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname beta            --colval {wildcards.beta} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname start           --colval null " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname whitelist       --colval null " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname blacklist       --colval null " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname debug           --colval false " \ 
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname perturb         --colval {wildcards.perturb} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname restart         --colval {wildcards.restart} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname maxiter        --colval Inf " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname maxp            --colval Inf " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname optimized       --colval true " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname timeout       --colval {wildcards.timeout} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname time            --colval `cat {input.time}` " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname ntests             --colval `cat {input.ntests}` " \


    elif algorithm == "rblip_asobs":
        return "Rscript workflow/scripts/evaluation/run_summarise.R " \
        "--adjmat_true {input.adjmat_true} " \
        "--adjmat_est {input.adjmat_est} " \
        "--filename {output.res} " \ 
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname replicate       --colval {wildcards.replicate} " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname algorithm       --colval rblip_asobs " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \       
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} "  \       
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \       
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname timeout            --colval {wildcards.timeout} " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname scorermethod   --colval {wildcards.scorermethod} " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname solvermethod   --colval {wildcards.solvermethod} " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname indeg           --colval {wildcards.indeg} " \ 
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname cores           --colval {wildcards.cores} " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname allocated       --colval {wildcards.allocated} " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname scorefunction   --colval {wildcards.scorefunction} " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname alpha           --colval {wildcards.alpha} " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname verbose_level         --colval {wildcards.verbose_level} " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname time            --colval `cat {input.time}` " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname ntests             --colval None " \


    elif algorithm == "bidag_itsearch":
        return "Rscript workflow/scripts/evaluation/run_summarise.R " \
        "--adjmat_true {input.adjmat_true} " \
        "--adjmat_est {input.adjmat_est} " \
        "--filename {output} " \ 
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname replicate     --colval {wildcards.replicate} "\
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname algorithm     --colval bidag_itsearch "\
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \       
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} "  \       
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname plus1it       --colval {wildcards.plus1it} " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname moveprobs     --colval null " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname MAP           --colval {wildcards.MAP} " \            
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname posterior     --colval {wildcards.posterior} " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname iterations    --colval null " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname stepsave      --colval null " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname softlimit     --colval {wildcards.softlimit} " \ 
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname hardlimit     --colval {wildcards.hardlimit} " \ 
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname alpha         --colval {wildcards.alpha} " \ 
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname gamma         --colval {wildcards.gamma}  " \ 
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname startspace    --colval null " \ 
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname blacklist     --colval null " \ 
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname verbose       --colval true " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname chainout      --colval true " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname scoreout      --colval true " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname cpdag         --colval {wildcards.cpdag} " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname mergetype     --colval {wildcards.mergetype} " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname addspace      --colval null " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname scoretable    --colval null " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname startorder    --colval null " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname estimate          --colval {wildcards.estimate} " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname scoretype    --colval {wildcards.scoretype} " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname chi          --colval {wildcards.chi} " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname edgepf       --colval {wildcards.edgepf} " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname am           --colval {wildcards.am} " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname aw           --colval {wildcards.aw} " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname timeout      --colval {wildcards.timeout} " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname time         --colval `cat {input.time}` "  \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname ntests             --colval None " \

    elif algorithm == "pcalg_pc":
        return "Rscript workflow/scripts/evaluation/run_summarise.R " \
        "--adjmat_true {input.adjmat_true} " \
        "--adjmat_est {input.adjmat_est} " \
        "--filename {output} " \ 
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname algorithm   --colval pcalg_pc "\
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \       
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} "  \       
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \       
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname alpha       --colval {wildcards.alpha} "\
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname fixedGaps   --colval null " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname fixedEdges  --colval null " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname NAdelete    --colval {wildcards.NAdelete} " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname mmax       --colval {wildcards.mmax} " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname conservative --colval {wildcards.conservative} " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname majrule     --colval {wildcards.majrule} " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname solveconfl  --colval {wildcards.solveconfl} " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname numCores     --colval {wildcards.numCores} " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname verbose      --colval {wildcards.verbose} " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname timeout       --colval {wildcards.timeout} "\
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname time          --colval `cat {input.time}` "  \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname ntests             --colval None " \

    elif algorithm == "giudice_dualpc":
        return "Rscript workflow/scripts/evaluation/run_summarise.R " \
        "--adjmat_true {input.adjmat_true} " \
        "--adjmat_est {input.adjmat_est} " \
        "--filename {output} " \ 
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname algorithm   --colval "+algorithm+" "\
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \       
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} "  \       
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \       
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname alpha       --colval {wildcards.alpha} "\
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname max_ord       --colval {wildcards.max_ord} " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname skeleton  --colval {wildcards.skeleton} " \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname timeout       --colval {wildcards.timeout} "\
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname time          --colval `cat {input.time}` "  \
        " && python workflow/scripts/utils/add_column.py --filename {output} --colname ntests             --colval None " \

    elif algorithm == "bnlearn_mmhc":
        return  "Rscript workflow/scripts/evaluation/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output} " \ 
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname algorithm   --colval bnlearn_mmhc "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \       
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} "  \       
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \       
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname alpha       --colval {wildcards.alpha} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname test       --colval {wildcards.test} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname score           --colval {wildcards.score} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname iss             --colval {wildcards.iss} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname issmu          --colval {wildcards.issmu} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname issw          --colval {wildcards.issw} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname l               --colval {wildcards.l} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname k               --colval {wildcards.k} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname prior           --colval {wildcards.prior} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname beta            --colval {wildcards.beta} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname whitelist   --colval null " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname debug       --colval false " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname maximizeargs   --colval null " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname timeout       --colval {wildcards.timeout} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname time          --colval `cat {input.time}` " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname ntests             --colval `cat {input.ntests}` " \

    elif algorithm == "bnlearn_h2pc":
        return  "Rscript workflow/scripts/evaluation/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output} " \ 
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname algorithm   --colval " + algorithm +" "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \       
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} "  \       
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \       
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname alpha       --colval {wildcards.alpha} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname test       --colval {wildcards.test} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname score           --colval {wildcards.score} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname iss             --colval {wildcards.iss} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname issmu          --colval {wildcards.issmu} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname issw          --colval {wildcards.issw} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname l               --colval {wildcards.l} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname k               --colval {wildcards.k} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname prior           --colval {wildcards.prior} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname beta            --colval {wildcards.beta} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname whitelist   --colval null " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname debug       --colval false " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname maximizeargs   --colval null " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname timeout       --colval {wildcards.timeout} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname time          --colval `cat {input.time}` " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname ntests             --colval `cat {input.ntests}` " \

    elif algorithm == "bnlearn_rsmax2":
        return  "Rscript workflow/scripts/evaluation/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output} " \ 
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname algorithm   --colval " + algorithm +" "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \       
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} "  \       
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \       
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname alpha       --colval {wildcards.alpha} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname test       --colval {wildcards.test} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname score           --colval {wildcards.score} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname iss             --colval {wildcards.iss} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname issmu          --colval {wildcards.issmu} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname issw          --colval {wildcards.issw} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname l               --colval {wildcards.l} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname k               --colval {wildcards.k} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname prior           --colval {wildcards.prior} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname beta            --colval {wildcards.beta} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname whitelist   --colval null " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname debug       --colval false " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname maximizeargs   --colval null " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname timeout       --colval {wildcards.timeout} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname time          --colval `cat {input.time}` " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname ntests             --colval `cat {input.ntests}` " \

    elif algorithm == "bnlearn_interiamb":
        return  "Rscript workflow/scripts/evaluation/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output} " \ 
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname replicate        --colval {wildcards.replicate} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname algorithm        --colval bnlearn_interiamb "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname adjmat           --colval {wildcards.adjmat} "  \       
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname bn               --colval {wildcards.bn} "  \       
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname data             --colval {wildcards.data} "  \       
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname alpha            --colval {wildcards.alpha} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname cluster          --colval null " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname whitelist        --colval null " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname blacklist        --colval null " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname test             --colval {wildcards.test} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname B                --colval {wildcards.B} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname debug            --colval {wildcards.debug} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname maxsx           --colval {wildcards.maxsx} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname undirected       --colval {wildcards.undirected} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname timeout       --colval {wildcards.timeout} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname time             --colval `cat {input.time}` " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname ntests             --colval `cat {input.ntests}` " \

                
    elif algorithm == "bnlearn_gs":
        return  "Rscript workflow/scripts/evaluation/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output} " \ 
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname replicate        --colval {wildcards.replicate} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname algorithm        --colval " +algorithm+" "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname adjmat           --colval {wildcards.adjmat} "  \       
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname bn               --colval {wildcards.bn} "  \       
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname data             --colval {wildcards.data} "  \       
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname alpha            --colval {wildcards.alpha} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname cluster          --colval null " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname whitelist        --colval null " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname blacklist        --colval null " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname test             --colval {wildcards.test} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname B                --colval {wildcards.B} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname debug            --colval {wildcards.debug} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname maxsx           --colval {wildcards.maxsx} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname undirected       --colval {wildcards.undirected} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname timeout       --colval {wildcards.timeout} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname time             --colval `cat {input.time}` " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname ntests             --colval `cat {input.ntests}` " \

    elif algorithm == "bnlearn_pcstable":
        return  "Rscript workflow/scripts/evaluation/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output} " \ 
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname replicate        --colval {wildcards.replicate} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname algorithm        --colval " +algorithm+" "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname adjmat           --colval {wildcards.adjmat} "  \       
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname bn               --colval {wildcards.bn} "  \       
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname data             --colval {wildcards.data} "  \       
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname alpha            --colval {wildcards.alpha} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname cluster          --colval null " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname whitelist        --colval null " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname blacklist        --colval null " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname test             --colval {wildcards.test} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname B                --colval {wildcards.B} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname debug            --colval {wildcards.debug} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname maxsx           --colval {wildcards.maxsx} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname undirected       --colval {wildcards.undirected} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname timeout       --colval {wildcards.timeout} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname time             --colval `cat {input.time}` " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname ntests             --colval `cat {input.ntests}` " \

    elif algorithm == "bnlearn_iamb":
        return  "Rscript workflow/scripts/evaluation/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output} " \ 
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname replicate        --colval {wildcards.replicate} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname algorithm        --colval " +algorithm+" "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname adjmat           --colval {wildcards.adjmat} "  \       
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname bn               --colval {wildcards.bn} "  \       
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname data             --colval {wildcards.data} "  \       
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname alpha            --colval {wildcards.alpha} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname cluster          --colval null " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname whitelist        --colval null " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname blacklist        --colval null " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname test             --colval {wildcards.test} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname B                --colval {wildcards.B} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname debug            --colval {wildcards.debug} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname maxsx           --colval {wildcards.maxsx} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname undirected       --colval {wildcards.undirected} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname timeout       --colval {wildcards.timeout} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname time             --colval `cat {input.time}` " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname ntests             --colval `cat {input.ntests}` " \

    elif algorithm == "bnlearn_fastiamb":
        return  "Rscript workflow/scripts/evaluation/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output} " \ 
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname replicate        --colval {wildcards.replicate} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname algorithm        --colval " +algorithm+" "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname adjmat           --colval {wildcards.adjmat} "  \       
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname bn               --colval {wildcards.bn} "  \       
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname data             --colval {wildcards.data} "  \       
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname alpha            --colval {wildcards.alpha} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname cluster          --colval null " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname whitelist        --colval null " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname blacklist        --colval null " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname test             --colval {wildcards.test} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname B                --colval {wildcards.B} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname debug            --colval {wildcards.debug} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname maxsx           --colval {wildcards.maxsx} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname undirected       --colval {wildcards.undirected} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname timeout       --colval {wildcards.timeout} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname time             --colval `cat {input.time}` " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname ntests             --colval `cat {input.ntests}` " \

    elif algorithm == "bnlearn_iambfdr":
        return  "Rscript workflow/scripts/evaluation/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output} " \ 
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname replicate        --colval {wildcards.replicate} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname algorithm        --colval " +algorithm+" "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname adjmat           --colval {wildcards.adjmat} "  \       
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname bn               --colval {wildcards.bn} "  \       
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname data             --colval {wildcards.data} "  \       
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname alpha            --colval {wildcards.alpha} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname cluster          --colval null " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname whitelist        --colval null " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname blacklist        --colval null " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname test             --colval {wildcards.test} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname B                --colval {wildcards.B} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname debug            --colval {wildcards.debug} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname maxsx           --colval {wildcards.maxsx} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname undirected       --colval {wildcards.undirected} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname timeout       --colval {wildcards.timeout} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname time             --colval `cat {input.time}` " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname ntests             --colval `cat {input.ntests}` " \

    elif algorithm == "bnlearn_mmpc":
        return  "Rscript workflow/scripts/evaluation/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output} " \ 
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname replicate        --colval {wildcards.replicate} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname algorithm        --colval " +algorithm+" "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname adjmat           --colval {wildcards.adjmat} "  \       
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname bn               --colval {wildcards.bn} "  \       
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname data             --colval {wildcards.data} "  \       
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname alpha            --colval {wildcards.alpha} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname cluster          --colval null " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname whitelist        --colval null " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname blacklist        --colval null " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname test             --colval {wildcards.test} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname B                --colval {wildcards.B} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname debug            --colval {wildcards.debug} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname maxsx           --colval {wildcards.maxsx} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname undirected       --colval {wildcards.undirected} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname timeout       --colval {wildcards.timeout} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname time             --colval `cat {input.time}` " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname ntests             --colval `cat {input.ntests}` " \

    elif algorithm == "bnlearn_sihitonpc":
        return  "Rscript workflow/scripts/evaluation/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output} " \ 
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname replicate        --colval {wildcards.replicate} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname algorithm        --colval " +algorithm+" "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname adjmat           --colval {wildcards.adjmat} "  \       
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname bn               --colval {wildcards.bn} "  \       
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname data             --colval {wildcards.data} "  \       
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname alpha            --colval {wildcards.alpha} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname cluster          --colval null " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname whitelist        --colval null " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname blacklist        --colval null " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname test             --colval {wildcards.test} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname B                --colval {wildcards.B} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname debug            --colval {wildcards.debug} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname maxsx           --colval {wildcards.maxsx} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname undirected       --colval {wildcards.undirected} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname timeout       --colval {wildcards.timeout} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname time             --colval `cat {input.time}` " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname ntests             --colval `cat {input.ntests}` " \

    elif algorithm == "bnlearn_hpc":
        return  "Rscript workflow/scripts/evaluation/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output} " \ 
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname replicate        --colval {wildcards.replicate} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname algorithm        --colval " +algorithm+" "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname adjmat           --colval {wildcards.adjmat} "  \       
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname bn               --colval {wildcards.bn} "  \       
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname data             --colval {wildcards.data} "  \       
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname alpha            --colval {wildcards.alpha} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname cluster          --colval null " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname whitelist        --colval null " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname blacklist        --colval null " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname test             --colval {wildcards.test} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname B                --colval {wildcards.B} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname debug            --colval {wildcards.debug} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname maxsx           --colval {wildcards.maxsx} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname undirected       --colval {wildcards.undirected} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname timeout       --colval {wildcards.timeout} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname time             --colval `cat {input.time}` " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname ntests             --colval `cat {input.ntests}` " \

    elif algorithm == "tetrad_fges":
        return  "Rscript workflow/scripts/evaluation/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output.res} " \ 
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname algorithm   --colval tetrad_fges "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname adjmat           --colval {wildcards.adjmat} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname data           --colval {wildcards.data} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname faithfulnessAssumed       --colval {wildcards.faithfulnessAssumed} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname samplePrior       --colval {wildcards.samplePrior} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname structurePrior       --colval {wildcards.structurePrior} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname penaltyDiscount       --colval {wildcards.penaltyDiscount} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname timeout       --colval {wildcards.timeout} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname time        --colval `cat {input.time}` " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname ntests             --colval None " \


    elif algorithm == "tetrad_fci":
        return  "Rscript workflow/scripts/evaluation/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output.res} " \ 
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname algorithm   --colval tetrad_fci "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname adjmat           --colval {wildcards.adjmat} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname data           --colval {wildcards.data} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname alpha       --colval {wildcards.alpha} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname test       --colval {wildcards.test} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname timeout       --colval {wildcards.timeout} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname time        --colval `cat {input.time}` " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname ntests             --colval None " \


    elif algorithm == "tetrad_gfci":
        return  "Rscript workflow/scripts/evaluation/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output.res} " \ 
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname algorithm   --colval tetrad_gfci "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname adjmat           --colval {wildcards.adjmat} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname data           --colval {wildcards.data} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname alpha       --colval {wildcards.alpha} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname score       --colval {wildcards.score} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname test       --colval {wildcards.test} "\      
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname timeout       --colval {wildcards.timeout} "\          
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname time        --colval `cat {input.time}` " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname penaltyDiscount       --colval {wildcards.penaltyDiscount} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname samplePrior       --colval {wildcards.samplePrior} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname structurePrior       --colval {wildcards.structurePrior} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname ntests             --colval None " \

    elif algorithm == "tetrad_rfci":
        return  "Rscript workflow/scripts/evaluation/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output.res} " \ 
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname algorithm   --colval tetrad_rfci "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname adjmat           --colval {wildcards.adjmat} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname data           --colval {wildcards.data} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname alpha       --colval {wildcards.alpha} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname test       --colval {wildcards.test} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname timeout       --colval {wildcards.timeout} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname time        --colval `cat {input.time}` " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname ntests             --colval None " \

    elif algorithm=="gobnilp":
        return  "Rscript workflow/scripts/evaluation/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output.res} " \ 
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname algorithm   --colval gobnilp "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \       
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} "  \       
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname palim       --colval {wildcards.palim} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname alpha_mu       --colval {wildcards.alpha_mu} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname alpha_omega_minus_nvars       --colval {wildcards.alpha_omega_minus_nvars} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname alpha       --colval {wildcards.alpha} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname continuous       --colval {wildcards.continuous} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname score_type       --colval {wildcards.score_type} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname time_limit       --colval {wildcards.time_limit} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname gap_limit       --colval {wildcards.gap_limit} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname prune       --colval {wildcards.prune} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname timeout       --colval {wildcards.timeout} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname constraints       --colval {wildcards.constraints} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname extra_args       --colval {wildcards.extra_args} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname time        --colval `cat {input.time}` " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname ntests             --colval None " \

    elif algorithm == "trilearn_pgibbs":
        return "Rscript workflow/scripts/evaluation/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output} " \ 
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname algorithm   --colval trilearn_pgibbs "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname adjmat      --colval {wildcards.adjmat} "  \       
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname bn          --colval {wildcards.bn} "  \       
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname data        --colval {wildcards.data} "  \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname alpha       --colval {wildcards.alpha} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname beta        --colval {wildcards.beta} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname radii       --colval {wildcards.radii} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname n_particles           --colval {wildcards.n_particles} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname M           --colval {wildcards.M} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname pseudo_obs  --colval {wildcards.pseudo_obs} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname alpha       --colval {wildcards.alpha} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname mcmc_seed   --colval {wildcards.mcmc_seed} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname datatype   --colval {wildcards.datatype} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname timeout       --colval {wildcards.timeout} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname time        --colval `cat {input.time}` " \ 
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname ntests             --colval None " \


    elif algorithm == "bidag_order_mcmc":
        return  "Rscript workflow/scripts/evaluation/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output} " \ 
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname algorithm   --colval bidag_order_mcmc "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \       
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} "  \       
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname scoretype    --colval {wildcards.scoretype} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname chi          --colval {wildcards.chi} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname edgepf       --colval {wildcards.edgepf} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname am           --colval {wildcards.am} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname aw           --colval {wildcards.aw} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname map         --colval {wildcards.MAP} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname plus1         --colval {wildcards.plus1} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname blacklist   --colval null "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname startorder  --colval null "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname scoretable  --colval null "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname moveprobs   --colval null "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname iterations  --colval {wildcards.iterations} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname stepsave    --colval {wildcards.stepsave} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname alpha       --colval {wildcards.alpha} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname cpdag       --colval {wildcards.cpdag} "\   
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname gamma       --colval {wildcards.gamma} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname hardlimit   --colval 15 "\      
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname chainout    --colval true "\   
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname scoreout    --colval true "\   
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname verbose     --colval false "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname threshold   --colval {wildcards.threshold} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname startspace_algorithm   --colval {wildcards.startspace_algorithm} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname mcmc_seed   --colval {wildcards.mcmc_seed} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname timeout      --colval {wildcards.timeout} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname time        --colval `cat {input.time}` " \ 
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname ntests             --colval None " \

    elif algorithm == "bidag_partition_mcmc":
        return  "Rscript workflow/scripts/evaluation/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output} " \ 
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname algorithm   --colval bidag_partition_mcmc "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \       
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} "  \       
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname scoretype    --colval {wildcards.scoretype} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname chi          --colval {wildcards.chi} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname edgepf       --colval {wildcards.edgepf} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname am           --colval {wildcards.am} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname aw           --colval {wildcards.aw} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname blacklist   --colval None "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname scoretable  --colval None "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname moveprobs   --colval None "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname startDAG    --colval None "\                
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname iterations  --colval {wildcards.iterations} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname stepsave    --colval {wildcards.stepsave} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname gamma       --colval {wildcards.gamma} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname scoreout    --colval true "\   
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname verbose     --colval {wildcards.verbose} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname startspace_algorithm   --colval {wildcards.startspace_algorithm} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname mcmc_seed   --colval {wildcards.mcmc_seed} "\
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname timeout      --colval {wildcards.timeout} " \
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname time        --colval `cat {input.time}` " \ 
                " && python workflow/scripts/utils/add_column.py --filename {output} --colname ntests             --colval None " \

