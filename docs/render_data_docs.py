from pathlib import Path
import json
import bibtexparser
from docs_utils import *
from operator import itemgetter


def fixed_data_to_table(json, p):
    
    tab = ".. list-table:: \n\n"#+p.name+"\n\n"
    tab += "   * - Filename \n"
    tab += "     - p\n"
    tab += "     - n\n"
    tab += "     - Type\n"
    tab += "     - Graph\n"
    for element in sorted(json, key=itemgetter('filename')):
        tab += "   * - :ref:`{}`\n".format(element["filename"])
        tab += "     - "+str(element["p"])+"\n"
        tab += "     - "+str(element["n"])+"\n"
        tab += "     - "
        for t in element["type"]:
            tab += str2link(t)+", "
        tab = tab[:-2] + "\n"
        tab += "     - `{graph} <https://github.com/felixleopoldo/benchpress/blob/master/resources/adjmat/myadjmats/{graph}>`__".format(graph=element["graph"])+"\n"

    tab += "\n\n"

    for element in sorted(json, key=itemgetter('filename')):
        
        tab += "\n\n"
        tab += ".. _"+element["filename"]+":\n\n"
        tab += ".. rubric:: "+element["filename"]+"\n\n"
        tab += "File: `{filename} <https://github.com/felixleopoldo/benchpress/blob/master/resources/data/mydatasets/{filename}>`__".format(filename=element["filename"])
        tab += "\n\n"
        tab += element["description"]
        tab += "\n\n"
        tab += "--------------------\n\n"
        
    tab += "\n\n"
    
    tab += ".. rubric:: References"
    tab += "\n\n"
    tab += ".. footbibliography::"
    
    return tab

def info_to_table(json, p):
    tab = ".. list-table:: \n\n"#+p.name+"\n\n"
    tab += "   * - Package\n"
    if info["package"]["url"]:
        tab += "     - `"+info["package"]["title"]+" <"+info["package"]["url"]+">`__\n"    
    else:
        tab += "     - "+info["package"]["title"]+"\n"
    tab += "   * - Version\n"
    tab += "     - "+info["version"]+"\n"
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
        if p.name.startswith("."):
            continue
        j = p/"info.json"

        with open(j) as json_file:
            info = json.load(json_file)
            
        tab += "   * - "+info["title"]+"\n"
        for i in range(len(info["graph_types"])):
            tab += "     - "+str2link(info["graph_types"][i]) +", "
        tab = tab[:-2]
        tab += "\n"
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

ret_str = ""
#ret_str += "``"+algspath.name+"``\n"
ret_str += ".. _"+algspath.name+": \n\n"
ret_str += "Data\n"
ret_str += "="*len(algspath.name) + "="*10
ret_str += "\n\n"
ret_str += content
ret_str += "\n\n"

ret_str += info_to_small_table()
ret_str += "\n\n"
for p in sorted(algspath.iterdir()):
    #print(p.name)
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

    
    schema = None
    dump = ""
    if s.is_file(): # fixed module has no schema.
        with open(s) as json_file:    
            schema = json.load(json_file)
        
            if "examples" in schema["items"]:
                dump = json.dumps(schema["items"]["examples"], indent=2)


    ret_str += "\n\n"
    ret_str += ".. _"+p.name+": \n\n"
    ret_str +=p.name +" \n"
    ret_str +="-"*len(p.name) + "-"*4 + "\n"

    
    ret_str += "\n"
    ret_str += ".. rubric:: "+ info["title"]    
    ret_str += "\n\n"
    if p.name != "fixed_data":
        ret_str += info_to_table(info, p)
        ret_str += "\n\n"
        
    
    ret_str += ".. rubric:: Description"    
    if content != "":    
        ret_str += "\n\n"
        ret_str += content
        ret_str += "\n\n"
        
    if p.name == "fixed_data":
        with open(p/"data_info.json") as json_data_file:
            fixed_data_info = json.load(json_data_file)
        ret_str += fixed_data_to_table(fixed_data_info, p)
        ret_str += "\n\n"
        

    if dump != "":
        ret_str += "\n\n"
        ret_str += ".. rubric:: Example"
        ret_str += "\n\n\n"
        ret_str += ".. code-block:: json"    
        ret_str += "\n\n"
        ret_str += '    '.join(('\n'+dump.lstrip()).splitlines(True))
    ret_str += "\n\n"
    ret_str += ".. footbibliography::"
    #ret_str += "\n\n-------"
    ret_str += "\n\n"


with open("source/available_data.rst", "w") as text_file:
    text_file.write(ret_str)