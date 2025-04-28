def str2link(s):
    
    if s == "DG":
        return "`DG <https://en.wikipedia.org/wiki/Chordal_graph>`__"
    if s == "UG":
        return "`UG <https://en.wikipedia.org/wiki/Graph_(discrete_mathematics)#Graph>`__"
    if s == "UDG":
        return "`UDG <https://arxiv.org/pdf/2210.00822.pdf#subsection.2.2>`__"
    if s == "CG":
        return "`CG <https://en.wikipedia.org/wiki/Mixed_graph>`__"
    if s == "DAG":
        return "`DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__"
    if s == "PAG":
        return "`PAG <https://cmu-phil.github.io/tetrad/manual/#appendix>`__"
    if s == "CPDAG":
        return "`CPDAG <https://search.r-project.org/CRAN/refmans/pcalg/html/dag2cpdag.html>`__"
    if s == "MPDAG":
        return "`MPDAG <https://auai.org/uai2017/proceedings/papers/120.pdf>`__"
    if s == "TMPDAG":
        return "`TMPDAG <https://proceedings.mlr.press/v216/bang23a.html>`__"
    if s == "R":
        return "`R <https://www.r-project.org/>`__"
    if s == "Python":
        return "`Python <https://www.python.org/>`__"
    if s in ["java", "Java"]:
        return "`Java <https://www.java.com/en/>`__"
    if s == "C":
        return "`C <https://en.wikipedia.org/wiki/C_(programming_language)>`__"
    if s == "continuous":
        return "C"
    if s == "binary":
        return "B"
    if s == "mixed":
        return "M"
    if s == "discrete":
        return "D"
    if s in ["MNAR","MCAR","MAR"]:
        return "`"+s+" <https://en.wikipedia.org/wiki/Missing_data#Missing_completely_at_random>`__"
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
