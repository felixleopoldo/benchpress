## Adding a new graph module

Place your script in workflow/scripts and edit the files 

- [workflow/schemas/config.schema.json](workflow/schemas/config.schema.json)
- config/*
- [workflow/rules/docker_images.smk](workflow/rules/docker_images.smk)
- [workflow/rules/sample_adjmat.smk](workflow/rules/sample_adjmat.smk) 
- [workflow/rules/helper_functions.smk](workflow/rules/helper_functions.smk)
- [workflow/rules/pattern_strings.smk](workflow/rules/pattern_strings.smk)
- [docs/source/available_graphs.rst](docs/source/available_graphs.rst)

## Adding a new parameters module

Place your script in workflow/scripts and edit the files 

- [workflow/schemas/config.schema.json](workflow/schemas/config.schema.json)
- config/*
- [workflow/rules/docker_images.smk](workflow/rules/docker_images.smk)
- [workflow/rules/sample_parameters.smk](workflow/rules/sample_parameters.smk) 
- [workflow/rules/sample_data.smk](workflow/rules/sample_data.smk) 
- [workflow/rules/helper_functions.smk](workflow/rules/helper_functions.smk)
- [workflow/rules/pattern_strings.smk](workflow/rules/pattern_strings.smk)
- [docs/source/available_parameters.rst](docs/source/available_parameters.rst)

## Adding a new structure learning algorithm

Place your script in workflow/scripts and edit the files. 
MCMC methods are different from point estimators since the graph trajectory is saved and the graph is estmated from there, see e.g. gt13_multipair.

- [workflow/schemas/config.schema.json](workflow/schemas/config.schema.json)
- config/*
- [workflow/rules/docker_images.smk](workflow/rules/docker_images.smk)
- [workflow/rules/pattern_strings.smk](workflow/rules/pattern_strings.smk)
- [workflow/rules/algorithm_rules.smk](workflow/rules/algorithm_rules.smk)
- [workflow/rules/algorithm_strings.smk](workflow/rules/algorithm_strings.smk)
- [workflow/rules/algorithm_shell_commands.smk](workflow/rules/algorithm_shell_commands.smk)
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
