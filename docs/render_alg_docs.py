from pathlib import Path
import json

"""
"""

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
    tab += "     - `"+info["docker_image"]+" <"+info["docker_image"]+">`_\n"
    tab += "   * - Module\n"
    tab += "     - `"+p.name+" <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/"+p.name+">`_\n"
    

    tab += "\n"
    return tab

def info_to_table2(json, p):
    
    tab = "| Title: "
    tab += p.name +"\n"
    tab += "| Package: "
    tab += "`"+info["package"]["title"]+" <"+info["package"]["url"]+">`_ \n"
    tab += "| Paper: "
    for i in range(len(info["papers"])):
        tab += "`"+info["papers"][i]["title"]+" <"+info["papers"][i]["url"]+">`_, "
    tab += ""
    tab = tab[:-2]
    tab += "\n"
    tab += "| Graph types: "
    for i in range(len(info["graph_types"])):
        tab += ""+info["graph_types"][i] +", "

    tab = tab[:-2]

    tab += "\n"
    tab += "| Version: "
    tab += ""+info["version"]+"\n"
    tab += "| Docs: "
    tab += "`here <"+info["docs_url"]+">`_\n"
    tab += "| Docker image: "
    tab += "`"+info["docker_image"]+" <"+info["docker_image"]+">`_ \n"
    tab += "| Language: "
    tab += ""+info["language"]+"\n"
    tab += "| Module directory: "
    tab += "`"+p.name+" <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/"+p.name+">`_\n"
    

    tab += "\n"
    return tab



algspath = Path("../workflow/rules/structure_learning_algorithms")



for p in algspath.iterdir():
    print(p.name)
    if p.name == "docs.rst":
        continue
    d = p/"docs.rst"
    j = p/"info.json"
    s = p/"schema.json"
    
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


    with open(s) as json_file:    
        schema = json.load(json_file)
    
    if "$ref" in schema["items"]:
        schema["items"] = schema["definitions"][p.name]
    
    if "definitions" in schema:
        schema.pop("definitions")

    # with open(s, "w") as outfile:
    #     outfile.write(json.dumps(schema, indent=4))

    #print(schema)

if (algspath / "docs.rst").is_file():
    f = open(algspath / "docs.rst", "r")
    content = f.read()


str = ""
str += "``"+algspath.name+"``\n"
str += "="*len(algspath.name) + "="*10
str += "\n\n"
str += content
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
    with open(s) as json_file:    
        schema = json.load(json_file)
    
        if "examples" in schema["items"]:
            dump = json.dumps(schema["items"]["examples"], indent=2)
        else: dump = ""
    
  
    str += "\n\n"
    str += "\n\n"
    str +="``" + p.name +"`` \n"
    str +="-"*len(p.name) + "-"*4 + "\n"

    
    str += "\n\n"
    str += ".. rubric:: "+ info["title"]    
    str += "\n\n"
    str += info_to_table(info, p)
    str += "\n\n"
    str += ".. rubric:: Description"    
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

with open("source/available_structure_learning_algorithms.rst", "w") as text_file:
    text_file.write(str)