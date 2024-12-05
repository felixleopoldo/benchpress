#!/usr/bin/env python3

# This script is used to convert config files to the new format introduced in Benchpress 2.9.0.
# It copies the config folder to config_olf

# read all the config files and add the edgeConstraints key to the structure_learning_algorithms

# if it does not exist and should be there.

from pathlib import Path
import json
import shutil
import datetime

#shutil.copytree('config', 'config_old', dirs_exist_ok=True)  # Fine
# name it with a timestamp to keep the old config files like config_2021-09-01-12-00-00
bkp_time = datetime.datetime.now().strftime("%Y-%m-%d-%H-%M-%S")
shutil.copytree('config', 'config_'+bkp_time, dirs_exist_ok=True)  # Fine

# get all the files in the config folder
config_files = Path("config").rglob("*.json")

# create a tmp folder. Remove it if it exists
shutil.rmtree("tmp", ignore_errors=True)
Path("tmp").mkdir(parents=True, exist_ok=True)

something_changed = False
# read all the files and add the edgeCon
for file in config_files:
    with open(file) as json_file:
        data = json.load(json_file)
    
    #  data["benchmark_setup"] should be a list
    if type(data["benchmark_setup"]) is not list:
        # this is for the benchmark_setup section. It hsould be a list    
        print("Converting benchmark_setup to list and name it after the file")
        data["benchmark_setup"]["title"] = file.name.split(".")[0]
        data["benchmark_setup"] = [data["benchmark_setup"]]
        something_changed = True

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
                print("{}: Adding edgeConstraints to {}".format(file.name, alg_module))
                alg_conf["edgeConstraints"] = None
                something_changed = True
    

    with open("tmp/"+file.name, "w") as json_file:
        json.dump(data, json_file, indent=2)

# replace the config folder with the tmp folder
shutil.rmtree("config", ignore_errors=True)
shutil.move("tmp", "config")

if not something_changed:
    print("Files in config/ folder are already in the right format.")
    exit()
    
print("Converted config files in config/ to work with Benchpress >= 2.9.")
print("A backup of the old config files is saved in config_{}".format(bkp_time))