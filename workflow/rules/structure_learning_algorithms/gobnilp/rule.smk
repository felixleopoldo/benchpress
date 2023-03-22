"""
    The shell commands should be put in a separate bash script.
"""

rule gobnilp:
    input:
        data=alg_input_data(),
        extra_args="resources/extra_args/{extra_args}",
        constraints="resources/constraints/{constraints}",
    output:
        adjmat=alg_output_adjmat_path("gobnilp"),
        time=alg_output_time_path("gobnilp"),
        ntests=touch(alg_output_ntests_path("gobnilp"))
    container:
        "docker://bpimages/gobnilp:4347c64"
    shell:
        """touch {output.adjmat}.gobnilp.set
            echo -e gobnilp/outputfile/adjacencymatrix = \134\\042{output.adjmat}\134\\042 > {output.adjmat}.gobnilp.set
            echo -e gobnilp/outputfile/scoreandtime = \134\\042{output.adjmat}.scoretime\134\\042 >> {output.adjmat}.gobnilp.set
            echo -e gobnilp/dagconstraintsfile = \134\\042{input.constraints}\134\\042 >> {output.adjmat}.gobnilp.set
            echo -e misc/catchctrlc = FALSE >> {output.adjmat}.gobnilp.set
            echo -e gobnilp/writebestsols = TRUE >> {output.adjmat}.gobnilp.set
            if [ {wildcards.continuous} = \"True\" ]; then
                echo -e gobnilp/scoring/continuous = TRUE >> {output.adjmat}.gobnilp.set
                echo -e gobnilp/scoring/score_type = \134\\042{wildcards.score_type}\134\\042 >> {output.adjmat}.gobnilp.set
                echo -e gobnilp/scoring/alpha_mu = {wildcards.alpha_mu} >> {output.adjmat}.gobnilp.set
                echo -e gobnilp/scoring/alpha_omega_minus_nvars = {wildcards.alpha_omega_minus_nvars} >> {output.adjmat}.gobnilp.set ;
            fi
            if [ {wildcards.continuous} = \"False\" ]; then
                echo -e gobnilp/scoring/alpha = {wildcards.alpha} >> {output.adjmat}.gobnilp.set ;
            fi
            echo -e gobnilp/scoring/palim = {wildcards.palim} >> {output.adjmat}.gobnilp.set
            if [ {wildcards.time_limit} != \"None\" ]; then
                echo -e limits/time = {wildcards.time_limit} >> {output.adjmat}.gobnilp.set ;
            fi
            if [ {wildcards.gap_limit} != \"None\" ]; then
                echo -e limits/gap = {wildcards.gap_limit} >> {output.adjmat}.gobnilp.set ;
            fi
            echo -e gobnilp/scoring/prune = {wildcards.prune} >> {output.adjmat}.gobnilp.set
            echo -e gobnilp/delimiter = \134\042,\134\042 >> {output.adjmat}.gobnilp.set
            cat resources/extra_args/{wildcards.extra_args} >> {output.adjmat}.gobnilp.set
            if [ {wildcards.timeout} != \"None\" ]; then                    
                (timeout --signal=SIGKILL {wildcards.timeout} bash -c '/myappdir/gobnilp/bin/gobnilp -f=dat -g={output.adjmat}.gobnilp.set {input.data}' || exit 0)
            else
                /myappdir/gobnilp/bin/gobnilp -f=dat -g={output.adjmat}.gobnilp.set {input.data};
            fi
            if [ -f {output.adjmat} ]; then
                sed --in-place s/\ /,/g {output.adjmat}
                head -n 1 {input.data} > {output.adjmat}.header
                cat {output.adjmat} >> {output.adjmat}.header
                awk '{{print $2}}' {output.adjmat}.scoretime > {output.time}
                mv {output.adjmat}.header {output.adjmat}
                rm -f {output.adjmat}.scoretime;
            else
                touch {output.adjmat}
                echo None > {output.time};
            fi
            rm -f {output.adjmat}.gobnilp.set """