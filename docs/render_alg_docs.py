from pathlib import Path
import json
from docs_utils import *
import bibtexparser

def info_to_table(info, p):
    tab = ".. list-table:: \n\n"#+p.name+"\n\n"

    tab += "   * - Module name\n"
    tab += "     - `"+p.name+" <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/"+p.name+">`__\n"

    if info["package"]["title"] == "":
        
        tab += "   * - Package\n"    
        tab += "     - \n"
        tab += "   * - Version\n"
        tab += "     - \n"
    else:
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
    # for i in range(len(info["papers"])):
    #     if info["papers"][i]["title"] != "":
    #         tab += "`"+info["papers"][i]["title"]+" <"+info["papers"][i]["url"]+">`_, "  
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
    tab += "   * - Data type\n"
    tab += "     - "
    if len(info["data_types"]) > 0:
        for i in range(len(info["data_types"])):
            tab += str2link(info["data_types"][i]) +", "
        tab = tab[:-2]
    tab += "\n"
    tab += "   * - Data missingness\n"
    tab += "     - "
    if len(info["data_missingness"]) > 0:
        for i in range(len(info["data_missingness"])):
            tab += str2link(info["data_missingness"][i]) +", "
        tab = tab[:-2]
    tab += "\n"
    tab += "   * - Intervention type\n"
    tab += "     - "
    if len(info["intervention_types"]) > 0:
        for i in range(len(info["intervention_types"])):
            tab += str2link(info["intervention_types"][i]) +", "
        tab = tab[:-2]
    tab += "\n"
    tab += "   * - Docker \n"
    tab += "     - " +get_docker_img(p / "rule.smk") + "\n"
    #tab += "     - `"+info["docker_image"]+" <https://hub.docker.com/r/"+info["docker_image"].split("/")[0]+"/"+info["docker_image"].split("/")[1].split(":")[0]+">`__\n"
    
    tab += "\n"
    return tab

# This is the table with allr the algorithms
def info_to_small_table():
    algspath = Path("../workflow/rules/structure_learning_algorithms")
    tab = ""
    tab += ".. list-table:: \n"#+p.name+"\n\n"
    tab +="   :header-rows: 1 \n\n"
    tab += "   * - Algorithm\n" 
    tab += "     - Package\n" 
    #tab += "     - Module\n" 
    tab += "     - Graph\n" 
    tab += "     - Data\n" 
    tab += "     - Data missingness\n" 
    tab += "     - Intervention type\n"
    

    
    
    # sort by title
    algs = []
    for p in algspath.iterdir():
        if not p.is_dir():
            continue
        if p.name == "docs.rst" or p.name == ".DS_Store":
            continue
        infofile = p/"info.json"
        with open(infofile) as json_file:
            info = json.load(json_file)        
            info["name"] = p.name
            info["p"] = p  
        algs.append(info)
    
    for alg in sorted(algs, key=lambda x: x["title"]):  
        p = alg["p"]
        if p.name.startswith("."):
            continue

        j = p/"info.json"
        if p.name == "docs.rst" or p.name == ".DS_Store":
            continue
        with open(j) as json_file:
            info = json.load(json_file)
            
        if "in_docs" in info and info["in_docs"] is False:
            continue

        tab += "   * - :ref:`"+info["title"]+" <{}>`\n".format(p.name)
                # package:
        if info["package"]["title"] == "":
            tab += "     - \n"
        else:
            tab += "     - `"+info["package"]["title"]+" <"+info["package"]["url"]+">`__\n"    
        # module:        
        #tab += "     -  :ref:`{module} <{module}>`\n".format(module=p.name)    

        tab += "     - "
        for i in range(len(info["graph_types"])):
            tab += str2link(info["graph_types"][i]) +", "
        tab = tab[:-2]        
        tab += "\n"
        
        # Data types:
        tab += "     - "
        if len(info["data_types"]) > 0:
            for i in range(len(info["data_types"])):
                tab += str2link(info["data_types"][i]) +", "
            tab = tab[:-2]
        else:
            tab += "\-"        
        tab += "\n"
        # Data missingness:
        tab += "     - "
        if len(info["data_missingness"]) > 0:
            for i in range(len(info["data_missingness"])):
                tab += str2link(info["data_missingness"][i]) +", "
            tab = tab[:-2]
        else:
            tab += "\-"        
        tab += "\n"
        # Intervention types:
        tab += "     - "
        if len(info["intervention_types"]) > 0:
            for i in range(len(info["intervention_types"])):
                tab += str2link(info["intervention_types"][i])+", "
            tab = tab[:-2]
        else:
            tab += ""        
        tab += "\n"

    
        
    tab += "\n"
    # translate the C, D, M, B,
    #tab +="C: continuous, D: discrete, M: mixed, B: binary, MCAR: missing completely at random \n\n"
    return tab

algspath = Path("../workflow/rules/structure_learning_algorithms")

f = open("source/algs_desc.rst", "r")
content = f.read()

outpur_str = ""
outpur_str += ".. _"+algspath.name+": \n\n"
outpur_str += "Algorithms\n"
outpur_str += "="*len(algspath.name) + "="*10
outpur_str += "\n\n"
outpur_str += """.. toctree::
    :hidden:
    :glob:
    :maxdepth: 1
    :name: Structure learning algorithms
    :caption: Structure learning algorithms
    
"""
algs = []
for p in algspath.iterdir():
    if not p.is_dir():
        continue
    if p.name == "docs.rst" or p.name == ".DS_Store":
        continue
    infofile = p/"info.json"
    with open(infofile) as json_file:
        info = json.load(json_file)        
        info["name"] = p.name
        info["p"] = p  
    algs.append(info)

# sort by title
algs = sorted(algs, key=lambda x: x["title"])

# TNhis is the overall rst file for the algorithms page. It has all the algorithms listed for the toc 
# tree and the overview table.
#for p in algspath.iterdir():
for info in algs:    
    p = info["p"]    
    if not p.is_dir():
        continue
    if p.name == "docs.rst" or p.name == ".DS_Store":
        continue
    outpur_str += "    structure_learning_algorithms/{}\n".format(p.name)
outpur_str += "\n\n"
outpur_str += content
outpur_str += "\n\n"
outpur_str += info_to_small_table()
outpur_str += "\n\n"


#### This is the modules docs files:
for p in sorted(algspath.iterdir()):

    if not p.is_dir():
        continue
    if p.name == "docs.rst" or p.name == ".DS_Store":
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

    with open(s) as json_file:    
        schema = json.load(json_file)
    
        if "examples" in schema["items"]:
            dump = json.dumps(schema["items"]["examples"], indent=2)
        else: dump = ""
    
    # This is the module part

    module_str = "\n\n"

    meta_description = ""
    if info["meta_description"] == info["title"]:
        meta_description = content.replace("\n", " ").replace("\r", " ").replace("\t", " ").replace('"', "'")
    else:
        meta_description = info["meta_description"]

    module_str += """
:og:description: {desc}
:og:image:alt: Benchpress logo
:og:sitename: Benchpress causal discovery platform
:og:title: {title_full} ({title})
 
.. meta::
    :title: {title_full} 
    :description: {desc}
""".format(desc=meta_description, title_full=info["title_full"], title=info["title"]) 
    
    module_str += "\n\n"
    module_str += ".. _"+p.name+": \n\n"
    #module_str += p.name +" HOHOHO\n"
    #module_str +="-"*len(p.name) + "-"*4 + "-"*len(info["title_full"]) + "-"*4 + "\n"
    
    module_str +="{} ({}) \n".format(info["title"], info["package"]["title"])
    module_str +="*"*len(info["title"] + info["package"]["title"]) + "*"*4 + "\n"
    
    module_str += "\n"
    #module_str += ".. rubric:: "+ info["title_full"]    
    #module_str += info["title_full"] + "\n"    
    #module_str +="-"*len(info["title_full"]) + "-"*4 + "\n"
    module_str += "\n\n"
    module_str += info_to_table(info, p)
    module_str += "\n\n"
    module_str +="" + info["title_full"] +" \n"
    module_str +="-"*len(info["title_full"]) + "-"*4 + "\n"
    
    
    #module_str += ".. rubric:: " + info["title_full"]    
    if content != "":    
        module_str += "\n\n"
        module_str += content
    module_str += "\n\n"
    
    with open(s) as json_file:    
        schema = json.load(json_file)

    tmp = any(["description" in obj 
           for prop, obj in schema["items"]["properties"].items() 
           if prop != "id"])

    if tmp:
        module_str += ".. rubric:: Some fields described \n"
        for prop, obj in sorted(schema["items"]["properties"].items()):
            if prop == "id":
                continue
            if "description" in obj:                
                module_str += "* ``{}`` {} \n".format(prop, obj["description"])
                    
    module_str += "\n\n"
    
    module_str += ".. rubric:: Example JSON"
    module_str += "\n\n\n"
    module_str += ".. code-block:: json"    
    module_str += "\n\n"
    module_str += '    '.join(('\n'+dump.strip()).splitlines(True))
    module_str += "\n\n"
    module_str += ".. footbibliography::"
    module_str += "\n\n"
    
    #outpur_str += module_str
    with open("source/structure_learning_algorithms/{}.rst".format(p.name), "w") as text_file:
        text_file.write(module_str)
    
    

with open("source/available_structure_learning_algorithms.rst", "w") as text_file:
    text_file.write(outpur_str)