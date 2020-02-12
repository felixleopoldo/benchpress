#!/bin/bash

Rscript scripts/sample_dags.R --filename dags.rds --nodes 20 --parents 2 --samples 4 --seed 1
Rscript scripts/sample_bayesian_network_for_dag.R --input_filename dags.rds --filename bns.rds --seed 1
Rscript scripts/sample_data.R --filename data2n.rds --filename_bn bns.rds --samples 40 --seed 1
Rscript scripts/sample_data.R --filename data10n.rds --filename_bn bns.rds --samples 200 --seed 1
Rscript scripts/run_simulations.R --filename_dags dags.rds --filename_datas data2n.rds data10n.rds --timesvec 4 5 6
Rscript scripts/plot_results.R

