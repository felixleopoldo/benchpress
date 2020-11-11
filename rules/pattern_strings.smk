pattern_strings = {}
pattern_strings["greenthomas"] = "greenthomas/alg_params=/" \
                "n_samples={n_samples}/" \
                "randomits={randomits}/" \
                "penalty={penalty}"

pattern_strings["notears"] = "notears/alg_params=/" \
                "min_rate_of_progress={min_rate_of_progress}/" \
                "penalty_growth_rate={penalty_growth_rate}/" \
                "optimation_accuracy={optimation_accuracy}/" \
                "loss={loss}/" \
                "loss_grad={loss_grad}"

pattern_strings["blip"] = "blip/alg_params=/" \
                "time={max_time}/" \
                "scorer.method={scorermethod}/" \
                "solver.method={solvermethod}/" \
                "indeg={indeg}/" \        
                "cores={cores}/" \
                "allocated={allocated}/" \
                "scorefunction={scorefunction}/" \
                "alpha={alpha}/" \
                "verbose={verbose}"

pattern_strings["pcalg"] = "pcalg/alg_params=/"\
               "alpha={alpha}"

pattern_strings["mmhc"] = "mmhc/alg_params=/"\
               "alpha={alpha}"

pattern_strings["h2pc"] = "h2pc/alg_params=/"\
               "alpha={alpha}"

pattern_strings["interiamb"] = "interiamb/alg_params=/"\
               "alpha={alpha}"

pattern_strings["gs"] = "gs/alg_params=/"\
               "alpha={alpha}"

pattern_strings["tabu"] = "tabu/alg_params=/"\
               "score={score}/"\
               "iss={iss}/"\
               "iss.mu={issmu}/"\
               "l={l}/"\
               "k={k}/"\
               "prior={prior}/"\
               "beta={beta}"\

pattern_strings["hc"] = "hc/alg_params=/"\
               "perturb={perturb}/"\
               "restart={restart}/"\
               "score={score}/"\
               "iss={iss}/"\
               "iss.mu={issmu}/"\
               "l={l}/"\
               "k={k}/"\
               "prior={prior}/"\
               "beta={beta}"\

pattern_strings["gobnilp"] = "gobnilp/alg_params=/"\
                 "palim={palim}/" \
                 "alpha={alpha}/"\
                 "prune={prune}"

pattern_strings["itsearch"] = "itsearch/alg_params=/"\
                    "scoretype={scoretype}/"\
                    "chi={chi}/" \
                    "edgepf={edgepf}/" \
                    "am={am}/" \
                    "aw={aw}/" \
                    "map={MAP}/"\
                    "plus1it={plus1it}/"\
                    "posterior={posterior}"

pattern_strings["order_mcmc"] = "order_mcmc/alg_params=/"\
                    "scoretype={scoretype}/"\
                    "chi={chi}/" \
                    "edgepf={edgepf}/" \
                    "am={am}/" \
                    "aw={aw}/" \
                    "startspace_algorithm=/{startspace_algorithm}"

pattern_strings["mcmc_est"] = "estimation_method/"\
                  "threshold={threshold}/"\
                  "burnin={burnin}"

pattern_strings["trilearn_loglin"] = "trilearn_loglin/alg_params=/"\
                  "alpha={alpha}/"\
                  "beta={beta}/"\
                  "radii={radii}/"\
                  "pseudo_obs={pseudo_obs}/"\
                  "M={M}/"\
                  "N={N}" 

pattern_strings["fges"] = "fges/alg_params=/"\
               "score={score}/" \
               "data-type={datatype}/"\
               "faithfulnessAssumed={faithfulnessAssumed}"

pattern_strings["fci"] = "fci/alg_params=/"\
               "test={test}/" \
               "alpha={alpha}/" \
               "data-type={datatype}"

pattern_strings["gfci"] = "gfci/alg_params=/"\
               "test={test}/" \
               "alpha={alpha}/" \
               "score={score}/" \
               "data-type={datatype}"

pattern_strings["rfci"] = "rfci/alg_params=/"\
               "test={test}/" \
               "alpha={alpha}/" \
               "data-type={datatype}"

pattern_strings["evaluation"] = "evaluation/" \
                   "score_type={score_type}/" \
                   "chi={chi}/" \
                   "edgepf={edgepf}" 
