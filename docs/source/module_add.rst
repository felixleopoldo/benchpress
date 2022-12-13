Graph modules
########################

The graph modules are stored as directories in workflow/rules/graphs. 


Create new graph module
***********************

In order to create a new graph module you can either copy a template as

.. prompt:: bash

    cp -r resources/module_templates/new_graph workflow/rules/graph/new_graph

Alternatively, you may copy one of the existing modules. This line 

.. prompt:: bash

   cp -r workflow/rules/graph/pcalg_randdag workflow/rules/graph/pcalg_randdag_copy

copies the ``pcalg_randdag`` module to a new module called ``pcalg_randdag_copy``.

The content of the modules may be changed in any of the alternatives while maintaining the structure described below.

Template structure
------------------

A graph module has the following basic file structure, where all the files are necessary except for script.R that may be changed.

::

    new_graph
    ├── rule.smk
    ├── script.R
    ├── schema.json
    ├── info.json
    └── docs.rst

Here we show the content for the module template ``new_graph``.
The file `rule.smk <../../../resources/module_templates/new_graph/rule.smk>`__ contains a Snakemake rule with the proper name and output fields.
This template calls *script.R* shown below, but you may change either the whole script or the content of it. 
The container is set to None in the example in order to force local execution.
On deployment (pushing to Benchpress repository) this field should be a Docker Hub uri, e.g. *docker://username/image:version*.
You should not alter the name or the output fields.

.. code-block:: python
    
    rule:
        name:
            module_name
        output:
            adjmat = "{output_dir}/adjmat/"+pattern_strings[module_name]+"/seed={replicate}.csv"
        container:
            None
        script: 
            "script.R"

`script.R <../../../resources/module_templates/new_graph/script.R>`__ is a script that generates a random binary symetric matrix (undirected graph).
The result is saved in the output

.. code-block:: r

    # Samples the adjacency matrix for a random undirected graph.

    p <- as.integer(snakemake@wildcards[["p"]])

    set.seed(as.integer(snakemake@wildcards[["replicate"]]))
    adjmat <- matrix(runif(p * p), nrow = p, ncol = p) > 0.8 
    adjmat <- 1 * (adjmat | t(adjmat)) # Make it symmetric (undirected)
    diag(adjmat) <- 0 # No self loops
    colnames(adjmat) <- as.character(seq(p))

    write.table(snakemake@output[["adjmat"]],
                file = filename, row.names = FALSE,
                quote = FALSE, col.names = TRUE, sep = ","
                )

You need to add the following piece of JSON code to ``resources -> graph`` section.
Variables are then automatically accessible in the script.

.. code-block:: json

    "new_algmod": [
        {
            "id": "testmat",
            "p": 5,
            "par1": 10
        }
    ]



* `info.json` is a JSON file to be parsed when generating the documentation.
* `schema.json` is a JSON schema for the module.
* `docs.rst` is a documentation file in RST format.

Parameters module
########################

Data module
########################

Algorithm module
########################

Evaluation module
########################