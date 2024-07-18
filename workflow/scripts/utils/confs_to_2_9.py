# read all the config files and add the edgeConstraints key to the structure_learning_algorithms
# if it does not exist and should be there.

from pathlib import Path
import json

# get all the files in the config folder
config_files = Path("config").rglob("*.json")


# read all the files and add the edgeCon
for file in config_files:
    with open(file) as json_file:
        data = json.load(json_file)
    
    print(file.name)
    data["benchmark_setup"]["title"] = file.name.split(".")[0]
    data["benchmark_setup"] = [data["benchmark_setup"]]

    for alg_module, alg_list in data["resources"]["structure_learning_algorithms"].items():
                        
        if (alg_module.startswith("bidag_") or 
            alg_module.startswith("bnlearn_") 
            or alg_module.startswith("tetrad_")
            or alg_module.startswith("gobnilp")
            or alg_module.startswith("pcalg_")):
            for alg_conf in alg_list:
                
                if "constraints" in alg_conf: #for gobnilp
                    alg_conf.pop("constraints")
                
                if "edgeConstraints" in alg_conf:
                    continue
                alg_conf["edgeConstraints"] = None
    
    with open("tmp/"+file.name, "w") as json_file:
        json.dump(data, json_file, indent=2)
