The container field is set to `None` in all of the example rules below in order to force local execution.
On deployment (pushing to Benchpress repository) however, this field should be a `Docker Hub <https://hub.docker.com/>`__ URI on the form *docker://username/image:version*.
You should not alter the name or the output fields.


Graph module
########################

The graph modules are stored as sub directories of `workflow/rules/graph <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/graph>`__. 
In order to create a new graph module, you can make a copy of the template module `new_graph <https://github.com/felixleopoldo/benchpress/tree/master/resources/module_templates/new_graph>`__ as

.. prompt:: bash

    cp -r resources/module_templates/new_graph workflow/rules/graph/new_graph

Alternatively, you may copy one of the existing modules. This line 

.. prompt:: bash

   cp -r workflow/rules/graph/pcalg_randdag workflow/rules/graph/pcalg_randdag_copy

copies the :ref:`pcalg_randdag` module to a new module named ``pcalg_randdag_copy``.

The content of the modules may be changed in any of the alternatives above while maintaining the structure described below.

Module structure
------------------

A graph module has the following basic file structure, where all the files are necessary except for `script.R <https://github.com/felixleopoldo/benchpress/tree/master/resources/module_templates/new_graph/script.R>`__ that may be changed.

::

    new_graph
    ├── rule.smk
    ├── script.R
    ├── schema.json
    ├── info.json
    ├── bibtex.bib
    └── docs.rst

In this section we show the content for the module template `new_graph <https://github.com/felixleopoldo/benchpress/tree/master/resources/module_templates/new_graph>`__.
The file `rule.smk <https://github.com/felixleopoldo/benchpress/tree/master/resources/module_templates/new_graph/rule.smk>`__ contains a  `Snakemake rule <https://snakemake.readthedocs.io/en/stable/snakefiles/rules.html#>`_ with the proper name and output fields.
This template runs `script.R <https://github.com/felixleopoldo/benchpress/tree/master/resources/module_templates/new_graph/script.R>`__ (shown below) but you may change either the entire file or the content of it. 

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


The module specific variables available in the script are generated from the `JSON <https://www.json.org/json-en.html>`_ config file. 
In particular, in order to use the module, you need to add the following piece of `JSON <https://www.json.org/json-en.html>`_ to the ``resources -> graph`` section.

.. code-block:: json

    "new_graph": [
        {
            "id": "testmat",
            "p": 5,
            "param1": 10
        }
    ]

This will make the parameters ``p`` and ``param1``, accessible in the script. 
Note that the values are passed as string and might have to be converted to suite your script.

.. role:: r(code)
   :language: r

`script.R <https://github.com/felixleopoldo/benchpress/tree/master/resources/module_templates/new_graph/script.R>`__ generates a random binary symetric matrix (undirected graph).
The result is saved in :r:`snakemake@output[["adjmat"]]`, which is generated from the rule. 

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

In general the vairables available in the script is are generated from the `Snakemake rule <https://snakemake.readthedocs.io/en/stable/snakefiles/rules.html#>`_ and the `JSON <https://www.json.org/json-en.html>`_ config file. 
Variables are then automatically accessible in the script.
See the `Snakemake documentation <https://snakemake.readthedocs.io/en/stable/snakefiles/rules.html#external-scripts>`__ for further details of how to access variables in script.

* `info.json <https://github.com/felixleopoldo/benchpress/tree/master/resources/module_templates/new_graph/info.json>`__ is a `JSON <https://www.json.org/json-en.html>`_ file to be parsed when generating the documentation.
* `schema.json <https://github.com/felixleopoldo/benchpress/tree/master/resources/module_templates/new_graph/schema.json>`__ is a `JSON schema <https://json-schema.org/>`_  for the module.
* `docs.rst <https://github.com/felixleopoldo/benchpress/tree/master/resources/module_templates/new_graph/docs.rst>`__ is a documentation file in `reStructuredText <https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html>`_ (RST) format.
* `bibtext.bib <https://github.com/felixleopoldo/benchpress/tree/master/resources/module_templates/new_graph/bibtex.bib>`__ is a `BibTeX <http://www.bibtex.org/Format/>`_ file with references that will be show in the docs.


Parameters module
########################

The parameters modules are stored as sub directories of `workflow/rules/parameters <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/parameters>`_. 
In order to create a new parameters module, you can make a copy of the template module `new_params <https://github.com/felixleopoldo/benchpress/tree/master/resources/module_templates/new_params>`__ as

.. prompt:: bash

    cp -r resources/module_templates/new_params workflow/rules/parameters/new_params

Alternatively, you may copy one of the existing modules. This line 

.. prompt:: bash

   cp -r workflow/rules/graph/sem_params workflow/rules/parameters/sem_params_copy

copies the :ref:`sem_params` module to a new module named ``sem_params_copy``.

The content of the modules may be changed in any of the alternatives above while maintaining the structure described below.

Module structure
------------------

A parameters module has the following basic file structure, where all the files are necessary except for `script.R <https://github.com/felixleopoldo/benchpress/tree/master/resources/module_templates/new_params/script.R>`__ that may be changed.

::

    new_params
    ├── rule.smk
    ├── script.R
    ├── schema.json
    ├── info.json
    ├── bibtex.bib
    └── docs.rst

In this section we show the content for the module template `new_params <https://github.com/felixleopoldo/benchpress/tree/master/resources/module_templates/new_params>`__.
The file `rule.smk <https://github.com/felixleopoldo/benchpress/tree/master/resources/module_templates/new_params/rule.smk>`__ contains a  `Snakemake rule <https://snakemake.readthedocs.io/en/stable/snakefiles/rules.html#>`_ with the proper name and output fields.
This template runs `script.R <https://github.com/felixleopoldo/benchpress/tree/master/resources/module_templates/new_params/script.R>`__ (shown below) but you may change either the entire file or the content of it. 
You should not alter the name or the output fields.

.. code-block:: python
        
    rule:
        name:
            module_name
        input:
            adjmat = "{output_dir}/adjmat/{adjmat}.csv" 
        output:
            params = "{output_dir}/parameters/" + \
                    pattern_strings[module_name] + "/" \
                    "seed={seed}/"+\
                    "adjmat=/{adjmat}.csv"
        container:
            None
        script:
            "script.R" 


The module specific variables available in the script are generated from the `JSON <https://www.json.org/json-en.html>`_ config file. 
In particular, in order to use the module, you need to add the following piece of `JSON <https://www.json.org/json-en.html>`_ to the ``resources -> graph`` section.

.. code-block:: json

    "new_params": [
        {
            "id": "testparams",
            "p": 5,
            "param1": 10
        }
    ]

This will make the parameters ``p`` and ``param1``, accessible in the script. 
Note that the values are passed as string and might have to be converted to suite your script.

.. role:: r(code)
   :language: r

`script.R <https://github.com/felixleopoldo/benchpress/tree/master/resources/module_templates/new_params/script.R>`__ generates a random binary symetric matrix (undirected graph).
The result is saved in :r:`snakemake@output[["params"]]`, which is generated from the rule. 

.. code-block:: r

    # As the parameterisation differ between models, there is 
    # no sample script here. 

    # Read the seed number
    seed <- as.integer(snakemake@wildcards[["seed"]])

    # Read the adjacency matrix
    df_adjmat <- read.csv(snakemake@input[["adjmat"]], 
                        header = TRUE, 
                        check.names = FALSE)
    adjmat <- as.matrix(df_adjmat)

    # Set the seed
    set.seed(seed)

    # Write the parameters on the correct format.

    # Write the parameters to file. 
    cat("Replace this", file = snakemake@output[["params"]], sep = "\n")



In general the vairables available in the script is are generated from the `Snakemake rule <https://snakemake.readthedocs.io/en/stable/snakefiles/rules.html#>`_ and the `JSON <https://www.json.org/json-en.html>`_ config file. 
Variables are then automatically accessible in the script.
See the `Snakemake documentation <https://snakemake.readthedocs.io/en/stable/snakefiles/rules.html#external-scripts>`__ for further details of how to access variables in script.

* `info.json <https://github.com/felixleopoldo/benchpress/tree/master/resources/module_templates/new_params/info.json>`__ is a `JSON <https://www.json.org/json-en.html>`_ file to be parsed when generating the documentation.
* `schema.json <https://github.com/felixleopoldo/benchpress/tree/master/resources/module_templates/new_params/schema.json>`__ is a `JSON schema <https://json-schema.org/>`_  for the module.
* `docs.rst <https://github.com/felixleopoldo/benchpress/tree/master/resources/module_templates/new_params/docs.rst>`__ is a documentation file in `reStructuredText <https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html>`_ (RST) format.
* `bibtex.bib <https://github.com/felixleopoldo/benchpress/tree/master/resources/module_templates/new_params/bibtex.bib>`__ is a `BibTeX <http://www.bibtex.org/Format/>`_ file with references that will be show in the docs.



Data module
########################


How to sample data depends on the model one samples from.
However, the iid module is a generic module to sample data from all modules.
So sampling IID data the preferred alternative is to alter the :ref:`iid` module.
However, sometime for implementational reasons, as some sampling function also takes additional arguments  it is easier to create a new module (as in the case of sampling from data from a SEM using gCastle, see :ref:`gcastle_iidsim` ).


Algorithm module
########################

The graph modules are stored as sub directories of `workflow/rules/structure_learning_algorithms <.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms>`_. 
In order to create a new graph module, you can make a copy of the template module `new_alg <https://github.com/felixleopoldo/benchpress/tree/master/resources/module_templates/new_alg>`__ as

.. prompt:: bash

    cp -r resources/module_templates/new_alg workflow/rules/graph/new_alg

Alternatively, you may copy one of the existing modules. This line 

.. prompt:: bash

   cp -r workflow/rules/graph/pcalg_pc workflow/rules/graph/pcalg_pc_copy

copies the :ref:`pcalg_pc` module to a new module named ``pcalg_pc_copy``.

The content of the modules may be changed in any of the alternatives above while maintaining the structure described below.

Module structure
------------------

An algorithm module has the following basic file structure, where all the files are necessary except for `script.R <https://github.com/felixleopoldo/benchpress/tree/master/resources/module_templates/new_alg/script.R>`__ that may be changed.

::

    new_alg
    ├── rule.smk
    ├── script.R
    ├── script.py
    ├── schema.json
    ├── info.json
    ├── bibtex.bib
    └── docs.rst

In this section we show the content for the module template `new_alg <https://github.com/felixleopoldo/benchpress/tree/master/resources/module_templates/new_alg>`__.
The file `rule.smk <https://github.com/felixleopoldo/benchpress/tree/master/resources/module_templates/new_alg/rule.smk>`__ contains a  `Snakemake rule <https://snakemake.readthedocs.io/en/stable/snakefiles/rules.html#>`_ with the proper name and output fields.
This template runs `script.R <https://github.com/felixleopoldo/benchpress/tree/master/resources/module_templates/new_alg/script.R>`__ (shown below) but you may change either the entire file or the content of it. 
You should not alter the name or the output fields.

.. code-block:: python
    
    rule:
        name:
            module_name
        input:
            data = alg_input_data()        
        output:
            adjmat = alg_output_adjmat_path(module_name),
            time = alg_output_time_path(module_name),
            ntests = alg_output_ntests_path(module_name)
        container:
            None # Make sure R and R.utils is installed 
        script:
            "script.R"

The module specific variables available in the script are generated from the `JSON <https://www.json.org/json-en.html>`_ config file. 
In particular, in order to use the module, you need to add the following piece of `JSON <https://www.json.org/json-en.html>`_ to the ``resources -> graph`` section.

.. code-block:: json

    "new_alg": [
        {
            "id": "testalg",
            "thresh": 0.8,
            "timeout": null
        }
    ]

This will make the parameters ``thresh`` and ``timeout``, accessible in the script. 
Note that the values are passed as string and might have to be converted to suite your script.

.. role:: r(code)
   :language: r

`script.R <https://github.com/felixleopoldo/benchpress/tree/master/resources/module_templates/new_alg/script.R>`__ generates a random binary symetric matrix (undirected graph).
The result is saved in :r:`snakemake@output[["adjmat"]]`, which is generated from the rule. 

.. code-block:: r

    source("workflow/scripts/utils/add_timeout.R")

    filename <- file.path(snakemake@output[["adjmat"]])
    filename_data <- snakemake@input[["data"]]
    seed <- as.integer(snakemake@wildcards[["replicate"]])

    myalg <- function() {
        # Here is where you should put your algorithm.
        data <- read.csv(filename_data, check.names = FALSE)
        start <- proc.time()[1]

        # This is a very fast and bad algorithm.
        threshold <- float(snakemake@wildcards[["thresh"]])
        p <- ncol(data)
        Sys.sleep(3)
        set.seed(seed)
        adjmat <- matrix(runif(p * p), nrow = p, ncol = p) > threshold
        adjmat <- 1 * (adjmat | t(adjmat))
        diag(adjmat) <- 0
        totaltime <- proc.time()[1] - start
        colnames(adjmat) <- names(data) # Get the labels from the data
        
        write.csv(adjmat, file = filename, row.names = FALSE, quote = FALSE)
        write(totaltime, file = snakemake@output[["time"]])
        # Write the true number of c.i. tests here if possible.
        cat("None", file = snakemake@output[["ntests"]], sep = "\n") 
    }

    add_timeout(myalg)

In general the vairables available in the script is are generated from the `Snakemake rule <https://snakemake.readthedocs.io/en/stable/snakefiles/rules.html#>`_ and the `JSON <https://www.json.org/json-en.html>`_ config file. 
Variables are then automatically accessible in the script.
See the `Snakemake documentation <https://snakemake.readthedocs.io/en/stable/snakefiles/rules.html#external-scripts>`__ for further details of how to access variables in script.

* `info.json <https://github.com/felixleopoldo/benchpress/tree/master/resources/module_templates/new_alg/info.json>`__ is a `JSON <https://www.json.org/json-en.html>`_ file to be parsed when generating the documentation.
* `schema.json <https://github.com/felixleopoldo/benchpress/tree/master/resources/module_templates/new_alg/schema.json>`__ is a `JSON schema <https://json-schema.org/>`_  for the module.
* `docs.rst <https://github.com/felixleopoldo/benchpress/tree/master/resources/module_templates/new_alg/docs.rst>`__ is a documentation file in `reStructuredText <https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html>`_ (RST) format.
* `bibtex.bib <https://github.com/felixleopoldo/benchpress/tree/master/resources/module_templates/new_alg/bibtex.bib>`__ is a `BibTeX <http://www.bibtex.org/Format/>`_ file with references that will be show in the docs.



Evaluation module
########################

Updating the docs
########################

When a new module is installed you may also update the documentation.
First install some requirements 

.. prompt:: bash

    cd docs/
    pip install -r _source/requirements.txt

Then make *render_docs.sh* executable then render and build the documentation

.. prompt:: bash
    
    chmod +x render_docs.sh

.. prompt:: bash

    ./render_docs.sh && make html

Open *build/html/index.html* in a browser.

