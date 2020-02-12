source("lib/code_for_binary_simulations/df_fns.R")
source("lib/code_for_binary_simulations/sim_bidag_binary_euler.R")
source("lib/code_for_binary_simulations/summarySE.R")


scoredf <- scoredf.init()
ROCdf <- ROCdf.init()
SHDdf <- SHDdf.init()


scoredf <- scoredf.add(newrep = bidag_sim_list[[j]], scoredf = scoredf, algo = "MCMC", repl = j)
SHDdf <- SHDdf.add(newrep = bidag_sim_list[[j]], SHDdf = SHDdf, algo = "MCMC", repl = j)
ROCdf <- ROCdf.add(newrep = bidag_sim_list[[j]], ROCdf = ROCdf, algo = "MCMC", repl = j)