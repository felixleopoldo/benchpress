# Docker images used in benchpress.

def docker_image(name):
    if name == "trilearn":
        return "docker://onceltuca/trilearn:1.25"
    elif name == "gobnilp":
        return "docker://onceltuca/gobnilp:4347c64"
    elif name == "thomasjava":
        return "docker://onceltuca/thomasgreen:1.19-bp"
    elif name == "notears":
        return "docker://onceltuca/jmoss20notears:1.4-bp"
    elif name == "greenfortran":
        return "docker://onceltuca/guidicigreen1999"
    elif name == "pydatascience":
        return "docker://onceltuca/datascience-python"
    elif name == "bidag":
        return "docker://onceltuca/bidag:2.0.3"
    elif name == "bnlearn":
        return "docker://onceltuca/bnlearn:4.7"
    elif name == "pcalg":
        return "docker://onceltuca/pcalg:2.7-3"
    elif name == "benchmark":
        return "docker://onceltuca/benchpress:1.2.0"
    elif name == "networkx":
        return "docker://onceltuca/networkx:2.5.1"
    elif name == "bdgraph":
        return "docker://onceltuca/bdgraph:2.64"
    elif name == "tetrad":
        return "docker://onceltuca/causal-cmd:1.1.3"
    elif name == "dualpc":
        return "docker://onceltuca/dualpc"
    elif name == "rbase":
        return "docker://r-base"
    elif name == "parallelDG":
        return "docker://hallawalla/paralleldg:0.8"
    elif name == "gcastle":
        return "docker://onceltuca/gcastle:1.0.3"
    elif name == "tidyverse":
        return "docker://onceltuca/tidyverse"
    elif name == "causaldag":
        return "docker://onceltuca/causaldag:0.1a163"
    elif name == "causalCMD":
        return "docker://onceltuca/causal-cmd:1.1.3"

