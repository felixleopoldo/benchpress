
if "notears" in pattern_strings:

    rule notears:
        input:
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("notears"),
            time=alg_output_time_path("notears"),
        container:
            docker_image("notears")
        shell:
            """ 
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