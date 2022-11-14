from pathlib import Path
import json


def info_to_table(json, p):
    tab = ".. list-table:: \n\n"#+p.name+"\n\n"
    #tab += "   * - Title\n"
    #tab += "     - "+info["title"]+"\n"
    tab += "   * - Package\n"
    tab += "     - `"+info["package"]["title"]+" <"+info["package"]["url"]+">`_\n"
    tab += "   * - Version\n"
    tab += "     - "+info["version"]+"\n"
    tab += "   * - Language\n"
    tab += "     - "+info["language"]+"\n"
    tab += "   * - Docs\n"
    tab += "     - `here <"+info["docs_url"]+">`_\n"
    tab += "   * - Paper\n"
    for i in range(len(info["papers"])):
        tab += "     - `"+info["papers"][i]["title"]+" <"+info["papers"][i]["url"]+">`_, "  
    tab = tab[:-2]
    tab += "\n"
    tab += "   * - Graph type\n"
    for i in range(len(info["graph_types"])):
        tab += "     - "+info["graph_types"][i] +", "
    tab = tab[:-2]
    tab += "\n"
    tab += "   * - Docker\n"
    tab += "     - `"+info["docker_image"]+" <https://hub.docker.com/r/"+info["docker_image"].split("/")[0]+"/"+info["docker_image"].split("/")[1].split(":")[0]+">`_\n"
    tab += "   * - Module\n"
    tab += "     - `"+p.name+" <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/graph/"+p.name+">`__\n"
    tab += "\n"
    return tab

def info_to_small_table():
    algspath = Path("../workflow/rules/graph")
    tab = ""
    tab += ".. list-table:: \n"#+p.name+"\n\n"
    tab +="   :header-rows: 1 \n\n"
    tab += "   * - Algorithm\n" 
    tab += "     - Graph\n" 
    tab += "     - Language\n" 
    tab += "     - Package\n" 
    tab += "     - Version\n" 
    tab += "     - Module\n" 
    
    for p in sorted(algspath.iterdir()):

        j = p/"info.json"

        with open(j) as json_file:
            info = json.load(json_file)
        #tab += "     - "+info["title"]+"\n"
        tab += "   * - "+info["title"]+"\n"
        for i in range(len(info["graph_types"])):
            tab += "     - "+info["graph_types"][i] +", "
        tab = tab[:-2]
        
        tab += "\n"
        tab += "     - "+info["language"]+"\n"
        tab += "     - `"+info["package"]["title"]+" <"+info["package"]["url"]+">`_\n"    
        tab += "     - "+info["version"]+"\n"
        tab += "     - "+p.name+"_ \n"    
        
    tab += "\n"
    return tab


algspath = Path("../workflow/rules/graph")

f = open("source/graphs_desc.rst", "r")
content = f.read()

str = ""
str += "``"+algspath.name+"``\n"
str += "="*len(algspath.name) + "="*10
str += "\n\n"
str += content
str += "\n\n"

str += info_to_small_table()
str += "\n\n"
for p in sorted(algspath.iterdir()):
    #print(p.name)
    if p.name == "docs.rst":
        continue
    
    d = p/"docs.rst"
    j = p/"info.json"
    s = p/"schema.json"
    if d.is_file():
        f = open(d, "r")
        content = f.read()

    with open(j) as json_file:
        info = json.load(json_file)

    
    schema = None
    dump = ""
    if s.is_file(): # fixed module has no schema.
        with open(s) as json_file:    
            schema = json.load(json_file)
        
            if "examples" in schema["items"]:
                dump = json.dumps(schema["items"]["examples"], indent=2)

    
  
    #str += "\n\n\n"
    #str +=".. _" + p.name +": "
    str += "\n\n"
    str +="``" + p.name +"`` \n"
    str +="-"*len(p.name) + "-"*4 + "\n"

    
    str += "\n"
    str += ".. rubric:: "+ info["title"]    
    str += "\n\n"
    if p.name != "fixed":
        str += info_to_table(info, p)
        str += "\n\n"
    str += ".. rubric:: Description"    
    if content != "":    
        str += "\n\n"
        str += content
    if dump != "":
        str += "\n\n"
        str += ".. rubric:: Example"
        str += "\n\n\n"
        str += ".. code-block:: json"    
        str += "\n\n"
        str += '    '.join(('\n'+dump.lstrip()).splitlines(True))

print(str)

with open("source/available_graphs.rst", "w") as text_file:
    text_file.write(str)