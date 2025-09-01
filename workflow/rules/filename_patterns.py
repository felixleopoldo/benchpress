# A number of code snippets, just to reduce duplication.
# The function names are sometimes a bit misleading.

# MCMC stuff
def adjmat_estimate_path_mcmc(algorithm):
    ret = "{output_dir}/adjmat_estimate/"\
        "adjmat=/{adjmat}/"\
        "parameters=/{bn}/"\
        "data=/{data}/"\
        "algorithm=/" + pattern_strings[algorithm] + "/" + pattern_strings["mcmc_est"] + "/" \
        "seed={seed}/" \
        "adjmat.csv"
    return ret


def alg_output_seqgraph_path_fine_match(algorithm):
    return "{output_dir}/adjvecs/"\
        "adjmat=/{adjmat}/"\
        "parameters=/{bn}/"\
        "data=/{data}/"\
        "algorithm=/" + pattern_strings[algorithm] + "/" + \
        "seed={seed}/" \
        "adjvecs.csv"


def alg_output_seqgraph_path(algorithm):
    return "{output_dir}/adjvecs/{data}/"\
        "algorithm=/" + pattern_strings[algorithm] + "/" + \
        "seed={seed}/" \
        "adjvecs_tobecompressed.csv"


def alg_output_seqgraph_path_nocomp(algorithm):
    return "{output_dir}/adjvecs/{data}/"\
        "algorithm=/" + pattern_strings[algorithm] + "/" + \
        "seed={seed}/" \
        "adjvecs.csv"

# Standard algorithms

def alg_output_adjmat_path(algorithm):
    """ The data wildcard contains info about adjmat and parameters. Bad naming..
        It is used in alg_input_data() below.    
    """

    return "{output_dir}/adjmat_estimate/{data}/"\
        "algorithm=/" + pattern_strings[algorithm] + "/" +\
        "seed={seed}/" \
        "adjmat.csv"


def alg_output_time_path(algorithm):
    return "{output_dir}/time/{data}/"\
        "algorithm=/" + pattern_strings[algorithm] + "/" +\
        "seed={seed}/" \
        "time.txt"

# This is code repetition, yes...
def alg_output_ntests_path(algorithm):
    return "{output_dir}/ntests/{data}/"\
        "algorithm=/" + pattern_strings[algorithm] + "/" +\
        "seed={seed}/" \
        "ntests.txt"

def alg_input_data():
    return "{output_dir}/data/{data}/seed={seed}.csv"


def time_path(algorithm):
    ret = "{output_dir}/time/"\
        "adjmat=/{adjmat}/"\
        "parameters=/{bn}/"\
        "data=/{data}/"\
        "algorithm=/" + pattern_strings[algorithm] + "/" + \
        "seed={seed}/" \
        "time.txt"
    return ret


def data_path():
    return "{output_dir}/data/adjmat=/{adjmat}/parameters=/{bn}/data=/{data}/seed={seed}.csv"


def adjmat_true_path():
    return "{output_dir}/adjmat/{adjmat}.csv",
