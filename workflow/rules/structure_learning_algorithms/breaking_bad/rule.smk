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
    container:
        # Built from LGAI-Research/breaking-bad (see the Dockerfile in this
        # directory for how). Points at a local .sif (gitignored -- see
        # resources/local_images/), not pushed anywhere since it embeds
        # XGES's BICScorer.h/.cpp, which XGES itself does not license for
        # redistribution. Swap for "docker://bpimages/breaking-bad:<tag>"
        # once/if a private or otherwise appropriate registry copy exists.
        "resources/local_images/breaking-bad_09d621a.sif"
    script:
        "script.py"
