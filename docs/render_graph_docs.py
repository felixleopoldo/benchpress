from pathlib import Path
import json
from docs_utils import *
import bibtexparser

def info_to_table(json, p):
    tab = ".. list-table:: \n\n"#+p.name+"\n\n"
    tab += "   * - Package\n"    
    tab += "     - `"+info["package"]["title"]+" <"+info["package"]["url"]+">`__\n"
    tab += "   * - Version\n"
    tab += "     - "+info["version"]+"\n"
    tab += "   * - Language\n"
    tab += "     - "+str2link(info["language"])+"\n"
    tab += "   * - Docs\n"
    if info["docs_url"] == "":
        tab += "     - \n"
    else:
        tab += "     - `here <"+info["docs_url"]+">`__\n"
    tab += "   * - Paper\n"  
    tab += "     - "
    if (p/'bibtex.bib').is_file():
        with open(p/'bibtex.bib') as bibtex_file:
            bibtex_database = bibtexparser.load(bibtex_file)        

        if len(bibtex_database.entries) > 0:            
            for ref in bibtex_database.entries:                
                tab += ":footcite:t:`"+ref["ID"] +"`, "
        else:
            tab += "  "
    else:
        tab += "  "
    tab = tab[:-2]
    tab += "\n"
    tab += "   * - Graph type\n"
    tab += "     - "
    for i in range(len(info["graph_types"])):
        tab += str2link(info["graph_types"][i]) +", "
    tab = tab[:-2]
    tab += "\n"
    tab += "   * - Docker \n"
    tab += "     - " +get_docker_img(p / "rule.smk") + "\n"
    #    tab += "   * - Docker\n"
#    tab += "     - `"+info["docker_image"]+" <https://hub.docker.com/r/"+info["docker_image"].split("/")[0]+"/"+info["docker_image"].split("/")[1].split(":")[0]+">`_\n"
    tab += "   * - Module\n"
    tab += "     - `"+p.name+" <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/graph/"+p.name+">`__\n"
    tab += "\n"
    return tab

def info_to_small_table():
    algspath = Path("../workflow/rules/graph")
    tab = ""
    tab += ".. list-table:: \n"#+p.name+"\n\n"
    tab +="   :header-rows: 1 \n\n"
    tab += "   * - Method\n" 
    tab += "     - Graph type\n" 
    #tab += "     - Language\n" 
    tab += "     - Package\n" 
    tab += "     - Version\n" 
    tab += "     - Module\n" 
    
    for p in sorted(algspath.iterdir()):
        if p.name.startswith("."):
            continue
        j = p/"info.json"

        with open(j) as json_file:
            info = json.load(json_file)

        if "in_docs" in info and info["in_docs"] is False:
            continue

        #tab += "     - "+info["title"]+"\n"
        tab += "   * - "+info["title"]+"\n"
        tab += "     - "
        for i in range(len(info["graph_types"])):
            tab += str2link(info["graph_types"][i]) +", "

        tab = tab[:-2]
        
        tab += "\n"
        #tab += "     - "+info["language"]+"\n"
        if info["package"]["url"]:
            tab += "     - `"+info["package"]["title"]+" <"+info["package"]["url"]+">`__\n"    
        else:
            tab += "     - "+info["package"]["title"]+"\n"    
        tab += "     - "+info["version"]+"\n"
        tab += "     - :ref:`"+p.name+"` \n"    
        
    tab += "\n"
    return tab


algspath = Path("../workflow/rules/graph")

f = open("source/graphs_desc.rst", "r")
content = f.read()
str= """
All the modules run in Apptainer (Singularity) containers created from the Docker images corresponding used by the modules.
To start an interactive `Docker <https://www.docker.com/>`_ shell for a module run

 .. prompt:: bash

     docker run -it username/image:version

 or using `Apptainer <https://apptainer.org/>`_

 .. prompt:: bash

     apptainer run docker://username/image:version


"""
str = """The names of the fields of the modules are directly transferred or translated from the original libraries or code. 
Thus, for further details of each field see the documentation of the original sources.
Most of the parameters can be given as either a single value or a list.
However, some parametrers might be missing for some modules, to see which parameters are available please review the JSON schemas.
Dots (.) in the original parameter names are omitted for implementational reasons.


"""
str += ".. _"+algspath.name+": \n\n"
#str += "``"+algspath.name+"``\n"
str += "Graphs\n"
str += "="*len(algspath.name) + "="*10
str += "\n\n"


str += """.. toctree::
    :hidden:
    :glob:
    :maxdepth: 3
    :name: Graph modules
    :caption: Graph modules
    
"""
for p in sorted(algspath.iterdir()):
    if not p.is_dir():
        continue
    if p.name == "docs.rst" or p.name == ".DS_Store":
        continue
    str += "    graph/{}\n".format(p.name)


str += content # the overall description
str += "\n\n"

str += info_to_small_table()
str += "\n\n"
for p in sorted(algspath.iterdir()):
    if p.name == "docs.rst":
        continue
    if p.name.startswith("."):
        continue
    
    d = p/"docs.rst"
    j = p/"info.json"
    s = p/"schema.json"
    if d.is_file():
        f = open(d, "r")
        content = f.read()

    with open(j) as json_file:
        info = json.load(json_file)

    if "in_docs" in info and info["in_docs"] is False:
        continue
    
    schema = None
    dump = ""
    if s.is_file(): # fixed module has no schema.
        with open(s) as json_file:    
            schema = json.load(json_file)
        
            if "examples" in schema["items"]:
                dump = json.dumps(schema["items"]["examples"], indent=2)

    # This is the module part
    module_str = "\n\n"
    module_str += ".. _"+p.name+": \n\n"
    module_str +="" + p.name +" \n"
    module_str +="-"*len(p.name) + "-"*4 + "\n"    
    module_str += "\n"
    module_str += ".. rubric:: "+ info["title"]    
    module_str += "\n\n"
    if p.name != "fixed_graph":
        module_str += info_to_table(info, p)
        module_str += "\n\n"
    module_str += ".. rubric:: Description"    
    if content != "":    
        module_str += "\n\n"
        module_str += content
    if dump != "":
        module_str += "\n\n"
        module_str += ".. rubric:: Example"
        module_str += "\n\n\n"
        module_str += ".. code-block:: json"    
        module_str += "\n\n"
        module_str += '    '.join(('\n'+dump.strip()).splitlines(True))
    module_str += "\n\n"
    module_str += ".. footbibliography::"
    module_str += "\n\n"
    
    with open("source/graph/{}.rst".format(p.name), "w") as text_file:
        text_file.write(module_str)

with open("source/available_graphs.rst", "w") as text_file:
    text_file.write(str)