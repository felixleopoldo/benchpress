# Docker images used in benchpress.

def docker_image(name):
    if name == "trilearn":
        return "docker://bpimages/trilearn:2.0.5"
    elif name == "pydatascience":
        return "docker://bpimages/datascience-python:1.1"
    elif name == "bidag":
        return "docker://bpimages/bidag:2.1.4"
    elif name == "bnlearn":
        return "docker://bpimages/bnlearn:4.8.3"
    elif name == "pcalg":
        return "docker://bpimages/pcalg:2.7-8"
    elif name == "benchmark":
        return "docker://bpimages/benchpress:2.1.0"
