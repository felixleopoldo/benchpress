# Docker images used in benchpress.

def docker_image(algorithm):
    if algorithm == "trilearn":
        return "docker://onceltuca/trilearn:1.23"
    elif algorithm == "gobnilp":
        return "docker://onceltuca/gobnilp:master_e60ef14"
    elif algorithm == "thomasjava":
        return "docker://onceltuca/thomasgreen:1.19"
    elif algorithm == "notears":
        return "docker://onceltuca/jmoss20notears:1.4"
    elif algorithm == "greenfortran":
        return "docker://onceltuca/guidicigreen1999"
    elif algorithm == "pydatascience":
        return "docker://civisanalytics/datascience-python"
    elif algorithm == "bidag":
        return "docker://onceltuca/bidag:2.0.2"
    elif algorithm == "benchmark":
        return "docker://onceltuca/benchmark:1.0.8"
    elif algorithm == "networkx":
        return "docker://onceltuca/networkx:2.5.1"
    elif algorithm == "bdgraph":
        return "docker://onceltuca/bdgraph:2.64"
    elif algorithm == "tetrad":
        return "docker://onceltuca/causal-cmd:1.1.3"