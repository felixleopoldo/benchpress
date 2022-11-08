from pathlib import Path
import json

"""
"""

algspath = Path("../workflow/rules/structure_learning_algorithms")



for p in algspath.iterdir():
    # print(p)
    d = p/"docs.rst"
    j = p/"info.json"

    if not j.is_file():
        info = {
            "title": p.name,
            "docker_image": "docker://",
            "version": "v0.0.1",
            "package": {"title": "", "url": "http"},
            "docs_url": "",
            "papers": [
                {
                    "title": "the paper title",
                    "url": "the_url"
                }
            ],
            "outputs": ["adjmat"],
            "graph_types": [
                ""
            ],
            "language": ""
        }
        
        with open(j, "w") as outfile:
            outfile.write(json.dumps(info, indent=4))
str = ""

for p in algspath.iterdir():
    #print(p.name)
    
    str += "\n\n"
    str += "\n\n"
    str +="``" + p.name +"`` \n"
    str +="-"*len(p.name) + "-"*4 + "\n"
    d = p/"docs.rst"
    j = p/"info.json"
    s = p/"schema.json"
    if d.is_file():
        f = open(d, "r")
        content = f.read()

    with open(j) as json_file:
        info = json.load(json_file)
        #info = json.dumps(info, indent=2)
        #print(info)
    
    schema = None    
    with open(s) as json_file:    
        schema = json.load(json_file)
    
    if "definitions" in schema:
        if "examples" in schema["definitions"][p.name]:
            dump = json.dumps(schema["definitions"][p.name]["examples"], indent=2)


    tab = ".. list-table:: infotable\n\n"
    tab += "    :widths: 15 10 \n"
    tab += "    :header-rows: 0\n\n"
    tab += "    *  - Title\n"
    tab += "       - "+p.name+"\n"
    tab += "    *  - Package\n"
    tab += "       - `"+info["package"]["title"]+"<"+info["package"]["url"]+">`_\n"

    tab += "    *  - Paper\n"
    for i in range(len(info["papers"])):
        tab += "       - `"+info["papers"][i]["title"]+"<"+info["papers"][i]["url"]+">`_, "
    tab += "\n"
    tab = tab[:-2]
    tab += "\n"
    tab += "    *  - Graph types\n"
    for i in range(len(info["graph_types"])):
        tab += "       - "+info["graph_types"][i] +", "

    tab = tab[:-2]

    tab += "\n"
    tab += "    *  - Version\n"
    tab += "       - "+info["version"]+"\n"
    tab += "    *  - Docs\n"
    tab += "       - `here<"+info["docs_url"]+">`_\n"

    tab += "    *  - Docker image\n"
    tab += "       - "+info["docker_image"]+"\n"
    tab += "    *  - Language\n"
    tab += "       - "+info["language"]+"\n"
    tab += "    *  - Module directory\n"
    tab += "       - `"+p.name+"<https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/"+p.name+">`_\n"
    
    tab += "\n"
    tab += "\n"
    tab += "\n"

    str += "\n\n"
    str += tab
    str += "\n\n"
    if content != "":    
        str += "\n\n"
        str += content
    str += "\n\n"
    str += ".. rubric:: Example"
    str += "\n\n\n"
    str += ".. code-block:: json"    
    str += "\n\n"
    str += '    '.join(('\n'+dump.lstrip()).splitlines(True))
    

print(str)