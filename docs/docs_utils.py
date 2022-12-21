
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
