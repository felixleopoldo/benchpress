# Docker images used in benchpress.

def docker_image(name):
    if name == "trilearn":
        return "docker://bpimages/trilearn:1.25"
    elif name == "pydatascience":
        return "docker://bpimages/datascience-python"
    elif name == "bidag":
        return "docker://bpimages/bidag:2.0.3"
    elif name == "bnlearn":
        return "docker://bpimages/bnlearn:4.7"
    elif name == "pcalg":
        return "docker://bpimages/pcalg:2.7-3"
    elif name == "benchmark":
        return "docker://bpimages/benchpress:1.2.0"
    elif name == "networkx":
        return "docker://bpimages/networkx:2.5.1"
    elif name == "rbase":
        return "docker://r-base"
    elif name == "tidyverse":
        return "docker://bpimages/tidyverse"
