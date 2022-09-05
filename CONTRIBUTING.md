## Adding a new configuration file

Place your configuration file in JSON format in [config](config).

## Adding a new data set

Place your data sets in [resources/data/mydatasets](resources/data/mydatasets).

## Adding a new graph

Place the adjacency matrix of the graph in a .csv file in [resources/graph/myadjmats](resources/graph/myadjmats).

## Adding a new graph module

Place your script in [workflow/scripts/graph_sampling](workflow/scripts/graph_sampling) and edit the files 

- [workflow/schemas/config.schema.json](workflow/schemas/config.schema.json)
- config/*
- [workflow/rules/docker_images.smk](workflow/rules/docker_images.smk)
- [workflow/rules/sample_adjmat.smk](workflow/rules/sample_adjmat.smk) 
- [workflow/rules/helper_functions.smk](workflow/rules/helper_functions.smk)
- [workflow/rules/pattern_strings.smk](workflow/rules/pattern_strings.smk)
- [docs/source/available_graphs.rst](docs/source/available_graphs.rst)

## Adding a new parameters module

Place your script in [workflow/scripts/parameters_sampling](workflow/scripts/parameters_sampling) and edit the files 

- [workflow/schemas/config.schema.json](workflow/schemas/config.schema.json)
- config/*
- [workflow/rules/docker_images.smk](workflow/rules/docker_images.smk)
- [workflow/rules/sample_parameters.smk](workflow/rules/sample_parameters.smk) 
- [workflow/rules/sample_data.smk](workflow/rules/sample_data.smk) 
- [workflow/rules/helper_functions.smk](workflow/rules/helper_functions.smk)
- [workflow/rules/pattern_strings.smk](workflow/rules/pattern_strings.smk)
- [docs/source/available_parameters.rst](docs/source/available_parameters.rst)

## Adding a new structure learning algorithm

Install the requirements for running your script on a [Docker](https://www.docker.com/) image and push it to [DockerHub](https://hub.docker.com/).
Then place your script in [workflow/scripts/structure_learning_algorithms](workflow/scripts) and edit the files listed below. 

Note that, MCMC methods are different from point estimators since the output is a graph trajectory and the graph is estmated from there, see e.g. gt13_multipair for an example of such algorithm.

- [workflow/schemas/config.schema.json](workflow/schemas/config.schema.json)
- config/*
- [workflow/rules/docker_images.smk](workflow/rules/docker_images.smk)
- [workflow/rules/algorithm_rules.smk](workflow/rules/algorithm_rules.smk)
- [workflow/rules/algorithm_strings.smk](workflow/rules/algorithm_strings.smk)
- [workflow/rules/algorithm_shell_commands.smk](workflow/rules/algorithm_shell_commands.smk) (if the algorithm runs from the command line)
- [workflow/rules/algorithm_summary_shell_command.smk](workflow/rules/algorithm_summary_shell_command.smk)
- [docs/source/available_structure_learning_algorithms.rst](docs/source/available_structure_learning_algorithms.rst)

## Adding a new evaluation method

- [workflow/schemas/config.schema.json](workflow/schemas/config.schema.json)
- config/*
- [workflow/rules/docker_images.smk](workflow/rules/docker_images.smk)
- [workflow/rules/evalutaion.smk](workflow/rules/evaluation.smk)
- [workflow/scripts/run_summarise.R](workflow/scripts/run_summarise.R)
- [workflow/rules/pattern_strings.smk](workflow/rules/pattern_strings.smk)
- [docs/source/json_overview.rst](docs/source/json_overview.rst)
