def summarise_alg_shell(algorithm):
    if algorithm == "greenthomas":
        return  "Rscript scripts/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename_data {input.data} " \
                "--range_header_data 1 " \ 
                "--filename {output.res} " \ 
                " && python scripts/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python scripts/add_column.py --filename {output} --colname replicate       --colval {wildcards.replicate} " \
                " && python scripts/add_column.py --filename {output} --colname algorithm       --colval greenthomas " \
                " && python scripts/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \       
                " && python scripts/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} "  \       
                " && python scripts/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \       
                " && python scripts/add_column.py --filename {output} --colname n_samples       --colval {wildcards.n_samples} " \
                " && python scripts/add_column.py --filename {output} --colname randomits       --colval {wildcards.randomits} " \
                " && python scripts/add_column.py --filename {output} --colname penalty         --colval {wildcards.penalty} " \                
                " && python scripts/add_column.py --filename {output} --colname time            --colval `cat {input.time}` " \

    elif algorithm == "tabu":
        return  "Rscript scripts/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename_data {input.data} " \
                "--range_header_data 1 " \ 
                "--filename {output.res} " \ 
                " && python scripts/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python scripts/add_column.py --filename {output} --colname replicate       --colval {wildcards.replicate} " \
                " && python scripts/add_column.py --filename {output} --colname algorithm       --colval tabu " \
                " && python scripts/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \       
                " && python scripts/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} "  \       
                " && python scripts/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \       
                " && python scripts/add_column.py --filename {output} --colname score           --colval {wildcards.score} " \
                " && python scripts/add_column.py --filename {output} --colname iss             --colval {wildcards.iss} " \
                " && python scripts/add_column.py --filename {output} --colname iss.mu          --colval {wildcards.issmu} " \
                " && python scripts/add_column.py --filename {output} --colname l               --colval {wildcards.l} " \
                " && python scripts/add_column.py --filename {output} --colname k               --colval {wildcards.k} " \
                " && python scripts/add_column.py --filename {output} --colname prior           --colval {wildcards.prior} " \
                " && python scripts/add_column.py --filename {output} --colname beta            --colval {wildcards.beta} " \
                " && python scripts/add_column.py --filename {output} --colname start           --colval null " \
                " && python scripts/add_column.py --filename {output} --colname whitelist       --colval null " \
                " && python scripts/add_column.py --filename {output} --colname blacklist       --colval null " \
                " && python scripts/add_column.py --filename {output} --colname debug           --colval false " \ 
                " && python scripts/add_column.py --filename {output} --colname tabu            --colval 10 " \
                " && python scripts/add_column.py --filename {output} --colname max.tabu        --colval tabu " \
                " && python scripts/add_column.py --filename {output} --colname max.iter        --colval Inf " \
                " && python scripts/add_column.py --filename {output} --colname maxp            --colval Inf " \
                " && python scripts/add_column.py --filename {output} --colname optimized       --colval true " \
                " && python scripts/add_column.py --filename {output} --colname time            --colval `cat {input.time}` " \


    elif algorithm == "notears":
        return  "Rscript scripts/run_summarise.R " \
        "--adjmat_true {input.adjmat_true} " \
        "--adjmat_est {input.adjmat_est} " \
        "--filename_data {input.data} " \
        "--range_header_data 1 " \ 
        "--filename {output.res} " \ 
        " && python scripts/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
        " && python scripts/add_column.py --filename {output} --colname replicate       --colval {wildcards.replicate} " \
        " && python scripts/add_column.py --filename {output} --colname algorithm       --colval notears " \
        " && python scripts/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \       
        " && python scripts/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} "  \       
        " && python scripts/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \       
        " && python scripts/add_column.py --filename {output} --colname min_rate_of_progress        --colval {wildcards.min_rate_of_progress} " \
        " && python scripts/add_column.py --filename {output} --colname penalty_growth_rate        --colval {wildcards.penalty_growth_rate} " \
        " && python scripts/add_column.py --filename {output} --colname optimation_accuracy         --colval {wildcards.optimation_accuracy} " \
        " && python scripts/add_column.py --filename {output} --colname loss                        --colval {wildcards.loss} " \ 
        " && python scripts/add_column.py --filename {output} --colname loss_grad           --colval {wildcards.loss_grad} " \
        " && python scripts/add_column.py --filename {output} --colname time            --colval `cat {input.time}` " \


    if algorithm == "hc":
        return  "Rscript scripts/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename_data {input.data} " \
                "--range_header_data 1 " \ 
                "--filename {output.res} " \ 
                " && python scripts/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python scripts/add_column.py --filename {output} --colname replicate       --colval {wildcards.replicate} " \
                " && python scripts/add_column.py --filename {output} --colname algorithm       --colval hc " \
                " && python scripts/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \       
                " && python scripts/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} "  \       
                " && python scripts/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \       
                " && python scripts/add_column.py --filename {output} --colname score           --colval {wildcards.score} " \
                " && python scripts/add_column.py --filename {output} --colname iss             --colval {wildcards.iss} " \
                " && python scripts/add_column.py --filename {output} --colname iss.mu          --colval {wildcards.issmu} " \
                " && python scripts/add_column.py --filename {output} --colname l               --colval {wildcards.l} " \
                " && python scripts/add_column.py --filename {output} --colname k               --colval {wildcards.k} " \
                " && python scripts/add_column.py --filename {output} --colname prior           --colval {wildcards.prior} " \
                " && python scripts/add_column.py --filename {output} --colname beta            --colval {wildcards.beta} " \
                " && python scripts/add_column.py --filename {output} --colname start           --colval null " \
                " && python scripts/add_column.py --filename {output} --colname whitelist       --colval null " \
                " && python scripts/add_column.py --filename {output} --colname blacklist       --colval null " \
                " && python scripts/add_column.py --filename {output} --colname debug           --colval false " \ 
                " && python scripts/add_column.py --filename {output} --colname perturb         --colval {wildcards.perturb} " \
                " && python scripts/add_column.py --filename {output} --colname restart         --colval {wildcards.restart} " \
                " && python scripts/add_column.py --filename {output} --colname max.iter        --colval Inf " \
                " && python scripts/add_column.py --filename {output} --colname maxp            --colval Inf " \
                " && python scripts/add_column.py --filename {output} --colname optimized       --colval true " \
                " && python scripts/add_column.py --filename {output} --colname time            --colval `cat {input.time}` " \


    elif algorithm == "blip":
        return "Rscript scripts/run_summarise.R " \
        "--adjmat_true {input.adjmat_true} " \
        "--adjmat_est {input.adjmat_est} " \
        "--filename_data {input.data} " \
        "--range_header_data 1 " \ 
        "--filename {output.res} " \ 
        " && python scripts/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
        " && python scripts/add_column.py --filename {output} --colname replicate       --colval {wildcards.replicate} " \
        " && python scripts/add_column.py --filename {output} --colname algorithm       --colval blip " \
        " && python scripts/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \       
        " && python scripts/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} "  \       
        " && python scripts/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \       
        " && python scripts/add_column.py --filename {output} --colname time            --colval {wildcards.time} " \
        " && python scripts/add_column.py --filename {output} --colname scorer.method   --colval {wildcards.scorermethod} " \
        " && python scripts/add_column.py --filename {output} --colname solver.method   --colval {wildcards.solvermethod} " \
        " && python scripts/add_column.py --filename {output} --colname indeg           --colval {wildcards.indeg} " \ 
        " && python scripts/add_column.py --filename {output} --colname cores           --colval {wildcards.cores} " \
        " && python scripts/add_column.py --filename {output} --colname allocated       --colval {wildcards.allocated} " \
        " && python scripts/add_column.py --filename {output} --colname scorefunction   --colval {wildcards.scorefunction} " \
        " && python scripts/add_column.py --filename {output} --colname alpha           --colval {wildcards.alpha} " \
        " && python scripts/add_column.py --filename {output} --colname verbose         --colval {wildcards.verbose} " \
        " && python scripts/add_column.py --filename {output} --colname totaltime            --colval `cat {input.time}` " \


    elif algorithm == "itsearch":
        return "Rscript scripts/run_summarise.R " \
        "--adjmat_true {input.adjmat_true} " \
        "--adjmat_est {input.adjmat_est} " \
        "--filename_data {input.data} " \
        "--filename {output} " \ 
        "--range_header_data 1 " \ 
        " && python scripts/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
        " && python scripts/add_column.py --filename {output} --colname replicate     --colval {wildcards.replicate} "\
        " && python scripts/add_column.py --filename {output} --colname algorithm     --colval itsearch "\
        " && python scripts/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \       
        " && python scripts/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} "  \       
        " && python scripts/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \
        " && python scripts/add_column.py --filename {output} --colname plus1it       --colval {wildcards.plus1it} " \
        " && python scripts/add_column.py --filename {output} --colname moveprobs     --colval null " \
        " && python scripts/add_column.py --filename {output} --colname MAP           --colval {wildcards.MAP} " \            
        " && python scripts/add_column.py --filename {output} --colname posterior     --colval {wildcards.posterior} " \
        " && python scripts/add_column.py --filename {output} --colname iterations    --colval null " \
        " && python scripts/add_column.py --filename {output} --colname stepsave      --colval null " \
        " && python scripts/add_column.py --filename {output} --colname softlimit     --colval 9 " \ 
        " && python scripts/add_column.py --filename {output} --colname hardlimit     --colval 12 " \ 
        " && python scripts/add_column.py --filename {output} --colname alpha         --colval 0.05 " \ 
        " && python scripts/add_column.py --filename {output} --colname gamma         --colval 1  " \ 
        " && python scripts/add_column.py --filename {output} --colname startspace    --colval null " \ 
        " && python scripts/add_column.py --filename {output} --colname blacklist     --colval null " \ 
        " && python scripts/add_column.py --filename {output} --colname verbose       --colval true " \
        " && python scripts/add_column.py --filename {output} --colname chainout      --colval true " \
        " && python scripts/add_column.py --filename {output} --colname scoreout      --colval true " \
        " && python scripts/add_column.py --filename {output} --colname cpdag         --colval false " \
        " && python scripts/add_column.py --filename {output} --colname mergetype     --colval skeleton " \
        " && python scripts/add_column.py --filename {output} --colname addspace      --colval null " \
        " && python scripts/add_column.py --filename {output} --colname scoretable    --colval null " \
        " && python scripts/add_column.py --filename {output} --colname startorder    --colval null " \
        " && python scripts/add_column.py --filename {output} --colname accum         --colval false " \
        " && python scripts/add_column.py --filename {output} --colname scoretype    --colval {wildcards.scoretype} " \
        " && python scripts/add_column.py --filename {output} --colname chi          --colval {wildcards.chi} " \
        " && python scripts/add_column.py --filename {output} --colname edgepf       --colval {wildcards.edgepf} " \
        " && python scripts/add_column.py --filename {output} --colname am           --colval {wildcards.am} " \
        " && python scripts/add_column.py --filename {output} --colname aw           --colval {wildcards.aw} " \
        " && python scripts/add_column.py --filename {output} --colname time         --colval `cat {input.time}` "  \


    elif algorithm == "pcalg":
        return "Rscript scripts/run_summarise.R " \
        "--adjmat_true {input.adjmat_true} " \
        "--adjmat_est {input.adjmat_est} " \
        "--filename_data {input.data} " \
        "--filename {output} " \ 
        "--range_header_data 1 " \ 
        " && python scripts/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
        " && python scripts/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
        " && python scripts/add_column.py --filename {output} --colname algorithm   --colval pcalg "\
        " && python scripts/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \       
        " && python scripts/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} "  \       
        " && python scripts/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \       
        " && python scripts/add_column.py --filename {output} --colname alpha       --colval {wildcards.alpha} "\
        " && python scripts/add_column.py --filename {output} --colname fixedGaps   --colval null " \
        " && python scripts/add_column.py --filename {output} --colname fixedEdges  --colval null " \
        " && python scripts/add_column.py --filename {output} --colname NAdelete    --colval true " \
        " && python scripts/add_column.py --filename {output} --colname m.max       --colval inf " \
        " && python scripts/add_column.py --filename {output} --colname conservative --colval false " \
        " && python scripts/add_column.py --filename {output} --colname maj.rule     --colval false " \
        " && python scripts/add_column.py --filename {output} --colname solve.confl  --colval false " \
        " && python scripts/add_column.py --filename {output} --colname numCores     --colval 1 " \
        " && python scripts/add_column.py --filename {output} --colname verbose      --colval false " \
        " && python scripts/add_column.py --filename {output} --colname time          --colval `cat {input.time}` "  \


    elif algorithm == "mmhc":
        return  "Rscript scripts/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename_data {input.data} " \
                "--filename {output} " \ 
                "--range_header_data 1 " \ 
                " && python scripts/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python scripts/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
                " && python scripts/add_column.py --filename {output} --colname algorithm   --colval mmhc "\
                " && python scripts/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \       
                " && python scripts/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} "  \       
                " && python scripts/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \       
                " && python scripts/add_column.py --filename {output} --colname alpha       --colval {wildcards.alpha} " \
                " && python scripts/add_column.py --filename {output} --colname whitelist   --colval null " \
                " && python scripts/add_column.py --filename {output} --colname debug       --colval false " \
                " && python scripts/add_column.py --filename {output} --colname maximize.args   --colval null " \
                " && python scripts/add_column.py --filename {output} --colname time          --colval `cat {input.time}` " \


    elif algorithm == "h2pc":
        return  "Rscript scripts/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename_data {input.data} " \
                "--filename {output} " \ 
                "--range_header_data 1 " \ 
                " && python scripts/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python scripts/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
                " && python scripts/add_column.py --filename {output} --colname algorithm   --colval h2pc "\
                " && python scripts/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \       
                " && python scripts/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} "  \       
                " && python scripts/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \       
                " && python scripts/add_column.py --filename {output} --colname alpha       --colval {wildcards.alpha} " \
                " && python scripts/add_column.py --filename {output} --colname whitelist   --colval null " \
                " && python scripts/add_column.py --filename {output} --colname debug       --colval false " \
                " && python scripts/add_column.py --filename {output} --colname maximize.args   --colval null " \
                " && python scripts/add_column.py --filename {output} --colname time          --colval `cat {input.time}` " \


    elif algorithm == "interiamb":
        return  "Rscript scripts/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename_data {input.data} " \
                "--filename {output} " \ 
                "--range_header_data 1 " \ 
                " && python scripts/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python scripts/add_column.py --filename {output} --colname replicate        --colval {wildcards.replicate} "\
                " && python scripts/add_column.py --filename {output} --colname algorithm        --colval interiamb "\
                " && python scripts/add_column.py --filename {output} --colname adjmat           --colval {wildcards.adjmat} "  \       
                " && python scripts/add_column.py --filename {output} --colname bn               --colval {wildcards.bn} "  \       
                " && python scripts/add_column.py --filename {output} --colname data             --colval {wildcards.data} "  \       
                " && python scripts/add_column.py --filename {output} --colname alpha            --colval {wildcards.alpha} " \
                " && python scripts/add_column.py --filename {output} --colname cluster          --colval null " \
                " && python scripts/add_column.py --filename {output} --colname whitelist        --colval null " \
                " && python scripts/add_column.py --filename {output} --colname blacklist        --colval null " \
                " && python scripts/add_column.py --filename {output} --colname test             --colval null " \
                " && python scripts/add_column.py --filename {output} --colname B                --colval null " \
                " && python scripts/add_column.py --filename {output} --colname debug            --colval false " \
                " && python scripts/add_column.py --filename {output} --colname max.sx           --colval null " \
                " && python scripts/add_column.py --filename {output} --colname undirected       --colval false " \
                " && python scripts/add_column.py --filename {output} --colname time             --colval `cat {input.time}` " \

                
    elif algorithm == "gs":
        return  "Rscript scripts/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename_data {input.data} " \
                "--filename {output} " \ 
                "--range_header_data 1 " \ 
                " && python scripts/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python scripts/add_column.py --filename {output} --colname replicate        --colval {wildcards.replicate} "\
                " && python scripts/add_column.py --filename {output} --colname algorithm        --colval gs "\
                " && python scripts/add_column.py --filename {output} --colname adjmat           --colval {wildcards.adjmat} "  \       
                " && python scripts/add_column.py --filename {output} --colname bn               --colval {wildcards.bn} "  \       
                " && python scripts/add_column.py --filename {output} --colname data             --colval {wildcards.data} "  \       
                " && python scripts/add_column.py --filename {output} --colname alpha            --colval {wildcards.alpha} " \
                " && python scripts/add_column.py --filename {output} --colname cluster          --colval null " \
                " && python scripts/add_column.py --filename {output} --colname whitelist        --colval null " \
                " && python scripts/add_column.py --filename {output} --colname blacklist        --colval null " \
                " && python scripts/add_column.py --filename {output} --colname test             --colval null " \
                " && python scripts/add_column.py --filename {output} --colname B                --colval null " \
                " && python scripts/add_column.py --filename {output} --colname debug            --colval false " \
                " && python scripts/add_column.py --filename {output} --colname max.sx           --colval null " \
                " && python scripts/add_column.py --filename {output} --colname undirected       --colval false " \
                " && python scripts/add_column.py --filename {output} --colname time             --colval `cat {input.time}` " \


    elif algorithm == "fges":
        return  "Rscript scripts/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename_data {input.data} " \
                "--filename {output.res} " \ 
                "--range_header_data 1 " \ 
                " && python scripts/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python scripts/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
                " && python scripts/add_column.py --filename {output} --colname algorithm   --colval fges "\
                " && python scripts/add_column.py --filename {output} --colname adjmat           --colval {wildcards.adjmat} " \
                " && python scripts/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} " \
                " && python scripts/add_column.py --filename {output} --colname data           --colval {wildcards.data} " \
                " && python scripts/add_column.py --filename {output} --colname faithfulnessAssumed       --colval {wildcards.faithfulnessAssumed} "\
                " && python scripts/add_column.py --filename {output} --colname time        --colval `cat {input.time}` " \


    elif algorithm == "fci":
        return  "Rscript scripts/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename_data {input.data} " \
                "--filename {output.res} " \ 
                "--range_header_data 1 " \ 
                " && python scripts/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python scripts/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
                " && python scripts/add_column.py --filename {output} --colname algorithm   --colval fci "\
                " && python scripts/add_column.py --filename {output} --colname adjmat           --colval {wildcards.adjmat} " \
                " && python scripts/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} " \
                " && python scripts/add_column.py --filename {output} --colname data           --colval {wildcards.data} " \
                " && python scripts/add_column.py --filename {output} --colname alpha       --colval {wildcards.alpha} "\
                " && python scripts/add_column.py --filename {output} --colname test       --colval {wildcards.test} "\
                " && python scripts/add_column.py --filename {output} --colname time        --colval `cat {input.time}` " \


    elif algorithm == "gfci":
        return  "Rscript scripts/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename_data {input.data} " \
                "--filename {output.res} " \ 
                "--range_header_data 1 " \ 
                " && python scripts/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python scripts/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
                " && python scripts/add_column.py --filename {output} --colname algorithm   --colval gfci "\
                " && python scripts/add_column.py --filename {output} --colname adjmat           --colval {wildcards.adjmat} " \
                " && python scripts/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} " \
                " && python scripts/add_column.py --filename {output} --colname data           --colval {wildcards.data} " \
                " && python scripts/add_column.py --filename {output} --colname alpha       --colval {wildcards.alpha} "\
                " && python scripts/add_column.py --filename {output} --colname score       --colval {wildcards.score} "\
                " && python scripts/add_column.py --filename {output} --colname test       --colval {wildcards.test} "\
                " && python scripts/add_column.py --filename {output} --colname time        --colval `cat {input.time}` " \


    elif algorithm == "rfci":
        return  "Rscript scripts/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename_data {input.data} " \
                "--filename {output.res} " \ 
                "--range_header_data 1 " \ 
                " && python scripts/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python scripts/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
                " && python scripts/add_column.py --filename {output} --colname algorithm   --colval rfci "\
                " && python scripts/add_column.py --filename {output} --colname adjmat           --colval {wildcards.adjmat} " \
                " && python scripts/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} " \
                " && python scripts/add_column.py --filename {output} --colname data           --colval {wildcards.data} " \
                " && python scripts/add_column.py --filename {output} --colname alpha       --colval {wildcards.alpha} "\
                " && python scripts/add_column.py --filename {output} --colname test       --colval {wildcards.test} "\
                " && python scripts/add_column.py --filename {output} --colname time        --colval `cat {input.time}` " \

    
    elif algorithm=="gobnilp":
        return  "Rscript scripts/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename_data {input.data} " \
                "--filename {output.res} " \ 
                "--range_header_data 1 " \ 
                "--adjmat_header 0 " \ 
                " && python scripts/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python scripts/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
                " && python scripts/add_column.py --filename {output} --colname algorithm   --colval gobnilp "\
                " && python scripts/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \       
                " && python scripts/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} "  \       
                " && python scripts/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \
                " && python scripts/add_column.py --filename {output} --colname palim       --colval {wildcards.palim} "\
                " && python scripts/add_column.py --filename {output} --colname alpha       --colval {wildcards.alpha} "\
                " && python scripts/add_column.py --filename {output} --colname prune       --colval {wildcards.prune} "\
                " && python scripts/add_column.py --filename {output} --colname time        --colval `cat {input.time} | grep -Eo '[0-9]\.[0-9]*$'` " \


    elif algorithm == "trilearn_loglin":
        return "Rscript scripts/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename_data {input.data} " \
                "--range_header_data 1 " \ 
                "--filename {output} " \ 
                " && python scripts/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python scripts/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
                " && python scripts/add_column.py --filename {output} --colname algorithm   --colval trilearn_loglin "\
                " && python scripts/add_column.py --filename {output} --colname adjmat      --colval {wildcards.adjmat} "  \       
                " && python scripts/add_column.py --filename {output} --colname bn          --colval {wildcards.bn} "  \       
                " && python scripts/add_column.py --filename {output} --colname data        --colval {wildcards.data} "  \
                " && python scripts/add_column.py --filename {output} --colname alpha       --colval {wildcards.alpha} "\
                " && python scripts/add_column.py --filename {output} --colname beta        --colval {wildcards.beta} "\
                " && python scripts/add_column.py --filename {output} --colname radii       --colval {wildcards.radii} "\
                " && python scripts/add_column.py --filename {output} --colname N           --colval {wildcards.N} "\
                " && python scripts/add_column.py --filename {output} --colname M           --colval {wildcards.M} "\
                " && python scripts/add_column.py --filename {output} --colname pseudo_obs  --colval {wildcards.pseudo_obs} "\
                " && python scripts/add_column.py --filename {output} --colname alpha       --colval {wildcards.alpha} "\
                " && python scripts/add_column.py --filename {output} --colname threshold   --colval {wildcards.threshold} "\
                " && python scripts/add_column.py --filename {output} --colname time        --colval `cat {input.time}` " \ 


    elif algorithm == "order_mcmc":
        return  "Rscript scripts/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename_data {input.data} " \
                "--range_header_data 1 " \ 
                "--filename {output} " \ 
                " && python scripts/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python scripts/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
                " && python scripts/add_column.py --filename {output} --colname algorithm   --colval orderMCMC "\
                " && python scripts/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \       
                " && python scripts/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} "  \       
                " && python scripts/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \
                " && python scripts/add_column.py --filename {output} --colname scoretype    --colval {wildcards.scoretype} " \
                " && python scripts/add_column.py --filename {output} --colname chi          --colval {wildcards.chi} " \
                " && python scripts/add_column.py --filename {output} --colname edgepf       --colval {wildcards.edgepf} " \
                " && python scripts/add_column.py --filename {output} --colname am           --colval {wildcards.am} " \
                " && python scripts/add_column.py --filename {output} --colname aw           --colval {wildcards.aw} " \
                " && python scripts/add_column.py --filename {output} --colname map         --colval null "\
                " && python scripts/add_column.py --filename {output} --colname blacklist   --colval null "\
                " && python scripts/add_column.py --filename {output} --colname startorder  --colval null "\
                " && python scripts/add_column.py --filename {output} --colname scoretable  --colval null "\
                " && python scripts/add_column.py --filename {output} --colname moveprobs   --colval null "\
                " && python scripts/add_column.py --filename {output} --colname iterations  --colval null "\
                " && python scripts/add_column.py --filename {output} --colname stepwise    --colval null "\
                " && python scripts/add_column.py --filename {output} --colname alpha       --colval 0.05 "\
                " && python scripts/add_column.py --filename {output} --colname cpdag       --colval false "\   
                " && python scripts/add_column.py --filename {output} --colname gamma       --colval 1 "\
                " && python scripts/add_column.py --filename {output} --colname hardlimit   --colval 15 "\      
                " && python scripts/add_column.py --filename {output} --colname chainout    --colval true "\   
                " && python scripts/add_column.py --filename {output} --colname scoreout    --colval false "\   
                " && python scripts/add_column.py --filename {output} --colname verbose     --colval false "\
                " && python scripts/add_column.py --filename {output} --colname threshold   --colval {wildcards.threshold} "\
                " && python scripts/add_column.py --filename {output} --colname startspace   --colval {wildcards.startspace_algorithm} "\
                " && python scripts/add_column.py --filename {output} --colname time        --colval `cat {input.time}` " \ 

