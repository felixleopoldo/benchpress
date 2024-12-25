from pathlib import Path
import json


def info_to_table(json, p):
    tab = ".. list-table:: \n\n"
    tab += "   * - Module\n"
    tab += "     - `"+p.name+" <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/evaluation/"+p.name+">`__\n"
    tab += "\n"
    return tab

def info_to_small_table():
    algspath = Path("../workflow/rules/evaluation")
    tab = ""
    tab += ".. list-table:: \n"
    tab += "   :header-rows: 1 \n\n"
    tab += "   * - Evaluation\n" 
    tab += "     - Module\n" 
    
    for p in sorted(algspath.iterdir()):
        if p.name.startswith("."):
            continue
        j = p/"info.json"

        with open(j) as json_file:
            info = json.load(json_file)
        tab += "   * - "+info["title"]+"\n"
        
        tab += "\n"
        tab += "     - :ref:`"+p.name+"` \n"    
        
    tab += "\n"
    return tab


algspath = Path("../workflow/rules/evaluation")

f = open("source/evaluation_desc.rst", "r")
content = f.read()

str = ""
str += ".. _"+algspath.name+": \n\n"
str += "Evaluation\n"
str += "="*len(algspath.name) + "="*10
str += "\n\n"

# Toc tree for the evaluation modules
str += """.. toctree::
    :hidden:
    :glob:
    :maxdepth: 3
    :name: Evaluation modules
    :caption: Evaluation modules
    
"""
for p in sorted(algspath.iterdir()):
    if not p.is_dir():
        continue
    if p.name == "docs.rst" or p.name == ".DS_Store":
        continue
    str += "    evaluation/{}\n".format(p.name)

str += content
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
    
    schema = None
    dump = ""
    if s.is_file(): # fixed module has no schema.
        with open(s) as json_file:    
            schema = json.load(json_file)
        

            if ("items" in schema) and ("examples" in schema["items"]):
                dump = json.dumps(schema["items"]["examples"], indent=2)
            elif "examples" in schema:
                dump = json.dumps(schema["examples"], indent=2)
    
    # This is the module part, written to rst file.
    module_str = "\n\n"
    module_str += ".. _"+p.name+": \n\n"
    module_str +="" + p.name +" \n"
    module_str +="-"*len(p.name) + "-"*4 + "\n"
    module_str += "\n"
    module_str += ".. rubric:: "+ info["title"]    
    module_str += "\n\n"
    if p.name != "fixed":
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
        module_str += '    '.join(('\n'+dump.lstrip()).splitlines(True))
    module_str += "\n\n"
    with open("source/evaluation/{}.rst".format(p.name), "w") as text_file:
        text_file.write(module_str)


with open("source/available_evaluations.rst", "w") as text_file:
    text_file.write(str)