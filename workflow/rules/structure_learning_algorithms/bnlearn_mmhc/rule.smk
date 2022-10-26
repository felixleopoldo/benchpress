if "bnlearn_mmhc" in pattern_strings:

    rule mmhc:
        input:
            "workflow/scripts/structure_learning_algorithms/bnlearn_mmhc.R",
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("bnlearn_mmhc"),
            time=alg_output_time_path("bnlearn_mmhc"),
            ntests=alg_output_ntests_path("bnlearn_mmhc"),
        script:
            "../scripts/structure_learning_algorithms/bnlearn_mmhc.R"