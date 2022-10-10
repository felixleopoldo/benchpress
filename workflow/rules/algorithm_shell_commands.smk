# This is a function which returns the shell commands for most of the algorithms.
# It could also had been a dict.

def alg_shell(algorithm):

    if algorithm == "gg99_singlepair_fortran":
        return  "out=$RANDOM.csv " \
                "&& data=$RANDOM.csv " \
                "&& cp {input.data} $data " \
                "&& /ggsampler/jt -v`head -1 {input.data} | sed 's/[^,]//g' | wc -c` -n{wildcards.n} -b0 -m3 $data -pfx $out -s {wildcards.replicate} " \
                "&& mv $out {output.adjvecs} "\
                "&& rm $data "\
                "&& echo 1 > {output.time}"
