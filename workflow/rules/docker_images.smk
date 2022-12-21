# Docker images used in benchpress.

def docker_image(name):
    if name == "trilearn":
        return "docker://onceltuca/trilearn:1.25"
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
    elif name == "rbase":
        return "docker://r-base"
    elif name == "tidyverse":
        return "docker://onceltuca/tidyverse"
