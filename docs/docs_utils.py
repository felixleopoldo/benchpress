def str2link(s):
    
    if s == "DG":
        return "`DG <https://en.wikipedia.org/wiki/Chordal_graph>`__"
    if s == "UG":
        return "`UG <https://en.wikipedia.org/wiki/Graph_(discrete_mathematics)#Graph>`__"
    if s == "CG":
        return "`CG <https://en.wikipedia.org/wiki/Mixed_graph>`__"
    if s == "DAG":
        return "`DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__"
    if s == "PAG":
        return "`PAG <https://cmu-phil.github.io/tetrad/manual/#appendix>`__"
    if s == "CPDAG":
        return "`CPDAG <https://search.r-project.org/CRAN/refmans/pcalg/html/dag2cpdag.html>`__"
    if s == "R":
        return "`R <https://www.r-project.org/>`__"
    if s == "Python":
        return "`Python <https://www.python.org/>`__"
    if s in ["java", "Java"]:
        return "`Java <https://www.java.com/en/>`__"
    if s == "C":
        return "`C <https://en.wikipedia.org/wiki/C_(programming_language)>`__"
    if s == "continuous":
        return "cont"
    if s == "binary":
        return "bin"
    if s == "interventional":
        return "interv"
    return s

def get_docker_img(rulefile):
    import re
    with open(rulefile,"r") as file_one:
        for line in file_one:
            if "docker" in line:
                str = line.strip().replace('"','')
                str = str.replace("docker://","")
                url = "`"+str+" <https://hub.docker.com/r/"+str.split("/")[0]+"/"+str.split("/")[1].split(":")[0]+"/tags>`__\n"
                return url 

    return "None"
