json_string = {}

json_string = {val["id"]: expand(pattern_strings["greenthomas"], **val)
                    for val in config["resources"]["structure_learning_algorithms"]["greenthomas"]}

json_string.update({val["id"]: expand(pattern_strings["itsearch"], **val)
                    for val in config["resources"]["structure_learning_algorithms"]["itsearch"]})

json_string.update({val["id"]: expand(pattern_strings["fges"], **val)
                    for val in config["resources"]["structure_learning_algorithms"]["fges"]})

json_string.update({val["id"]: expand(pattern_strings["notears"], **val) 
                    for val in config["resources"]["structure_learning_algorithms"]["notears"]})

json_string.update({val["id"]: expand(pattern_strings["fci"], **val) 
                    for val in config["resources"]["structure_learning_algorithms"]["fci"]})

json_string.update({val["id"]: expand(pattern_strings["gfci"], **val) 
                    for val in config["resources"]["structure_learning_algorithms"]["gfci"]})

json_string.update({val["id"]: expand(pattern_strings["rfci"], **val) 
                    for val in config["resources"]["structure_learning_algorithms"]["rfci"]})

json_string.update({val["id"]: expand(pattern_strings["pcalg"], **val)  
                    for val in config["resources"]["structure_learning_algorithms"]["pcalg"]})

json_string.update({val["id"]: expand(pattern_strings["mmhc"], **val)
                    for val in config["resources"]["structure_learning_algorithms"]["mmhc"]} )

json_string.update({val["id"]: expand(pattern_strings["interiamb"], **val)                                        
                    for val in config["resources"]["structure_learning_algorithms"]["interiamb"]} )

json_string.update({val["id"]: expand(pattern_strings["gs"], **val)
                    for val in config["resources"]["structure_learning_algorithms"]["gs"]} )

json_string.update({val["id"]: expand(pattern_strings["gobnilp"], **val)
                    for val in config["resources"]["structure_learning_algorithms"]["gobnilp"]})

json_string.update({val["id"]:  expand(pattern_strings["tabu"], **val)
                    for val in config["resources"]["structure_learning_algorithms"]["tabu"]})

json_string.update({val["id"]:  expand(pattern_strings["hc"], **val)
                    for val in config["resources"]["structure_learning_algorithms"]["hc"]})

json_string.update({val["id"]: expand(pattern_strings["trilearn_loglin"] +"/"+pattern_strings["mcmc_est"], 
                    alpha=val["alpha"],
                    beta=val["beta"],
                    N=val["N"],
                    M=val["M"],
                    pseudo_obs=val["pseudo_obs"],
                    radii=val["radii"],
                    threshold=val["threshold"],
                    burnin=val["burnin"],
                    )
               for val in config["resources"]["structure_learning_algorithms"]["trilearn_loglin"]})

json_string.update({val["id"]: expand(pattern_strings["blip"], **val)
                for val in config["resources"]["structure_learning_algorithms"]["blip"]})

# This has to be the last one since it takes input strings as start space...\
json_string.update({val["id"]: expand(pattern_strings["order_mcmc"]+"/"+pattern_strings["mcmc_est"], 
                                            scoretype=val["scoretype"],
                                            chi=val["chi"],
                                            edgepf=val["edgepf"],
                                            am=val["am"],
                                            aw=val["aw"],
                                            alpha=val["alpha"],
                                            gamma=val["gamma"],
                                            iterations=val["iterations"],
                                            stepsave=val["stepsave"],
                                            MAP=val["MAP"],
                                            cpdag=val["cpdag"],
                                            startspace_algorithm=json_string[val["startspace_algorithm"]],
                                            threshold=val["threshold"],
                                            plus1=val["plus1"],
                                            burnin=val["burnin"],)  
                    for val in config["resources"]["structure_learning_algorithms"]["order_mcmc"] } )
