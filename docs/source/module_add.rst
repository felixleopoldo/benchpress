Adding new modules 
*******************

All modules have the following basic file structure, where all the files are necessary except for *script.R* that may be replaced by some `alternative script <https://snakemake.readthedocs.io/en/stable/snakefiles/rules.html#external-scripts>`_.
However, to get something working, you only have to consider altering *script.R* (or some alternative and in that case also *rule.smk*) and the modules `JSON <https://www.json.org/json-en.html>`_ snippets, as shown in the examples below.

::

    module_name
    ├── rule.smk
    ├── script.R
    ├── schema.json
    ├── info.json
    ├── bibtex.bib
    └── docs.rst

* *info.json* is a `JSON <https://www.json.org/json-en.html>`_ file to be parsed when :ref:`update_docs`.
* *schema.json* is a `JSON schema <https://json-schema.org/>`_  for the module. On deployment you should alter this to restrict the fields for the `JSON <https://www.json.org/json-en.html>`_ file.
* *docs.rst* is a documentation file in `reStructuredText <https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html>`_ (RST) format that will be included when :ref:`update_docs`. 
* This file should contain an overview of the module and further explanation of the `JSON <https://www.json.org/json-en.html>`_ fields if needed.
* *bibtex.bib* is a file with references in `BibTeX <http://www.bibtex.org/Format/>`_  format that will be accessible in *docs.rst* (using `sphinxcontrib-bibtex <https://sphinxcontrib-bibtex.readthedocs.io/en/latest/>`_ syntax) and shown in the documentation.
* *rule.smk* contains a `Snakemake rule <https://snakemake.readthedocs.io/en/stable/snakefiles/rules.html#>`_ with the required fields of the proper form.  
* The container field is set to `None` in all of the example rules below in order to force local execution. On deployment (pushing to Benchpress repository) however, this field should be a `Docker Hub <https://hub.docker.com/>`__ URI on the form *docker://username/image:version*.
* *script.R* contains an `R <https://www.r-project.org/>`_-script that is called by the rule. Variables available in the script is are generated both from the `Snakemake rule <https://snakemake.readthedocs.io/en/stable/snakefiles/rules.html#>`_ and the `JSON <https://www.json.org/json-en.html>`_ object for the module file (form the *wildcards* dict). See the `Snakemake documentation <https://snakemake.readthedocs.io/en/stable/snakefiles/rules.html#external-scripts>`__ for further details of how to access variables in scripts. Note that the values are passed as string and might have to be converted to suite your specific script.

The modules are stored in sub directories of `workflow/rules/ <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/>`__. 

.. role:: r(code)
   :language: r

Graph module
########################

To create a new graph module, you may either copy the template module `new_graph <https://github.com/felixleopoldo/benchpress/tree/master/resources/module_templates/new_graph>`__ as

.. prompt:: bash

    cp -r resources/module_templates/new_graph workflow/rules/graph/new_graph

or one of the existing modules.
The following line copies  :ref:`pcalg_randdag`  to a new module named ``pcalg_randdag_copy``.

.. prompt:: bash

   cp -r workflow/rules/graph/pcalg_randdag workflow/rules/graph/pcalg_randdag_copy

Template structure
------------------

:numref:`new_graph_rule` shows `rule.smk <https://github.com/felixleopoldo/benchpress/tree/master/resources/module_templates/new_graph/rule.smk>`__ from `new_graph <https://github.com/felixleopoldo/benchpress/tree/master/resources/module_templates/new_graph>`__, which takes no input files and runs `script.R <https://github.com/felixleopoldo/benchpress/tree/master/resources/module_templates/new_graph/script.R>`__.

.. code-block:: python
    :name: new_graph_rule
    :caption: rule.smk in the new_graph template.
    
    rule:
        name:
            module_name
        output:
            adjmat = "{output_dir}/adjmat/"+pattern_strings[module_name]+"/seed={seed}.csv"
        container:
            None
        script: 
            "script.R"


:numref:`new_graph_script` shows `script.R <https://github.com/felixleopoldo/benchpress/tree/master/resources/module_templates/new_graph/script.R>`__, which generates a random undirected graph (symmetric binary matrix) and saves it properly.

.. to the ``adjmat`` variable of the ``output`` field of `rule.smk <https://github.com/felixleopoldo/benchpress/tree/master/resources/module_templates/new_graph/rule.smk>`__.

.. code-block:: r
    :name: new_graph_script
    :caption: script.R in the new_graph template.

    p <- as.integer(snakemake@wildcards[["p"]])

    set.seed(as.integer(snakemake@wildcards[["seed"]]))
    adjmat <- matrix(runif(p * p), nrow = p, ncol = p) > 0.8 
    adjmat <- 1 * (adjmat | t(adjmat)) # Make it symmetric (undirected)
    diag(adjmat) <- 0 # No self loops
    colnames(adjmat) <- as.character(seq(p))

    write.table(snakemake@output[["adjmat"]],
                file = filename, row.names = FALSE,
                quote = FALSE, col.names = TRUE, sep = ","
                )

In order to use the module, you need to add the following piece of `JSON <https://www.json.org/json-en.html>`_ to the ``graph`` subsection of the ``resources`` section in the config file.

.. Here making the variable ``p``  accessible in the script.

.. code-block:: json

    "new_graph": [
        {
            "id": "testmat",
            "p": 5
        }
    ]



Parameters module
########################


To create a new parameters module, you may either copy the template module `new_params <https://github.com/felixleopoldo/benchpress/tree/master/resources/module_templates/new_params>`__ as

.. prompt:: bash

    cp -r resources/module_templates/new_params workflow/rules/parameters/new_params

or one of the existing modules. 
This line copies the :ref:`sem_params` module to a new module named ``sem_params_copy``.

.. prompt:: bash

   cp -r workflow/rules/graph/sem_params workflow/rules/parameters/sem_params_copy


Template structure
------------------

.. In this section we show the content for the module template `new_params <https://github.com/felixleopoldo/benchpress/tree/master/resources/module_templates/new_params>`__.

This template runs `script.R <https://github.com/felixleopoldo/benchpress/tree/master/resources/module_templates/new_params/script.R>`__ (:numref:`new_params_script`) but you may change either the entire file or the content of it. 

.. code-block:: python
    :name: new_params_rule
    :caption: rule.smk in the new_params template.
        
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


:numref:`new_params_script` shows `script.R <https://github.com/felixleopoldo/benchpress/tree/master/resources/module_templates/new_params/script.R>`__, which samples a covariance matrix for a multivariate Gaussian distribution and saves is properly in :r:`snakemake@output[["params"]]`. 
The format of this file depend on the type of parameters used, here we sample the a covariance matrix, which are stored as a matrix in a CSV file.

.. code-block:: r
    :name: new_params_script
    :caption: script.R in the new_params template.

    # As the parameterisation differ between models, there is 
    # no sample script here. 

    seed <- set.seed(as.integer(snakemake@wildcards[["seed"]]))

    # Read the adjacency matrix
    df_adjmat <- read.csv(snakemake@input[["adjmat"]], header = TRUE, check.names = FALSE)
    adjmat <- as.matrix(df_adjmat)

    # Write the parameters to file. 
    cat("Replace this", file = snakemake@output[["params"]], sep = "\n")


To use the module, you need to add the following piece of `JSON <https://www.json.org/json-en.html>`_ to the ``parameters`` section of the `JSON <https://www.json.org/json-en.html>`_ file.
, making the parameter ``param1``, accessible in the script. 

.. code-block:: json

    "new_params": [
        {
            "id": "testparams",
            "param1": 10
        }
    ]



.. role:: r(code)
   :language: r

Data module
########################


How to sample data depends on the model one samples from.
However, the :ref:`iid` module is a generic module to sample data from all modules.
So sampling IID data the preferred alternative is to alter the :ref:`iid` module.
However, sometime for implementational reasons, as some sampling function also takes additional arguments  it is easier to create a new module (as in the case of sampling from data from a SEM using gCastle, see :ref:`gcastle_iidsim` ).


Algorithm module
########################


In order to create a new graph module, you can make a copy of the template module `new_alg <https://github.com/felixleopoldo/benchpress/tree/master/resources/module_templates/new_alg>`__ as

.. prompt:: bash

    cp -r resources/module_templates/new_alg workflow/rules/structure_learning_algorithms/new_alg

Alternatively, you may copy one of the existing modules. This line copies the :ref:`pcalg_pc` module to a new module named ``pcalg_pc_copy``.

.. prompt:: bash

   cp -r workflow/rules/structure_learning_algorithms/pcalg_pc workflow/rules/structure_learning_algorithms/pcalg_pc_copy

Template structure
------------------

In this section we show the content for the module template `new_alg <https://github.com/felixleopoldo/benchpress/tree/master/resources/module_templates/new_alg>`__.
This template runs `script.R <https://github.com/felixleopoldo/benchpress/tree/master/resources/module_templates/new_alg/script.R>`__ (shown below) but you may change either the entire file or the content of it. 

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

In order to use the module, you need to add the following piece of `JSON <https://www.json.org/json-en.html>`_ to the list of structure learning modules in the ``structure_learning_algorithms`` section of the `JSON <https://www.json.org/json-en.html>`_ file, making the parameters ``thresh`` and ``timeout`` accessible in the script. 

.. code-block:: json

    "new_alg": [
        {
            "id": "testalg",
            "thresh": 0.8,
            "timeout": null
        }
    ]

Evaluation module
########################


.. _update_docs:


Updating the documentation
###########################

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

Open *build/html/index.html* in a web browser.

