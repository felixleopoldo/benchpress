rule:
    """
    The variable module_name is determined from the folder name
    and set in the Snakefile.
    """
    name:
        module_name
    input:
        data = alg_input_data()
    output:
        adjmat = alg_output_adjmat_path(module_name),
        time = alg_output_time_path(module_name),
        ntests = alg_output_ntests_path(module_name)
    resources:
        # Consumes one GPU slot when the scheduler is limited with
        # ``--resources gpu=1`` (RunPod / multi-job GPU hosts). Unconstrained
        # by default if ``--resources gpu=...`` is omitted.
        gpu=1
    container:
        # Immutable version tag (never :latest) for upstream reproducibility.
        "docker://ghcr.io/kazuyamagiwa/causal_automata:0.3.6"
    script:
        "script.py"
