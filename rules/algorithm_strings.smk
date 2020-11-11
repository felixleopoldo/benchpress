json_string = {}

json_string = {val["id"]: expand(pattern_strings["greenthomas"], 
                                           n_samples=val["n_samples"],
                                           randomits=val["randomits"],
                                           penalty=val["penalty"])
                    for val in config["resources"]["structure_learning_algorithms"]["greenthomas"]}

json_string.update({val["id"]: expand(pattern_strings["itsearch"], 
                                            scoretype=val["optional"]["scoretype"],
                                            chi=val["optional"]["chi"],
                                           edgepf=val["optional"]["edgepf"],
                                           am=val["optional"]["am"],
                                           aw=val["optional"]["aw"],
                                           MAP=val["optional"]["MAP"],
                                           plus1it=val["optional"]["plus1it"],
                                           posterior=val["optional"]["posterior"]) 
                    for val in config["resources"]["structure_learning_algorithms"]["itsearch"]})

json_string.update({val["id"]: expand(pattern_strings["fges"], 
                                           faithfulnessAssumed=val["faithfulnessAssumed"],
                                           datatype=val["data-type"],
                                           score=val["score"]) 
                    for val in config["resources"]["structure_learning_algorithms"]["fges"]})

json_string.update({val["id"]: expand(pattern_strings["notears"], 
                                           min_rate_of_progress=val["min_rate_of_progress"],
                                           penalty_growth_rate=val["penalty_growth_rate"],
                                           optimation_accuracy=val["optimation_accuracy"],
                                           loss=val["loss"],
                                           loss_grad=val["loss_grad"]
                                           ) 
                    for val in config["resources"]["structure_learning_algorithms"]["notears"]})


json_string.update({val["id"]: expand(pattern_strings["fci"], 
                                           alpha=val["alpha"],
                                           datatype=val["data-type"],
                                           test=val["test"]) 
                    for val in config["resources"]["structure_learning_algorithms"]["fci"]})

json_string.update({val["id"]: expand(pattern_strings["gfci"], 
                                           alpha=val["alpha"],
                                           score=val["score"],
                                           datatype=val["data-type"],
                                           test=val["test"]) 
                    for val in config["resources"]["structure_learning_algorithms"]["gfci"]})

json_string.update({val["id"]: expand(pattern_strings["rfci"], 
                                           alpha=val["alpha"],
                                           datatype=val["data-type"],
                                           test=val["test"]) 
                    for val in config["resources"]["structure_learning_algorithms"]["rfci"]})

json_string.update({val["id"]: expand(pattern_strings["pcalg"], 
                                           alpha=val["alpha"])  
                    for val in config["resources"]["structure_learning_algorithms"]["pcalg"]})

json_string.update({val["id"]: expand(pattern_strings["mmhc"], 
                                           alpha=val["restrict.args"]["alpha"])  
                    for val in config["resources"]["structure_learning_algorithms"]["mmhc"]} )

json_string.update({val["id"]: expand(pattern_strings["h2pc"], 
                                           alpha=val["restrict.args"]["alpha"])  
                    for val in config["resources"]["structure_learning_algorithms"]["h2pc"]} )

json_string.update({val["id"]: expand(pattern_strings["interiamb"], 
                                           alpha=val["alpha"])  
                    for val in config["resources"]["structure_learning_algorithms"]["interiamb"]} )

json_string.update({val["id"]: expand(pattern_strings["gs"], 
                                           alpha=val["alpha"])  
                    for val in config["resources"]["structure_learning_algorithms"]["gs"]} )

json_string.update({val["id"]: expand(pattern_strings["gobnilp"],
                                                palim=val["palim"],
                                                alpha=val["alpha"],
                                                prune=val["prune"]
                                                )
                for val in config["resources"]["structure_learning_algorithms"]["gobnilp"]})

json_string.update({val["id"]:  expand(pattern_strings["tabu"], 
                                                    score=val["score"],
                                                    iss=val["iss"],
                                                    issmu=val["iss.mu"],
                                                    l=val["l"],
                                                    k=val["k"],
                                                    prior=val["prior"],
                                                    beta=val["beta"]
                                                    )
                for val in config["resources"]["structure_learning_algorithms"]["tabu"]})

json_string.update({val["id"]:  expand(pattern_strings["hc"], 
                                                    perturb=val["perturb"],
                                                    restart=val["restart"],
                                                    score=val["score"],
                                                    iss=val["iss"],
                                                    issmu=val["iss.mu"],
                                                    l=val["l"],
                                                    k=val["k"],
                                                    prior=val["prior"],
                                                    beta=val["beta"]
                                                    )
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

json_string.update({val["id"]: expand(pattern_strings["blip"], 
                                            max_time=val["time"],
                                            solvermethod=val["solver.method"],
                                            scorermethod=val["scorer.method"],
                                            indeg=val["indeg"],
                                            cores=val["cores"],
                                            allocated=val["allocated"],
                                            scorefunction=val["scorefunction"],
                                            alpha=val["alpha"],
                                            verbose=val["verbose"]
                                            )
                for val in config["resources"]["structure_learning_algorithms"]["blip"]})

# This has to be the last one since it takes input strings as start space...
json_string.update({val["id"]: expand(pattern_strings["order_mcmc"]+"/"+pattern_strings["mcmc_est"], 
                                            scoretype=val["scoretype"],
                                            chi=val["chi"],
                                            edgepf=val["edgepf"],
                                            am=val["am"],
                                            aw=val["aw"],
                                            startspace_algorithm=json_string[val["startspace"]],
                                            threshold=val["threshold"],
                                            burnin=val["burnin"],)  
                    for val in config["resources"]["structure_learning_algorithms"]["order_mcmc"] } )

