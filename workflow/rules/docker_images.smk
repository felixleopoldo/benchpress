# Docker images used in benchpress.

def docker_image(name):
    if name == "trilearn":
        return "docker://bpimages/trilearn:2.0.2-arm64"
    elif name == "pydatascience":
        return "docker://bpimages/datascience-python-arm64"
    elif name == "bidag":
        return "docker://bpimages/bidag:2.1.4-arm64"
    elif name == "bnlearn":
        return "docker://bpimages/bnlearn:4.8.3-arm64"
    elif name == "pcalg":
        return "docker://bpimages/pcalg:2.7-8-arm64"
    elif name == "benchmark":
        return "docker://bpimages/benchpress:2.1.0-arm64"
    elif name == "networkx":
        return "docker://bpimages/networkx:2.5.1-arm64"
    elif name == "rbase":
        return "docker://r-base"
    elif name == "tidyverse":
        return "docker://bpimages/tidyverse-arm64"
