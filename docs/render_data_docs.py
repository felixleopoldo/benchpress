from pathlib import Path
import json
import bibtexparser
from docs_utils import *

def info_to_table(json, p):
    tab = ".. list-table:: \n\n"#+p.name+"\n\n"
    #tab += "   * - Title\n"
    #tab += "     - "+info["title"]+"\n"
    tab += "   * - Package\n"
    if info["package"]["url"]:
        tab += "     - `"+info["package"]["title"]+" <"+info["package"]["url"]+">`__\n"    
    else:
        tab += "     - "+info["package"]["title"]+"\n"
    tab += "   * - Version\n"
    tab += "     - "+info["version"]+"\n"
    #tab += "   * - Language\n"
    #tab += "     - "+info["language"]+"\n"   
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
    for i in range(len(info["graph_types"])):
        tab += "     - "+str2link(info["graph_types"][i]) +", "
    tab = tab[:-2]
    tab += "\n"
#    tab += "   * - Docker\n"
#    tab += "     - `"+info["docker_image"]+" <https://hub.docker.com/r/"+info["docker_image"].split("/")[0]+"/"+info["docker_image"].split("/")[1].split(":")[0]+">`_\n"
    tab += "   * - Module\n"
    tab += "     - `"+p.name+" <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/data/"+p.name+">`__\n"
    tab += "\n"
    return tab

def info_to_small_table():
    algspath = Path("../workflow/rules/data")
    tab = ""
    tab += ".. list-table:: \n"#+p.name+"\n\n"
    #tab += "   :width: 100 \n"
    tab += "   :header-rows: 1 \n\n"
    tab += "   * - Method\n" 
    tab += "     - Graph\n" 
    #tab += "     - Language\n" 
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
            tab += "     - "+str2link(info["graph_types"][i]) +", "
        tab = tab[:-2]
        
        tab += "\n"
        #tab += "     - "+info["language"]+"\n"
        if info["package"]["url"]:
            tab += "     - `"+info["package"]["title"]+" <"+info["package"]["url"]+">`__\n"    
        else:
            tab += "     - "+info["package"]["title"]+"\n"    

        tab += "     - "+info["version"]+"\n"
        tab += "     - "+p.name+"_ \n"    
        
    tab += "\n"
    return tab


algspath = Path("../workflow/rules/data")

f = open("source/data_desc.rst", "r")
content = f.read()

str = ""
#str += "``"+algspath.name+"``\n"
str += "Data\n"
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
    str += ".. _"+p.name+": \n\n"
    str +="``" + p.name +"`` \n"
    str +="-"*len(p.name) + "-"*4 + "\n"

    
    str += "\n"
    str += ".. rubric:: "+ info["title"]    
    str += "\n\n"
    if p.name != "fixed_data":
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
    str += "\n\n"
    str += ".. footbibliography::"
    str += "\n\n"


with open("source/available_data.rst", "w") as text_file:
    text_file.write(str)