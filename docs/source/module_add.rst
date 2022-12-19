Graph module
########################

The graph modules are stored as sub directories of `workflow/rules/graph <../../../workflow/rules/graph>`_. 
In order to create a new graph module, you can make a copy of the template module `new_graph <../../../resources/module_templates/new_graph>`__ as

.. prompt:: bash

    cp -r resources/module_templates/new_graph workflow/rules/graph/new_graph

Alternatively, you may copy one of the existing modules. This line 

.. prompt:: bash

   cp -r workflow/rules/graph/pcalg_randdag workflow/rules/graph/pcalg_randdag_copy

copies the :ref:`pcalg_randdag` module to a new module named ``pcalg_randdag_copy``.

The content of the modules may be changed in any of the alternatives above while maintaining the structure described below.

Module structure
------------------

A graph module has the following basic file structure, where all the files are necessary except for `script.R <../../../resources/module_templates/new_graph/script.R>`__ that may be changed.

::

    new_graph
    ├── rule.smk
    ├── script.R
    ├── schema.json
    ├── info.json
    ├── bibtex.bib
    └── docs.rst

In this section we show the content for the module template `new_graph <../../../resources/module_templates/new_graph>`__.
The file `rule.smk <../../../resources/module_templates/new_graph/rule.smk>`__ contains a  `Snakemake rule <https://snakemake.readthedocs.io/en/stable/snakefiles/rules.html#>`_ with the proper name and output fields.
This template runs `script.R <../../../resources/module_templates/new_graph/script.R>`__ (shown below) but you may change either the entire file or the content of it. 
The container is set to `None` in the example in order to force local execution.
On deployment (pushing to Benchpress repository) this field should be a `Docker Hub <https://hub.docker.com/>`__ uri on the form *docker://username/image:version*.
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

`script.R <../../../resources/module_templates/new_graph/script.R>`__ generates a random binary symetric matrix (undirected graph).
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

* `info.json <../../../resources/module_templates/new_graph/info.json>`__ is a `JSON <https://www.json.org/json-en.html>`_ file to be parsed when generating the documentation.
* `schema.json <../../../resources/module_templates/new_graph/schema.json>`__ is a `JSON schema <https://json-schema.org/>`_  for the module.
* `docs.rst <../../../resources/module_templates/new_graph/docs.rst>`__ is a documentation file in `reStructuredText <https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html>`_ (RST) format.
* `bibtext.bib <../../../resources/module_templates/new_graph/bibtex.bib>`__ is a `BibTeX <http://www.bibtex.org/Format/>`_ file with references that will be show in the docs.


Parameters module
########################

Data module
########################

Algorithm module
########################

Evaluation module
########################

Updating the docs
########################

When a new module is installed you may also update the documentation.
First install some requirements 

.. prompt:: bash

    cd docs/
    pip install -r _source/requirements.txt

First make *render_docs.sh* executable then render and build the documentation

.. prompt:: bash
    
    chmod +x render_docs.sh

.. prompt:: bash

    ./render_docs.sh && make html

Open *build/html/index.html* in a browser.

