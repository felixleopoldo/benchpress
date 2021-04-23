def docker_image(algorithm):
    if algorithm == "trilearn_loglin":
        return "docker://onceltuca/trilearn:1.23"
    elif algorithm == "gobnilp":
        return "docker://onceltuca/gobnilp:1.6.3"
    elif algorithm == "thomasjava":
        return "docker://onceltuca/thomasgreen:1.0"
    elif algorithm == "notears":
        return "docker://onceltuca/jmoss20notears:1.4"
    elif algorithm == "greenfortran":
        return "docker://onceltuca/guidicigreen1999"
    elif algorithm ==  "pydatascience":
        return "docker://civisanalytics/datascience-python"
    elif algorithm ==  "bidag":
        return "docker://onceltuca/bidag:2.0.0"
    elif algorithm ==  "benchmark":
        return "docker://onceltuca/benchmark:1.0.7"
    elif algorithm ==  "networkx":
        return "docker://onceltuca/networkx:2.5.1"