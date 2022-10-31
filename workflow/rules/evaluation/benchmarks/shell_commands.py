# This file contains the shell commands from each structure learning for saving
# its benchmarks in a csv file along with the parameter setings.

def dict_to_summary(d):
    s = ""
    for key, val in d.items():
        s += " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output.res} --colname "+key+" --colval {wildcards."+key+"} "
    return s

def summarise_alg_shell(algorithm):
    if algorithm == "mylib_myalg":
        ret = "Rscript workflow/rules/evaluation/benchmarks/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output.res} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname replicate       --colval {wildcards.replicate} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname algorithm       --colval "+ algorithm+" " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname parameters              --colval {wildcards.bn} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname time            --colval `cat {input.time}` " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname ntests          --colval `cat {input.ntests}` "
        ret += dict_to_summary(config["resources"]["structure_learning_algorithms"][algorithm][0])
        return ret

    elif algorithm == "causaldag_gsp":
        ret = "Rscript workflow/rules/evaluation/benchmarks/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output.res} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname replicate       --colval {wildcards.replicate} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname algorithm       --colval "+ algorithm+" " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname parameters              --colval {wildcards.bn} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname time            --colval `cat {input.time}` " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname ntests          --colval `cat {input.ntests}` "
        ret += dict_to_summary(config["resources"]["structure_learning_algorithms"][algorithm][0])
        return ret

    elif algorithm == "gcastle_pc":
        ret = "Rscript workflow/rules/evaluation/benchmarks/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output.res} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname replicate       --colval {wildcards.replicate} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname algorithm       --colval "+ algorithm+" " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname parameters              --colval {wildcards.bn} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname time            --colval `cat {input.time}` " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname ntests          --colval `cat {input.ntests}` "
        ret += dict_to_summary(config["resources"]["structure_learning_algorithms"][algorithm][0])
        return ret
    elif algorithm == "gcastle_anm":
        ret = "Rscript workflow/rules/evaluation/benchmarks/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output.res} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname replicate       --colval {wildcards.replicate} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname algorithm       --colval "+ algorithm+" " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname parameters              --colval {wildcards.bn} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname time            --colval `cat {input.time}` " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname ntests          --colval `cat {input.ntests}` "
        ret += dict_to_summary(config["resources"]["structure_learning_algorithms"][algorithm][0])
        return ret

    elif algorithm == "gcastle_direct_lingam":
        ret = "Rscript workflow/rules/evaluation/benchmarks/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output.res} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname replicate       --colval {wildcards.replicate} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname algorithm       --colval "+ algorithm+" " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname parameters              --colval {wildcards.bn} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname time            --colval `cat {input.time}` " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname ntests          --colval `cat {input.ntests}` "
        ret += dict_to_summary(config["resources"]["structure_learning_algorithms"][algorithm][0])
        return ret

    elif algorithm == "gcastle_ica_lingam":
        ret = "Rscript workflow/rules/evaluation/benchmarks/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output.res} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname replicate       --colval {wildcards.replicate} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname algorithm       --colval "+ algorithm+" " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname parameters              --colval {wildcards.bn} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname time            --colval `cat {input.time}` " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname ntests          --colval `cat {input.ntests}` "
        ret += dict_to_summary(config["resources"]["structure_learning_algorithms"][algorithm][0])
        return ret

    elif algorithm == "gcastle_notears_nonlinear":
        ret = "Rscript workflow/rules/evaluation/benchmarks/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output.res} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname replicate       --colval {wildcards.replicate} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname algorithm       --colval "+ algorithm+" " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname parameters              --colval {wildcards.bn} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname time            --colval `cat {input.time}` " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname ntests          --colval `cat {input.ntests}` "
        ret += dict_to_summary(config["resources"]["structure_learning_algorithms"][algorithm][0])
        return ret

    elif algorithm == "gcastle_notears_low_rank":
        ret = "Rscript workflow/rules/evaluation/benchmarks/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output.res} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname replicate       --colval {wildcards.replicate} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname algorithm       --colval "+ algorithm+" " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname parameters              --colval {wildcards.bn} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname time            --colval `cat {input.time}` " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname ntests          --colval `cat {input.ntests}` "
        ret += dict_to_summary(config["resources"]["structure_learning_algorithms"][algorithm][0])
        return ret

    elif algorithm == "gcastle_golem":
        ret = "Rscript workflow/rules/evaluation/benchmarks/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output.res} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname replicate       --colval {wildcards.replicate} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname algorithm       --colval "+ algorithm+" " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname parameters              --colval {wildcards.bn} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname time            --colval `cat {input.time}` " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname ntests          --colval `cat {input.ntests}` "
        ret += dict_to_summary(config["resources"]["structure_learning_algorithms"][algorithm][0])
        return ret

    elif algorithm == "gcastle_grandag":
        ret = "Rscript workflow/rules/evaluation/benchmarks/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output.res} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname replicate       --colval {wildcards.replicate} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname algorithm       --colval "+ algorithm+" " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname parameters              --colval {wildcards.bn} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname time            --colval `cat {input.time}` " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname ntests          --colval `cat {input.ntests}` "
        ret += dict_to_summary(config["resources"]["structure_learning_algorithms"][algorithm][0])
        return ret

    elif algorithm == "gcastle_mcsl":
        ret = "Rscript workflow/rules/evaluation/benchmarks/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output.res} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname replicate       --colval {wildcards.replicate} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname algorithm       --colval "+ algorithm+" " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname parameters              --colval {wildcards.bn} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname time            --colval `cat {input.time}` " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname ntests          --colval `cat {input.ntests}` "
        ret += dict_to_summary(config["resources"]["structure_learning_algorithms"][algorithm][0])
        return ret

    elif algorithm == "gcastle_gae":
        ret = "Rscript workflow/rules/evaluation/benchmarks/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output.res} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname replicate       --colval {wildcards.replicate} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname algorithm       --colval "+ algorithm+" " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname parameters              --colval {wildcards.bn} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname time            --colval `cat {input.time}` " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname ntests          --colval `cat {input.ntests}` "
        ret += dict_to_summary(config["resources"]["structure_learning_algorithms"][algorithm][0])
        return ret

    elif algorithm == "gcastle_rl":
        ret = "Rscript workflow/rules/evaluation/benchmarks/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output.res} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname replicate       --colval {wildcards.replicate} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname algorithm       --colval "+ algorithm+" " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname parameters              --colval {wildcards.bn} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname time            --colval `cat {input.time}` " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname ntests          --colval `cat {input.ntests}` "
        ret += dict_to_summary(config["resources"]["structure_learning_algorithms"][algorithm][0])
        return ret

    elif algorithm == "gcastle_corl":
        ret = "Rscript workflow/rules/evaluation/benchmarks/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output.res} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname replicate       --colval {wildcards.replicate} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname algorithm       --colval "+ algorithm+" " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname parameters              --colval {wildcards.bn} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname time            --colval `cat {input.time}` " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname ntests          --colval `cat {input.ntests}` "
        ret += dict_to_summary(config["resources"]["structure_learning_algorithms"][algorithm][0])
        return ret

    elif algorithm == "gcastle_notears":
        ret = "Rscript workflow/rules/evaluation/benchmarks/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output.res} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname replicate       --colval {wildcards.replicate} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname algorithm       --colval "+ algorithm+" " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname parameters              --colval {wildcards.bn} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname time            --colval `cat {input.time}` " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname ntests          --colval `cat {input.ntests}` "
        ret += dict_to_summary(config["resources"]["structure_learning_algorithms"][algorithm][0])
        return ret

    # TODO: use dict_to_summary for the algorithms below as well.
    elif algorithm == "gt13_multipair":
        return  "Rscript workflow/rules/evaluation/benchmarks/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output.res} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname replicate       --colval {wildcards.replicate} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname algorithm       --colval gt13_multipair " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname parameters              --colval {wildcards.bn} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname n_samples       --colval {wildcards.n_samples} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname randomits       --colval {wildcards.randomits} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname penalty         --colval {wildcards.penalty} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname prior           --colval {wildcards.prior} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname ascore          --colval {wildcards.ascore} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname bscore          --colval {wildcards.bscore} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname clq             --colval {wildcards.clq} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname sep             --colval {wildcards.sep} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname mcmc_seed       --colval {wildcards.mcmc_seed} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname datatype       --colval {wildcards.datatype} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname timeout       --colval {wildcards.timeout} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname time            --colval `cat {input.time}` " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname ntests             --colval None " \

    elif algorithm == "gg99_singlepair":
        return  "Rscript workflow/rules/evaluation/benchmarks/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output.res} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname replicate       --colval {wildcards.replicate} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname algorithm       --colval gg99_singlepair " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname parameters              --colval {wildcards.bn} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname n_samples       --colval {wildcards.n_samples} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname randomits       --colval {wildcards.randomits} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname penalty         --colval {wildcards.penalty} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname prior           --colval {wildcards.prior} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname ascore          --colval {wildcards.ascore} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname bscore          --colval {wildcards.bscore} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname clq             --colval {wildcards.clq} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname sep             --colval {wildcards.sep} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname mcmc_seed       --colval {wildcards.mcmc_seed} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname datatype       --colval {wildcards.datatype} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname timeout       --colval {wildcards.timeout} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname time            --colval `cat {input.time}` " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname ntests             --colval None " \

    elif algorithm == "bnlearn_tabu":
        return  "Rscript workflow/rules/evaluation/benchmarks/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output.res} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname replicate       --colval {wildcards.replicate} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname algorithm       --colval bnlearn_tabu " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname parameters              --colval {wildcards.bn} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname score           --colval {wildcards.score} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname iss             --colval {wildcards.iss} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname issmu          --colval {wildcards.issmu} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname issw          --colval {wildcards.issw} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname l               --colval {wildcards.l} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname k               --colval {wildcards.k} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname prior           --colval {wildcards.prior} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname beta            --colval {wildcards.beta} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname start           --colval null " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname whitelist       --colval null " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname blacklist       --colval null " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname debug           --colval false " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname tabu            --colval 10 " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname maxtabu        --colval tabu " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname maxiter        --colval Inf " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname maxp            --colval Inf " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname optimized       --colval true " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname timeout       --colval {wildcards.timeout} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname time            --colval `cat {input.time}` " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname ntests             --colval `cat {input.ntests}` " \

    elif algorithm == "notears":
        return  "Rscript workflow/rules/evaluation/benchmarks/run_summarise.R " \
        "--adjmat_true {input.adjmat_true} " \
        "--adjmat_est {input.adjmat_est} " \
        "--filename {output.res} " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname replicate       --colval {wildcards.replicate} " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname algorithm       --colval notears " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname parameters              --colval {wildcards.bn} "  \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname min_rate_of_progress        --colval {wildcards.min_rate_of_progress} " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname penalty_growth_rate        --colval {wildcards.penalty_growth_rate} " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname optimation_accuracy         --colval {wildcards.optimation_accuracy} " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname loss                        --colval {wildcards.loss} " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname loss_grad           --colval {wildcards.loss_grad} " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname timeout       --colval {wildcards.timeout} "\
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname time            --colval `cat {input.time}` " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname ntests             --colval None " \

    elif algorithm == "sklearn_glasso":
        return  "Rscript workflow/rules/evaluation/benchmarks/run_summarise.R " \
        "--adjmat_true {input.adjmat_true} " \
        "--adjmat_est {input.adjmat_est} " \
        "--filename {output.res} " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname replicate       --colval {wildcards.replicate} " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname algorithm       --colval sklearn_glasso " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname parameters              --colval {wildcards.bn} "  \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname alpha           --colval {wildcards.alpha} " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname mode            --colval {wildcards.mode} " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname tol             --colval {wildcards.tol} " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname enet_tol        --colval {wildcards.enet_tol} " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname verbose         --colval {wildcards.verbose} " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname precmat_threshold        --colval {wildcards.precmat_threshold} " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname assume_centered --colval {wildcards.assume_centered} " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname timeout       --colval {wildcards.timeout} "\
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname time            --colval `cat {input.time}` " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname ntests             --colval None " \

    if algorithm == "bnlearn_hc":
        return  "Rscript workflow/rules/evaluation/benchmarks/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output.res} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname replicate       --colval {wildcards.replicate} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname algorithm       --colval bnlearn_hc " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname parameters              --colval {wildcards.bn} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname score           --colval {wildcards.score} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname iss             --colval {wildcards.iss} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname issmu          --colval {wildcards.issmu} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname issw          --colval {wildcards.issw} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname l               --colval {wildcards.l} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname k               --colval {wildcards.k} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname prior           --colval {wildcards.prior} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname beta            --colval {wildcards.beta} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname start           --colval null " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname whitelist       --colval null " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname blacklist       --colval null " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname debug           --colval false " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname perturb         --colval {wildcards.perturb} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname restart         --colval {wildcards.restart} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname maxiter        --colval Inf " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname maxp            --colval Inf " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname optimized       --colval true " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname timeout       --colval {wildcards.timeout} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname time            --colval `cat {input.time}` " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname ntests             --colval `cat {input.ntests}` " \


    elif algorithm == "rblip_asobs":
        return "Rscript workflow/rules/evaluation/benchmarks/run_summarise.R " \
        "--adjmat_true {input.adjmat_true} " \
        "--adjmat_est {input.adjmat_est} " \
        "--filename {output.res} " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname replicate       --colval {wildcards.replicate} " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname algorithm       --colval rblip_asobs " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname parameters              --colval {wildcards.bn} "  \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname timeout            --colval {wildcards.timeout} " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname scorermethod   --colval {wildcards.scorermethod} " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname solvermethod   --colval {wildcards.solvermethod} " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname indeg           --colval {wildcards.indeg} " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname cores           --colval {wildcards.cores} " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname allocated       --colval {wildcards.allocated} " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname scorefunction   --colval {wildcards.scorefunction} " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname alpha           --colval {wildcards.alpha} " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname verbose_level         --colval {wildcards.verbose_level} " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname time            --colval `cat {input.time}` " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname ntests             --colval None " \


    elif algorithm == "bidag_itsearch":
        return "Rscript workflow/rules/evaluation/benchmarks/run_summarise.R " \
        "--adjmat_true {input.adjmat_true} " \
        "--adjmat_est {input.adjmat_est} " \
        "--filename {output} " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname replicate     --colval {wildcards.replicate} "\
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname algorithm     --colval bidag_itsearch "\
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname parameters              --colval {wildcards.bn} "  \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname plus1it       --colval {wildcards.plus1it} " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname moveprobs     --colval null " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname MAP           --colval {wildcards.MAP} " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname posterior     --colval {wildcards.posterior} " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname iterations    --colval null " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname stepsave      --colval null " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname softlimit     --colval {wildcards.softlimit} " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname hardlimit     --colval {wildcards.hardlimit} " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname alpha         --colval {wildcards.alpha} " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname gamma         --colval {wildcards.gamma}  " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname startspace    --colval null " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname blacklist     --colval null " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname verbose       --colval true " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname chainout      --colval true " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname scoreout      --colval true " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname cpdag         --colval {wildcards.cpdag} " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname mergetype     --colval {wildcards.mergetype} " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname addspace      --colval null " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname scoretable    --colval null " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname startorder    --colval null " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname estimate          --colval {wildcards.estimate} " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname scoretype    --colval {wildcards.scoretype} " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname chi          --colval {wildcards.chi} " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname edgepf       --colval {wildcards.edgepf} " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname am           --colval {wildcards.am} " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname aw           --colval {wildcards.aw} " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname timeout      --colval {wildcards.timeout} " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname time         --colval `cat {input.time}` "  \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname ntests             --colval None " \

    elif algorithm == "pcalg_pc":
        #print(dict_to_summary(config["resources"]["structure_learning_algorithms"][algorithm][0]))
        ret = "Rscript workflow/rules/evaluation/benchmarks/run_summarise.R " \
        "--adjmat_true {input.adjmat_true} " \
        "--adjmat_est {input.adjmat_est} " \
        "--filename {output.res} " 
        # " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output.res} --colname replicate       --colval {wildcards.replicate} " \
        # " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output.res} --colname algorithm       --colval "+ algorithm+" " \
        # " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output.res} --colname adjmat          --colval {wildcards.adjmat} "  \
        # " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output.res} --colname parameters              --colval {wildcards.bn} "  \
        # " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output.res} --colname data            --colval {wildcards.data} "  \
        # " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output.res} --colname time            --colval `cat {input.time}` "  \
        # " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output.res} --colname ntests          --colval `cat {input.ntests}` " 
        # #ret += dict_to_summary(config["resources"]["structure_learning_algorithms"][algorithm][0])
        return ret
        
        # " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
        # " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
        # " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname algorithm   --colval pcalg_pc "\
        # " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \
        # " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname parameters              --colval {wildcards.bn} "  \
        # " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \
        # " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname alpha       --colval {wildcards.alpha} "\
        # " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname fixedGaps   --colval null " \
        # " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname fixedEdges  --colval null " \
        # " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname NAdelete    --colval {wildcards.NAdelete} " \
        # " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname mmax       --colval {wildcards.mmax} " \
        # " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname conservative --colval {wildcards.conservative} " \
        # " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname majrule     --colval {wildcards.majrule} " \
        # " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname solveconfl  --colval {wildcards.solveconfl} " \
        # " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname numCores     --colval {wildcards.numCores} " \
        # " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname verbose      --colval {wildcards.verbose} " \
        # " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname timeout       --colval {wildcards.timeout} "\
        # " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname time          --colval `cat {input.time}` "  \
        # " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname ntests             --colval None " \

    elif algorithm == "dualpc":
        return "Rscript workflow/rules/evaluation/benchmarks/run_summarise.R " \
        "--adjmat_true {input.adjmat_true} " \
        "--adjmat_est {input.adjmat_est} " \
        "--filename {output} " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname algorithm   --colval "+algorithm+" "\
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname parameters              --colval {wildcards.bn} "  \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname alpha       --colval {wildcards.alpha} "\
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname max_ord       --colval {wildcards.max_ord} " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname skeleton  --colval {wildcards.skeleton} " \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname timeout       --colval {wildcards.timeout} "\
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname time          --colval `cat {input.time}` "  \
        " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname ntests             --colval None " \

    elif algorithm == "bnlearn_mmhc":
        return  "Rscript workflow/rules/evaluation/benchmarks/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname algorithm   --colval bnlearn_mmhc "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname parameters              --colval {wildcards.bn} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname alpha       --colval {wildcards.alpha} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname test       --colval {wildcards.test} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname score           --colval {wildcards.score} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname iss             --colval {wildcards.iss} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname issmu          --colval {wildcards.issmu} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname issw          --colval {wildcards.issw} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname l               --colval {wildcards.l} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname k               --colval {wildcards.k} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname prior           --colval {wildcards.prior} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname beta            --colval {wildcards.beta} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname whitelist   --colval null " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname debug       --colval false " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname maximizeargs   --colval null " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname timeout       --colval {wildcards.timeout} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname time          --colval `cat {input.time}` " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname ntests             --colval `cat {input.ntests}` " \

    elif algorithm == "bnlearn_h2pc":
        return  "Rscript workflow/rules/evaluation/benchmarks/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname algorithm   --colval " + algorithm +" "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname parameters              --colval {wildcards.bn} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname alpha       --colval {wildcards.alpha} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname test       --colval {wildcards.test} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname score           --colval {wildcards.score} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname iss             --colval {wildcards.iss} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname issmu          --colval {wildcards.issmu} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname issw          --colval {wildcards.issw} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname l               --colval {wildcards.l} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname k               --colval {wildcards.k} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname prior           --colval {wildcards.prior} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname beta            --colval {wildcards.beta} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname whitelist   --colval null " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname debug       --colval false " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname maximizeargs   --colval null " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname timeout       --colval {wildcards.timeout} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname time          --colval `cat {input.time}` " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname ntests             --colval `cat {input.ntests}` " \

    elif algorithm == "bnlearn_rsmax2":
        return  "Rscript workflow/rules/evaluation/benchmarks/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname algorithm   --colval " + algorithm +" "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname parameters              --colval {wildcards.bn} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname alpha       --colval {wildcards.alpha} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname test       --colval {wildcards.test} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname score           --colval {wildcards.score} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname iss             --colval {wildcards.iss} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname issmu          --colval {wildcards.issmu} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname issw          --colval {wildcards.issw} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname l               --colval {wildcards.l} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname k               --colval {wildcards.k} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname prior           --colval {wildcards.prior} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname beta            --colval {wildcards.beta} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname whitelist   --colval null " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname debug       --colval false " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname maximizeargs   --colval null " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname timeout       --colval {wildcards.timeout} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname time          --colval `cat {input.time}` " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname ntests             --colval `cat {input.ntests}` " \

    elif algorithm == "bnlearn_interiamb":
        return  "Rscript workflow/rules/evaluation/benchmarks/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname replicate        --colval {wildcards.replicate} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname algorithm        --colval bnlearn_interiamb "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname adjmat           --colval {wildcards.adjmat} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname parameters               --colval {wildcards.bn} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname data             --colval {wildcards.data} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname alpha            --colval {wildcards.alpha} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname cluster          --colval null " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname whitelist        --colval null " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname blacklist        --colval null " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname test             --colval {wildcards.test} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname B                --colval {wildcards.B} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname debug            --colval {wildcards.debug} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname maxsx           --colval {wildcards.maxsx} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname undirected       --colval {wildcards.undirected} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname timeout       --colval {wildcards.timeout} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname time             --colval `cat {input.time}` " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname ntests             --colval `cat {input.ntests}` " \


    elif algorithm == "bnlearn_gs":
        return  "Rscript workflow/rules/evaluation/benchmarks/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname replicate        --colval {wildcards.replicate} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname algorithm        --colval " +algorithm+" "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname adjmat           --colval {wildcards.adjmat} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname parameters               --colval {wildcards.bn} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname data             --colval {wildcards.data} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname alpha            --colval {wildcards.alpha} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname cluster          --colval null " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname whitelist        --colval null " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname blacklist        --colval null " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname test             --colval {wildcards.test} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname B                --colval {wildcards.B} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname debug            --colval {wildcards.debug} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname maxsx           --colval {wildcards.maxsx} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname undirected       --colval {wildcards.undirected} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname timeout       --colval {wildcards.timeout} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname time             --colval `cat {input.time}` " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname ntests             --colval `cat {input.ntests}` " \

    elif algorithm == "bnlearn_pcstable":
        return  "Rscript workflow/rules/evaluation/benchmarks/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname replicate        --colval {wildcards.replicate} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname algorithm        --colval " +algorithm+" "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname adjmat           --colval {wildcards.adjmat} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname parameters               --colval {wildcards.bn} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname data             --colval {wildcards.data} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname alpha            --colval {wildcards.alpha} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname cluster          --colval null " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname whitelist        --colval null " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname blacklist        --colval null " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname test             --colval {wildcards.test} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname B                --colval {wildcards.B} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname debug            --colval {wildcards.debug} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname maxsx           --colval {wildcards.maxsx} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname undirected       --colval {wildcards.undirected} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname timeout       --colval {wildcards.timeout} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname time             --colval `cat {input.time}` " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname ntests             --colval `cat {input.ntests}` " \

    elif algorithm == "bnlearn_iamb":
        return  "Rscript workflow/rules/evaluation/benchmarks/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname replicate        --colval {wildcards.replicate} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname algorithm        --colval " +algorithm+" "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname adjmat           --colval {wildcards.adjmat} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname parameters               --colval {wildcards.bn} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname data             --colval {wildcards.data} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname alpha            --colval {wildcards.alpha} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname cluster          --colval null " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname whitelist        --colval null " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname blacklist        --colval null " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname test             --colval {wildcards.test} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname B                --colval {wildcards.B} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname debug            --colval {wildcards.debug} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname maxsx           --colval {wildcards.maxsx} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname undirected       --colval {wildcards.undirected} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname timeout       --colval {wildcards.timeout} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname time             --colval `cat {input.time}` " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname ntests             --colval `cat {input.ntests}` " \

    elif algorithm == "bnlearn_fastiamb":
        return  "Rscript workflow/rules/evaluation/benchmarks/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname replicate        --colval {wildcards.replicate} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname algorithm        --colval " +algorithm+" "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname adjmat           --colval {wildcards.adjmat} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname parameters               --colval {wildcards.bn} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname data             --colval {wildcards.data} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname alpha            --colval {wildcards.alpha} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname cluster          --colval null " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname whitelist        --colval null " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname blacklist        --colval null " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname test             --colval {wildcards.test} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname B                --colval {wildcards.B} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname debug            --colval {wildcards.debug} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname maxsx           --colval {wildcards.maxsx} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname undirected       --colval {wildcards.undirected} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname timeout       --colval {wildcards.timeout} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname time             --colval `cat {input.time}` " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname ntests             --colval `cat {input.ntests}` " \

    elif algorithm == "bnlearn_iambfdr":
        return  "Rscript workflow/rules/evaluation/benchmarks/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname replicate        --colval {wildcards.replicate} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname algorithm        --colval " +algorithm+" "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname adjmat           --colval {wildcards.adjmat} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname parameters               --colval {wildcards.bn} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname data             --colval {wildcards.data} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname alpha            --colval {wildcards.alpha} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname cluster          --colval null " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname whitelist        --colval null " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname blacklist        --colval null " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname test             --colval {wildcards.test} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname B                --colval {wildcards.B} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname debug            --colval {wildcards.debug} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname maxsx           --colval {wildcards.maxsx} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname undirected       --colval {wildcards.undirected} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname timeout       --colval {wildcards.timeout} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname time             --colval `cat {input.time}` " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname ntests             --colval `cat {input.ntests}` " \

    elif algorithm == "bnlearn_mmpc":
        return  "Rscript workflow/rules/evaluation/benchmarks/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname replicate        --colval {wildcards.replicate} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname algorithm        --colval " +algorithm+" "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname adjmat           --colval {wildcards.adjmat} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname parameters               --colval {wildcards.bn} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname data             --colval {wildcards.data} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname alpha            --colval {wildcards.alpha} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname cluster          --colval null " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname whitelist        --colval null " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname blacklist        --colval null " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname test             --colval {wildcards.test} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname B                --colval {wildcards.B} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname debug            --colval {wildcards.debug} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname maxsx           --colval {wildcards.maxsx} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname undirected       --colval {wildcards.undirected} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname timeout       --colval {wildcards.timeout} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname time             --colval `cat {input.time}` " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname ntests             --colval `cat {input.ntests}` " \

    elif algorithm == "bnlearn_sihitonpc":
        return  "Rscript workflow/rules/evaluation/benchmarks/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname replicate        --colval {wildcards.replicate} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname algorithm        --colval " +algorithm+" "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname adjmat           --colval {wildcards.adjmat} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname parameters               --colval {wildcards.bn} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname data             --colval {wildcards.data} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname alpha            --colval {wildcards.alpha} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname cluster          --colval null " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname whitelist        --colval null " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname blacklist        --colval null " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname test             --colval {wildcards.test} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname B                --colval {wildcards.B} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname debug            --colval {wildcards.debug} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname maxsx           --colval {wildcards.maxsx} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname undirected       --colval {wildcards.undirected} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname timeout       --colval {wildcards.timeout} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname time             --colval `cat {input.time}` " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname ntests             --colval `cat {input.ntests}` " \

    elif algorithm == "bnlearn_hpc":
        return  "Rscript workflow/rules/evaluation/benchmarks/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname replicate        --colval {wildcards.replicate} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname algorithm        --colval " +algorithm+" "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname adjmat           --colval {wildcards.adjmat} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname parameters               --colval {wildcards.bn} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname data             --colval {wildcards.data} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname alpha            --colval {wildcards.alpha} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname cluster          --colval null " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname whitelist        --colval null " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname blacklist        --colval null " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname test             --colval {wildcards.test} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname B                --colval {wildcards.B} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname debug            --colval {wildcards.debug} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname maxsx           --colval {wildcards.maxsx} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname undirected       --colval {wildcards.undirected} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname timeout       --colval {wildcards.timeout} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname time             --colval `cat {input.time}` " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname ntests             --colval `cat {input.ntests}` " \

    elif algorithm == "tetrad_fges":
        return  "Rscript workflow/rules/evaluation/benchmarks/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output.res} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname algorithm   --colval tetrad_fges "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname adjmat           --colval {wildcards.adjmat} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname parameters              --colval {wildcards.bn} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname data           --colval {wildcards.data} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname faithfulnessAssumed       --colval {wildcards.faithfulnessAssumed} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname samplePrior       --colval {wildcards.samplePrior} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname structurePrior       --colval {wildcards.structurePrior} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname penaltyDiscount       --colval {wildcards.penaltyDiscount} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname timeout       --colval {wildcards.timeout} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname time        --colval `cat {input.time}` " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname ntests             --colval None " \


    elif algorithm == "tetrad_fci":
        return  "Rscript workflow/rules/evaluation/benchmarks/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output.res} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname algorithm   --colval tetrad_fci "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname adjmat           --colval {wildcards.adjmat} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname parameters              --colval {wildcards.bn} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname data           --colval {wildcards.data} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname alpha       --colval {wildcards.alpha} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname test       --colval {wildcards.test} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname timeout       --colval {wildcards.timeout} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname time        --colval `cat {input.time}` " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname ntests             --colval None " \


    elif algorithm == "tetrad_gfci":
        return  "Rscript workflow/rules/evaluation/benchmarks/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output.res} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname algorithm   --colval tetrad_gfci "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname adjmat           --colval {wildcards.adjmat} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname parameters              --colval {wildcards.bn} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname data           --colval {wildcards.data} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname alpha       --colval {wildcards.alpha} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname score       --colval {wildcards.score} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname test       --colval {wildcards.test} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname timeout       --colval {wildcards.timeout} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname time        --colval `cat {input.time}` " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname penaltyDiscount       --colval {wildcards.penaltyDiscount} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname samplePrior       --colval {wildcards.samplePrior} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname structurePrior       --colval {wildcards.structurePrior} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname ntests             --colval None " \

    elif algorithm == "tetrad_rfci":
        return  "Rscript workflow/rules/evaluation/benchmarks/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output.res} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname algorithm   --colval tetrad_rfci "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname adjmat           --colval {wildcards.adjmat} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname parameters              --colval {wildcards.bn} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname data           --colval {wildcards.data} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname alpha       --colval {wildcards.alpha} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname test       --colval {wildcards.test} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname timeout       --colval {wildcards.timeout} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname time        --colval `cat {input.time}` " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname ntests             --colval None " \

    elif algorithm=="gobnilp":
        return  "Rscript workflow/rules/evaluation/benchmarks/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output.res} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname algorithm   --colval gobnilp "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname parameters              --colval {wildcards.bn} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname palim       --colval {wildcards.palim} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname alpha_mu       --colval {wildcards.alpha_mu} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname alpha_omega_minus_nvars       --colval {wildcards.alpha_omega_minus_nvars} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname alpha       --colval {wildcards.alpha} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname continuous       --colval {wildcards.continuous} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname score_type       --colval {wildcards.score_type} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname time_limit       --colval {wildcards.time_limit} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname gap_limit       --colval {wildcards.gap_limit} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname prune       --colval {wildcards.prune} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname timeout       --colval {wildcards.timeout} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname constraints       --colval {wildcards.constraints} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname extra_args       --colval {wildcards.extra_args} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname time        --colval `cat {input.time}` " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname ntests             --colval None " \

    elif algorithm == "trilearn_pgibbs":
        return "Rscript workflow/rules/evaluation/benchmarks/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname algorithm   --colval trilearn_pgibbs "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname adjmat      --colval {wildcards.adjmat} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname parameters          --colval {wildcards.bn} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname data        --colval {wildcards.data} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname alpha       --colval {wildcards.alpha} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname beta        --colval {wildcards.beta} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname radii       --colval {wildcards.radii} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname n_particles           --colval {wildcards.n_particles} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname M           --colval {wildcards.M} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname pseudo_obs  --colval {wildcards.pseudo_obs} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname alpha       --colval {wildcards.alpha} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname mcmc_seed   --colval {wildcards.mcmc_seed} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname datatype   --colval {wildcards.datatype} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname timeout       --colval {wildcards.timeout} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname time        --colval `cat {input.time}` " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname ntests             --colval None " \

    elif algorithm == "parallelDG":
        ret = "Rscript workflow/rules/evaluation/benchmarks/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output.res} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname replicate       --colval {wildcards.replicate} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname algorithm       --colval "+ algorithm+" " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname parameters              --colval {wildcards.bn} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname time            --colval `cat {input.time}` " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname ntests          --colval None "
        ret += dict_to_summary(config["resources"]["structure_learning_algorithms"][algorithm][0])
        return ret

    elif algorithm == "bidag_order_mcmc":
        return  "Rscript workflow/rules/evaluation/benchmarks/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname algorithm   --colval bidag_order_mcmc "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname parameters              --colval {wildcards.bn} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname scoretype    --colval {wildcards.scoretype} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname chi          --colval {wildcards.chi} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname edgepf       --colval {wildcards.edgepf} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname am           --colval {wildcards.am} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname aw           --colval {wildcards.aw} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname map         --colval {wildcards.MAP} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname plus1         --colval {wildcards.plus1} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname blacklist   --colval null "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname startorder  --colval null "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname scoretable  --colval null "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname moveprobs   --colval null "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname iterations  --colval {wildcards.iterations} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname stepsave    --colval {wildcards.stepsave} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname alpha       --colval {wildcards.alpha} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname cpdag       --colval {wildcards.cpdag} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname gamma       --colval {wildcards.gamma} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname hardlimit   --colval 15 "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname chainout    --colval true "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname scoreout    --colval true "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname verbose     --colval false "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname threshold   --colval {wildcards.threshold} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname startspace_algorithm   --colval {wildcards.startspace_algorithm} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname mcmc_seed   --colval {wildcards.mcmc_seed} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname timeout      --colval {wildcards.timeout} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname time        --colval `cat {input.time}` " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname ntests             --colval None " \

    elif algorithm == "bidag_partition_mcmc":
        return  "Rscript workflow/rules/evaluation/benchmarks/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname algorithm   --colval bidag_partition_mcmc "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname parameters              --colval {wildcards.bn} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname scoretype    --colval {wildcards.scoretype} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname chi          --colval {wildcards.chi} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname edgepf       --colval {wildcards.edgepf} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname am           --colval {wildcards.am} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname aw           --colval {wildcards.aw} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname blacklist   --colval None "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname scoretable  --colval None "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname moveprobs   --colval None "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname startDAG    --colval None "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname iterations  --colval {wildcards.iterations} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname stepsave    --colval {wildcards.stepsave} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname gamma       --colval {wildcards.gamma} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname scoreout    --colval true "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname verbose     --colval {wildcards.verbose} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname startspace_algorithm   --colval {wildcards.startspace_algorithm} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname mcmc_seed   --colval {wildcards.mcmc_seed} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname timeout      --colval {wildcards.timeout} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname time        --colval `cat {input.time}` " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname ntests             --colval None " \

    elif algorithm == "tetrad_fofc":
        return  "Rscript workflow/rules/evaluation/benchmarks/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output.res} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname algorithm   --colval tetrad_fofc "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname adjmat           --colval {wildcards.adjmat} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname parameters              --colval {wildcards.bn} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname data           --colval {wildcards.data} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname timeout       --colval {wildcards.timeout} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname time        --colval `cat {input.time}` " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname ntests             --colval None " \


    elif algorithm == "tetrad_ftfc":
        return  "Rscript workflow/rules/evaluation/benchmarks/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output.res} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname algorithm   --colval tetrad_ftfc "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname adjmat           --colval {wildcards.adjmat} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname parameters              --colval {wildcards.bn} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname data           --colval {wildcards.data} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname timeout       --colval {wildcards.timeout} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname time        --colval `cat {input.time}` " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname ntests             --colval None " \


    elif algorithm == "tetrad_fas":
        return  "Rscript workflow/rules/evaluation/benchmarks/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output.res} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname algorithm   --colval tetrad_fas "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname adjmat           --colval {wildcards.adjmat} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname parameters              --colval {wildcards.bn} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname data           --colval {wildcards.data} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname timeout       --colval {wildcards.timeout} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname time        --colval `cat {input.time}` " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname ntests             --colval None " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname test       --colval {wildcards.test} "\



    elif algorithm == "tetrad_fask":
        return  "Rscript workflow/rules/evaluation/benchmarks/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output.res} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname algorithm   --colval tetrad_fask "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname adjmat           --colval {wildcards.adjmat} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname parameters              --colval {wildcards.bn} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname data           --colval {wildcards.data} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname timeout       --colval {wildcards.timeout} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname time        --colval `cat {input.time}` " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname ntests             --colval None " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname test       --colval {wildcards.test} "\



    elif algorithm == "tetrad_pc-all":
        return  "Rscript workflow/rules/evaluation/benchmarks/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output.res} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname algorithm   --colval tetrad_pc-all "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname adjmat           --colval {wildcards.adjmat} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname parameters              --colval {wildcards.bn} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname data           --colval {wildcards.data} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname test       --colval {wildcards.test} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname timeout       --colval {wildcards.timeout} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname time        --colval `cat {input.time}` " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname ntests             --colval None " \



    elif algorithm == "tetrad_lingam":
        return  "Rscript workflow/rules/evaluation/benchmarks/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output.res} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname algorithm   --colval tetrad_lingam "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname adjmat           --colval {wildcards.adjmat} " \
		" && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname parameters              --colval {wildcards.bn} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname data           --colval {wildcards.data} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname timeout       --colval {wildcards.timeout} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname time        --colval `cat {input.time}` " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname ntests             --colval None " \


    elif algorithm == "tetrad_imgscont":
        return  "Rscript workflow/rules/evaluation/benchmarks/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename {output.res} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname id              --colval {wildcards.id} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname algorithm   --colval tetrad_imgscont "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname adjmat           --colval {wildcards.adjmat} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname parameters              --colval {wildcards.bn} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname data           --colval {wildcards.data} " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname timeout       --colval {wildcards.timeout} "\
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname time        --colval `cat {input.time}` " \
                " && python workflow/rules/evaluation/benchmarks/add_column.py --filename {output} --colname ntests             --colval None " \

