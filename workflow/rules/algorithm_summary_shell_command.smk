def summarise_alg_shell(algorithm):
    if algorithm == "greenthomas":
        return  "Rscript workflow/scripts/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename_data {input.data} " \
                "--range_header_data 1 " \ 
                "--filename {output.res} " \ 
                " && python workflow/scripts/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname replicate       --colval {wildcards.replicate} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname algorithm       --colval greenthomas " \
                " && python workflow/scripts/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \       
                " && python workflow/scripts/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} "  \       
                " && python workflow/scripts/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \       
                " && python workflow/scripts/add_column.py --filename {output} --colname n_samples       --colval {wildcards.n_samples} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname randomits       --colval {wildcards.randomits} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname penalty         --colval {wildcards.penalty} " \                
                " && python workflow/scripts/add_column.py --filename {output} --colname time            --colval `cat {input.time}` " \

    elif algorithm == "tabu":
        return  "Rscript workflow/scripts/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename_data {input.data} " \
                "--range_header_data 1 " \ 
                "--filename {output.res} " \ 
                " && python workflow/scripts/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname replicate       --colval {wildcards.replicate} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname algorithm       --colval tabu " \
                " && python workflow/scripts/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \       
                " && python workflow/scripts/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} "  \       
                " && python workflow/scripts/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \       
                " && python workflow/scripts/add_column.py --filename {output} --colname score           --colval {wildcards.score} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname iss             --colval {wildcards.iss} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname issmu          --colval {wildcards.issmu} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname l               --colval {wildcards.l} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname k               --colval {wildcards.k} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname prior           --colval {wildcards.prior} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname beta            --colval {wildcards.beta} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname start           --colval null " \
                " && python workflow/scripts/add_column.py --filename {output} --colname whitelist       --colval null " \
                " && python workflow/scripts/add_column.py --filename {output} --colname blacklist       --colval null " \
                " && python workflow/scripts/add_column.py --filename {output} --colname debug           --colval false " \ 
                " && python workflow/scripts/add_column.py --filename {output} --colname tabu            --colval 10 " \
                " && python workflow/scripts/add_column.py --filename {output} --colname maxtabu        --colval tabu " \
                " && python workflow/scripts/add_column.py --filename {output} --colname maxiter        --colval Inf " \
                " && python workflow/scripts/add_column.py --filename {output} --colname maxp            --colval Inf " \
                " && python workflow/scripts/add_column.py --filename {output} --colname optimized       --colval true " \
                " && python workflow/scripts/add_column.py --filename {output} --colname time            --colval `cat {input.time}` " \


    elif algorithm == "notears":
        return  "Rscript workflow/scripts/run_summarise.R " \
        "--adjmat_true {input.adjmat_true} " \
        "--adjmat_est {input.adjmat_est} " \
        "--filename_data {input.data} " \
        "--range_header_data 1 " \ 
        "--filename {output.res} " \ 
        " && python workflow/scripts/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
        " && python workflow/scripts/add_column.py --filename {output} --colname replicate       --colval {wildcards.replicate} " \
        " && python workflow/scripts/add_column.py --filename {output} --colname algorithm       --colval notears " \
        " && python workflow/scripts/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \       
        " && python workflow/scripts/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} "  \       
        " && python workflow/scripts/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \       
        " && python workflow/scripts/add_column.py --filename {output} --colname min_rate_of_progress        --colval {wildcards.min_rate_of_progress} " \
        " && python workflow/scripts/add_column.py --filename {output} --colname penalty_growth_rate        --colval {wildcards.penalty_growth_rate} " \
        " && python workflow/scripts/add_column.py --filename {output} --colname optimation_accuracy         --colval {wildcards.optimation_accuracy} " \
        " && python workflow/scripts/add_column.py --filename {output} --colname loss                        --colval {wildcards.loss} " \ 
        " && python workflow/scripts/add_column.py --filename {output} --colname loss_grad           --colval {wildcards.loss_grad} " \
        " && python workflow/scripts/add_column.py --filename {output} --colname time            --colval `cat {input.time}` " \


    if algorithm == "hc":
        return  "Rscript workflow/scripts/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename_data {input.data} " \
                "--range_header_data 1 " \ 
                "--filename {output.res} " \ 
                " && python workflow/scripts/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname replicate       --colval {wildcards.replicate} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname algorithm       --colval hc " \
                " && python workflow/scripts/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \       
                " && python workflow/scripts/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} "  \       
                " && python workflow/scripts/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \       
                " && python workflow/scripts/add_column.py --filename {output} --colname score           --colval {wildcards.score} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname iss             --colval {wildcards.iss} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname issmu          --colval {wildcards.issmu} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname l               --colval {wildcards.l} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname k               --colval {wildcards.k} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname prior           --colval {wildcards.prior} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname beta            --colval {wildcards.beta} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname start           --colval null " \
                " && python workflow/scripts/add_column.py --filename {output} --colname whitelist       --colval null " \
                " && python workflow/scripts/add_column.py --filename {output} --colname blacklist       --colval null " \
                " && python workflow/scripts/add_column.py --filename {output} --colname debug           --colval false " \ 
                " && python workflow/scripts/add_column.py --filename {output} --colname perturb         --colval {wildcards.perturb} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname restart         --colval {wildcards.restart} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname maxiter        --colval Inf " \
                " && python workflow/scripts/add_column.py --filename {output} --colname maxp            --colval Inf " \
                " && python workflow/scripts/add_column.py --filename {output} --colname optimized       --colval true " \
                " && python workflow/scripts/add_column.py --filename {output} --colname time            --colval `cat {input.time}` " \


    elif algorithm == "blip":
        return "Rscript workflow/scripts/run_summarise.R " \
        "--adjmat_true {input.adjmat_true} " \
        "--adjmat_est {input.adjmat_est} " \
        "--filename_data {input.data} " \
        "--range_header_data 1 " \ 
        "--filename {output.res} " \ 
        " && python workflow/scripts/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
        " && python workflow/scripts/add_column.py --filename {output} --colname replicate       --colval {wildcards.replicate} " \
        " && python workflow/scripts/add_column.py --filename {output} --colname algorithm       --colval blip " \
        " && python workflow/scripts/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \       
        " && python workflow/scripts/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} "  \       
        " && python workflow/scripts/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \       
        " && python workflow/scripts/add_column.py --filename {output} --colname time            --colval {wildcards.time} " \
        " && python workflow/scripts/add_column.py --filename {output} --colname scorermethod   --colval {wildcards.scorermethod} " \
        " && python workflow/scripts/add_column.py --filename {output} --colname solvermethod   --colval {wildcards.solvermethod} " \
        " && python workflow/scripts/add_column.py --filename {output} --colname indeg           --colval {wildcards.indeg} " \ 
        " && python workflow/scripts/add_column.py --filename {output} --colname cores           --colval {wildcards.cores} " \
        " && python workflow/scripts/add_column.py --filename {output} --colname allocated       --colval {wildcards.allocated} " \
        " && python workflow/scripts/add_column.py --filename {output} --colname scorefunction   --colval {wildcards.scorefunction} " \
        " && python workflow/scripts/add_column.py --filename {output} --colname alpha           --colval {wildcards.alpha} " \
        " && python workflow/scripts/add_column.py --filename {output} --colname verbose         --colval {wildcards.verbose} " \
        " && python workflow/scripts/add_column.py --filename {output} --colname totaltime            --colval `cat {input.time}` " \


    elif algorithm == "itsearch":
        return "Rscript workflow/scripts/run_summarise.R " \
        "--adjmat_true {input.adjmat_true} " \
        "--adjmat_est {input.adjmat_est} " \
        "--filename_data {input.data} " \
        "--filename {output} " \ 
        "--range_header_data 1 " \ 
        " && python workflow/scripts/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
        " && python workflow/scripts/add_column.py --filename {output} --colname replicate     --colval {wildcards.replicate} "\
        " && python workflow/scripts/add_column.py --filename {output} --colname algorithm     --colval itsearch "\
        " && python workflow/scripts/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \       
        " && python workflow/scripts/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} "  \       
        " && python workflow/scripts/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \
        " && python workflow/scripts/add_column.py --filename {output} --colname plus1it       --colval {wildcards.plus1it} " \
        " && python workflow/scripts/add_column.py --filename {output} --colname moveprobs     --colval null " \
        " && python workflow/scripts/add_column.py --filename {output} --colname MAP           --colval {wildcards.MAP} " \            
        " && python workflow/scripts/add_column.py --filename {output} --colname posterior     --colval {wildcards.posterior} " \
        " && python workflow/scripts/add_column.py --filename {output} --colname iterations    --colval null " \
        " && python workflow/scripts/add_column.py --filename {output} --colname stepsave      --colval null " \
        " && python workflow/scripts/add_column.py --filename {output} --colname softlimit     --colval {wildcards.softlimit} " \ 
        " && python workflow/scripts/add_column.py --filename {output} --colname hardlimit     --colval {wildcards.hardlimit} " \ 
        " && python workflow/scripts/add_column.py --filename {output} --colname alpha         --colval {wildcards.alpha} " \ 
        " && python workflow/scripts/add_column.py --filename {output} --colname gamma         --colval {wildcards.gamma}  " \ 
        " && python workflow/scripts/add_column.py --filename {output} --colname startspace    --colval null " \ 
        " && python workflow/scripts/add_column.py --filename {output} --colname blacklist     --colval null " \ 
        " && python workflow/scripts/add_column.py --filename {output} --colname verbose       --colval true " \
        " && python workflow/scripts/add_column.py --filename {output} --colname chainout      --colval true " \
        " && python workflow/scripts/add_column.py --filename {output} --colname scoreout      --colval true " \
        " && python workflow/scripts/add_column.py --filename {output} --colname cpdag         --colval {wildcards.cpdag} " \
        " && python workflow/scripts/add_column.py --filename {output} --colname mergetype     --colval {wildcards.mergetype} " \
        " && python workflow/scripts/add_column.py --filename {output} --colname addspace      --colval null " \
        " && python workflow/scripts/add_column.py --filename {output} --colname scoretable    --colval null " \
        " && python workflow/scripts/add_column.py --filename {output} --colname startorder    --colval null " \
        " && python workflow/scripts/add_column.py --filename {output} --colname scoretype    --colval {wildcards.scoretype} " \
        " && python workflow/scripts/add_column.py --filename {output} --colname chi          --colval {wildcards.chi} " \
        " && python workflow/scripts/add_column.py --filename {output} --colname edgepf       --colval {wildcards.edgepf} " \
        " && python workflow/scripts/add_column.py --filename {output} --colname am           --colval {wildcards.am} " \
        " && python workflow/scripts/add_column.py --filename {output} --colname aw           --colval {wildcards.aw} " \
        " && python workflow/scripts/add_column.py --filename {output} --colname time         --colval `cat {input.time}` "  \

    elif algorithm == "pcalg":
        return "Rscript workflow/scripts/run_summarise.R " \
        "--adjmat_true {input.adjmat_true} " \
        "--adjmat_est {input.adjmat_est} " \
        "--filename_data {input.data} " \
        "--filename {output} " \ 
        "--range_header_data 1 " \ 
        " && python workflow/scripts/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
        " && python workflow/scripts/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
        " && python workflow/scripts/add_column.py --filename {output} --colname algorithm   --colval pcalg "\
        " && python workflow/scripts/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \       
        " && python workflow/scripts/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} "  \       
        " && python workflow/scripts/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \       
        " && python workflow/scripts/add_column.py --filename {output} --colname alpha       --colval {wildcards.alpha} "\
        " && python workflow/scripts/add_column.py --filename {output} --colname fixedGaps   --colval null " \
        " && python workflow/scripts/add_column.py --filename {output} --colname fixedEdges  --colval null " \
        " && python workflow/scripts/add_column.py --filename {output} --colname NAdelete    --colval {wildcards.NAdelete} " \
        " && python workflow/scripts/add_column.py --filename {output} --colname mmax       --colval {wildcards.mmax} " \
        " && python workflow/scripts/add_column.py --filename {output} --colname conservative --colval {wildcards.conservative} " \
        " && python workflow/scripts/add_column.py --filename {output} --colname majrule     --colval {wildcards.majrule} " \
        " && python workflow/scripts/add_column.py --filename {output} --colname solveconfl  --colval {wildcards.solveconfl} " \
        " && python workflow/scripts/add_column.py --filename {output} --colname numCores     --colval {wildcards.numCores} " \
        " && python workflow/scripts/add_column.py --filename {output} --colname verbose      --colval {wildcards.verbose} " \
        " && python workflow/scripts/add_column.py --filename {output} --colname time          --colval `cat {input.time}` "  \


    elif algorithm == "mmhc":
        return  "Rscript workflow/scripts/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename_data {input.data} " \
                "--filename {output} " \ 
                "--range_header_data 1 " \ 
                " && python workflow/scripts/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
                " && python workflow/scripts/add_column.py --filename {output} --colname algorithm   --colval mmhc "\
                " && python workflow/scripts/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \       
                " && python workflow/scripts/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} "  \       
                " && python workflow/scripts/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \       
                " && python workflow/scripts/add_column.py --filename {output} --colname alpha       --colval {wildcards.alpha} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname test       --colval {wildcards.test} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname whitelist   --colval null " \
                " && python workflow/scripts/add_column.py --filename {output} --colname debug       --colval false " \
                " && python workflow/scripts/add_column.py --filename {output} --colname maximizeargs   --colval null " \
                " && python workflow/scripts/add_column.py --filename {output} --colname time          --colval `cat {input.time}` " \


    elif algorithm == "h2pc":
        return  "Rscript workflow/scripts/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename_data {input.data} " \
                "--filename {output} " \ 
                "--range_header_data 1 " \ 
                " && python workflow/scripts/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
                " && python workflow/scripts/add_column.py --filename {output} --colname algorithm   --colval h2pc "\
                " && python workflow/scripts/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \       
                " && python workflow/scripts/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} "  \       
                " && python workflow/scripts/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \       
                " && python workflow/scripts/add_column.py --filename {output} --colname alpha       --colval {wildcards.alpha} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname whitelist   --colval null " \
                " && python workflow/scripts/add_column.py --filename {output} --colname debug       --colval false " \
                " && python workflow/scripts/add_column.py --filename {output} --colname maximizeargs   --colval null " \
                " && python workflow/scripts/add_column.py --filename {output} --colname time          --colval `cat {input.time}` " \


    elif algorithm == "interiamb":
        return  "Rscript workflow/scripts/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename_data {input.data} " \
                "--filename {output} " \ 
                "--range_header_data 1 " \ 
                " && python workflow/scripts/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname replicate        --colval {wildcards.replicate} "\
                " && python workflow/scripts/add_column.py --filename {output} --colname algorithm        --colval interiamb "\
                " && python workflow/scripts/add_column.py --filename {output} --colname adjmat           --colval {wildcards.adjmat} "  \       
                " && python workflow/scripts/add_column.py --filename {output} --colname bn               --colval {wildcards.bn} "  \       
                " && python workflow/scripts/add_column.py --filename {output} --colname data             --colval {wildcards.data} "  \       
                " && python workflow/scripts/add_column.py --filename {output} --colname alpha            --colval {wildcards.alpha} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname cluster          --colval null " \
                " && python workflow/scripts/add_column.py --filename {output} --colname whitelist        --colval null " \
                " && python workflow/scripts/add_column.py --filename {output} --colname blacklist        --colval null " \
                " && python workflow/scripts/add_column.py --filename {output} --colname test             --colval {wildcards.test} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname B                --colval {wildcards.B} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname debug            --colval {wildcards.debug} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname maxsx           --colval {wildcards.maxsx} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname undirected       --colval {wildcards.undirected} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname time             --colval `cat {input.time}` " \

                
    elif algorithm == "gs":
        return  "Rscript workflow/scripts/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename_data {input.data} " \
                "--filename {output} " \ 
                "--range_header_data 1 " \ 
                " && python workflow/scripts/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname replicate        --colval {wildcards.replicate} "\
                " && python workflow/scripts/add_column.py --filename {output} --colname algorithm        --colval gs "\
                " && python workflow/scripts/add_column.py --filename {output} --colname adjmat           --colval {wildcards.adjmat} "  \       
                " && python workflow/scripts/add_column.py --filename {output} --colname bn               --colval {wildcards.bn} "  \       
                " && python workflow/scripts/add_column.py --filename {output} --colname data             --colval {wildcards.data} "  \       
                " && python workflow/scripts/add_column.py --filename {output} --colname alpha            --colval {wildcards.alpha} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname cluster          --colval null " \
                " && python workflow/scripts/add_column.py --filename {output} --colname whitelist        --colval null " \
                " && python workflow/scripts/add_column.py --filename {output} --colname blacklist        --colval null " \
                " && python workflow/scripts/add_column.py --filename {output} --colname test             --colval {wildcards.test} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname B                --colval {wildcards.B} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname debug            --colval {wildcards.debug} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname maxsx           --colval {wildcards.maxsx} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname undirected       --colval {wildcards.undirected} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname time             --colval `cat {input.time}` " \

    elif algorithm == "fges":
        return  "Rscript workflow/scripts/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename_data {input.data} " \
                "--filename {output.res} " \ 
                "--range_header_data 1 " \ 
                " && python workflow/scripts/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
                " && python workflow/scripts/add_column.py --filename {output} --colname algorithm   --colval fges "\
                " && python workflow/scripts/add_column.py --filename {output} --colname adjmat           --colval {wildcards.adjmat} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname data           --colval {wildcards.data} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname faithfulnessAssumed       --colval {wildcards.faithfulnessAssumed} "\
                " && python workflow/scripts/add_column.py --filename {output} --colname samplePrior       --colval {wildcards.samplePrior} "\
                " && python workflow/scripts/add_column.py --filename {output} --colname structurePrior       --colval {wildcards.structurePrior} "\
                " && python workflow/scripts/add_column.py --filename {output} --colname time        --colval `cat {input.time}` " \


    elif algorithm == "fci":
        return  "Rscript workflow/scripts/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename_data {input.data} " \
                "--filename {output.res} " \ 
                "--range_header_data 1 " \ 
                " && python workflow/scripts/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
                " && python workflow/scripts/add_column.py --filename {output} --colname algorithm   --colval fci "\
                " && python workflow/scripts/add_column.py --filename {output} --colname adjmat           --colval {wildcards.adjmat} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname data           --colval {wildcards.data} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname alpha       --colval {wildcards.alpha} "\
                " && python workflow/scripts/add_column.py --filename {output} --colname test       --colval {wildcards.test} "\
                " && python workflow/scripts/add_column.py --filename {output} --colname time        --colval `cat {input.time}` " \


    elif algorithm == "gfci":
        return  "Rscript workflow/scripts/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename_data {input.data} " \
                "--filename {output.res} " \ 
                "--range_header_data 1 " \ 
                " && python workflow/scripts/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
                " && python workflow/scripts/add_column.py --filename {output} --colname algorithm   --colval gfci "\
                " && python workflow/scripts/add_column.py --filename {output} --colname adjmat           --colval {wildcards.adjmat} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname data           --colval {wildcards.data} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname alpha       --colval {wildcards.alpha} "\
                " && python workflow/scripts/add_column.py --filename {output} --colname score       --colval {wildcards.score} "\
                " && python workflow/scripts/add_column.py --filename {output} --colname test       --colval {wildcards.test} "\                
                " && python workflow/scripts/add_column.py --filename {output} --colname time        --colval `cat {input.time}` " \

    elif algorithm == "rfci":
        return  "Rscript workflow/scripts/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename_data {input.data} " \
                "--filename {output.res} " \ 
                "--range_header_data 1 " \ 
                " && python workflow/scripts/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
                " && python workflow/scripts/add_column.py --filename {output} --colname algorithm   --colval rfci "\
                " && python workflow/scripts/add_column.py --filename {output} --colname adjmat           --colval {wildcards.adjmat} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname data           --colval {wildcards.data} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname alpha       --colval {wildcards.alpha} "\
                " && python workflow/scripts/add_column.py --filename {output} --colname test       --colval {wildcards.test} "\
                " && python workflow/scripts/add_column.py --filename {output} --colname time        --colval `cat {input.time}` " \

    elif algorithm=="gobnilp":
        return  "Rscript workflow/scripts/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename_data {input.data} " \
                "--filename {output.res} " \ 
                "--range_header_data 1 " \ 
                "--adjmat_header 0 " \ 
                " && python workflow/scripts/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
                " && python workflow/scripts/add_column.py --filename {output} --colname algorithm   --colval gobnilp "\
                " && python workflow/scripts/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \       
                " && python workflow/scripts/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} "  \       
                " && python workflow/scripts/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \
                " && python workflow/scripts/add_column.py --filename {output} --colname palim       --colval {wildcards.palim} "\
                " && python workflow/scripts/add_column.py --filename {output} --colname alpha       --colval {wildcards.alpha} "\
                " && python workflow/scripts/add_column.py --filename {output} --colname prune       --colval {wildcards.prune} "\
                " && python workflow/scripts/add_column.py --filename {output} --colname time        --colval `cat {input.time} | grep -Eo '[0-9]\.[0-9]*$'` " \


    elif algorithm == "trilearn_loglin":
        return "Rscript workflow/scripts/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename_data {input.data} " \
                "--range_header_data 1 " \ 
                "--filename {output} " \ 
                " && python workflow/scripts/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
                " && python workflow/scripts/add_column.py --filename {output} --colname algorithm   --colval trilearn_loglin "\
                " && python workflow/scripts/add_column.py --filename {output} --colname adjmat      --colval {wildcards.adjmat} "  \       
                " && python workflow/scripts/add_column.py --filename {output} --colname bn          --colval {wildcards.bn} "  \       
                " && python workflow/scripts/add_column.py --filename {output} --colname data        --colval {wildcards.data} "  \
                " && python workflow/scripts/add_column.py --filename {output} --colname alpha       --colval {wildcards.alpha} "\
                " && python workflow/scripts/add_column.py --filename {output} --colname beta        --colval {wildcards.beta} "\
                " && python workflow/scripts/add_column.py --filename {output} --colname radii       --colval {wildcards.radii} "\
                " && python workflow/scripts/add_column.py --filename {output} --colname N           --colval {wildcards.N} "\
                " && python workflow/scripts/add_column.py --filename {output} --colname M           --colval {wildcards.M} "\
                " && python workflow/scripts/add_column.py --filename {output} --colname pseudo_obs  --colval {wildcards.pseudo_obs} "\
                " && python workflow/scripts/add_column.py --filename {output} --colname alpha       --colval {wildcards.alpha} "\
                " && python workflow/scripts/add_column.py --filename {output} --colname threshold   --colval {wildcards.threshold} "\
                " && python workflow/scripts/add_column.py --filename {output} --colname time        --colval `cat {input.time}` " \ 


    elif algorithm == "order_mcmc":
        return  "Rscript workflow/scripts/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename_data {input.data} " \
                "--range_header_data 1 " \ 
                "--filename {output} " \ 
                " && python workflow/scripts/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
                " && python workflow/scripts/add_column.py --filename {output} --colname algorithm   --colval orderMCMC "\
                " && python workflow/scripts/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \       
                " && python workflow/scripts/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} "  \       
                " && python workflow/scripts/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \
                " && python workflow/scripts/add_column.py --filename {output} --colname scoretype    --colval {wildcards.scoretype} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname chi          --colval {wildcards.chi} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname edgepf       --colval {wildcards.edgepf} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname am           --colval {wildcards.am} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname aw           --colval {wildcards.aw} " \
                " && python workflow/scripts/add_column.py --filename {output} --colname map         --colval {wildcards.MAP} "\
                " && python workflow/scripts/add_column.py --filename {output} --colname blacklist   --colval null "\
                " && python workflow/scripts/add_column.py --filename {output} --colname startorder  --colval null "\
                " && python workflow/scripts/add_column.py --filename {output} --colname scoretable  --colval null "\
                " && python workflow/scripts/add_column.py --filename {output} --colname moveprobs   --colval null "\
                " && python workflow/scripts/add_column.py --filename {output} --colname iterations  --colval {wildcards.iterations} "\
                " && python workflow/scripts/add_column.py --filename {output} --colname stepsave    --colval {wildcards.stepsave} "\
                " && python workflow/scripts/add_column.py --filename {output} --colname alpha       --colval {wildcards.alpha} "\
                " && python workflow/scripts/add_column.py --filename {output} --colname cpdag       --colval {wildcards.cpdag} "\   
                " && python workflow/scripts/add_column.py --filename {output} --colname gamma       --colval {wildcards.gamma} "\
                " && python workflow/scripts/add_column.py --filename {output} --colname hardlimit   --colval 15 "\      
                " && python workflow/scripts/add_column.py --filename {output} --colname chainout    --colval true "\   
                " && python workflow/scripts/add_column.py --filename {output} --colname scoreout    --colval false "\   
                " && python workflow/scripts/add_column.py --filename {output} --colname verbose     --colval false "\
                " && python workflow/scripts/add_column.py --filename {output} --colname threshold   --colval {wildcards.threshold} "\
                " && python workflow/scripts/add_column.py --filename {output} --colname startspace   --colval {wildcards.startspace_algorithm} "\
                " && python workflow/scripts/add_column.py --filename {output} --colname time        --colval `cat {input.time}` " \ 

