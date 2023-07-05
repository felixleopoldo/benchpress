.. _new_modules:

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

* *rule.smk* contains a `Snakemake rule <https://snakemake.readthedocs.io/en/stable/snakefiles/rules.html#>`_ with the required fields on the proper form.  
  The template modules run by default in a container based on the Docker image "bpimages/sandbox". 
  To force local execution this should be changed to None, in which case you need to make sure that the used dependencies are installed locally.  
  On deployment (pushing to Benchpress repository) however, this field should be a `Docker Hub <https://hub.docker.com/>`__ URI on the form *docker://username/image:version*.
* *script.R* contains an `R <https://www.r-project.org/>`_-script that is called by the rule. The variables available in the script are generated both from the `Snakemake rule <https://snakemake.readthedocs.io/en/stable/snakefiles/rules.html#>`_ and the `JSON <https://www.json.org/json-en.html>`_ object for the module file (from the *wildcards* dict). See the `Snakemake documentation <https://snakemake.readthedocs.io/en/stable/snakefiles/rules.html#external-scripts>`__ for further details on how to access variables in scripts. Note that the values are passed as strings and might have to be converted to suite your specific script.
* *schema.json* is a `JSON schema <https://json-schema.org/>`_  for the module. On deployment, you should alter this to restrict the fields for the `JSON <https://www.json.org/json-en.html>`_ file.
* *info.json* is a `JSON <https://www.json.org/json-en.html>`_ file to be parsed when :ref:`update_docs`.
* *bibtex.bib* is a file with references in `BibTeX <http://www.bibtex.org/Format/>`_  format that will be accessible in *docs.rst* (using `sphinxcontrib-bibtex <https://sphinxcontrib-bibtex.readthedocs.io/en/latest/>`_ syntax) and shown in the documentation.
* *docs.rst* is a documentation file in `reStructuredText <https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html>`_ (RST) format that will be included when :ref:`update_docs`. This file should contain an overview of the module and further explanation of the `JSON <https://www.json.org/json-en.html>`_ fields if needed.


.. role:: r(code)
   :language: r

The sections below show how to get started developing your own modules. To get a quick start, you may run the following commands in the benchpress directory, to make copy of each of the template modules at once.
Then you can use the config file *config/mysandbox.json* which is configured to use each of them.

.. prompt:: bash

    cp -r resources/module_templates/new_graph workflow/rules/graph/new_graph
    cp -r resources/module_templates/new_params workflow/rules/parameters/new_params
    cp -r resources/module_templates/new_data workflow/rules/data/new_data
    cp -r resources/module_templates/new_alg workflow/rules/structure_learning_algorithms/new_alg
    cp config/sandbox.json config/mysandbox.json    



Graph 
########################

To create a new graph module, you may copy the template module `new_graph <https://github.com/felixleopoldo/benchpress/tree/master/resources/module_templates/new_graph>`__ as

.. prompt:: bash

    cp -r resources/module_templates/new_graph workflow/rules/graph/new_graph

:numref:`new_graph_script` shows `script.R <https://github.com/felixleopoldo/benchpress/tree/master/resources/module_templates/new_graph/script.R>`__, which generates a random undirected graph (symmetric binary matrix) and saves it properly in the CSV format specified in :ref:`file_formats`.

.. to the ``adjmat`` variable of the ``output`` field of `rule.smk <https://github.com/felixleopoldo/benchpress/tree/master/resources/module_templates/new_graph/rule.smk>`__.

.. literalinclude:: ../../resources/module_templates/new_graph/script.R
    :language: r
    :name: new_graph_script
    :caption: script.R from new_graph.

--------

In order to use the module, you need to add the following piece of `JSON <https://www.json.org/json-en.html>`_ to the ``graph`` subsection of the ``resources`` section in the config file.

.. Here making the variable ``p``  accessible in the script.

.. code-block:: json

    "new_graph": [
        {
            "id": "testmat",
            "p": 5,
            "cutoff": 0.8
        }
    ]


Parameters 
########################


To create a new parameters module, you may copy the template module `new_params <https://github.com/felixleopoldo/benchpress/tree/master/resources/module_templates/new_params>`__ as

.. prompt:: bash

    cp -r resources/module_templates/new_params workflow/rules/parameters/new_params

:numref:`new_params_script` shows `script.R <https://github.com/felixleopoldo/benchpress/tree/master/resources/module_templates/new_params/script.R>`__, which samples a covariance matrix for a multivariate Gaussian distribution from the G-Inverse Wishart distribution and saves it. 
This template module uses the `BDgraph <https://cran.r-project.org/web/packages/BDgraph/index.html>`_ to sample the matrix, so this needs to be installed on your system in to be tested.
The format of the saved file depends on the type of parameters used, in this case, since we sample a matrix it can be stored as a CSV file.

.. literalinclude:: ../../resources/module_templates/new_params/script.R
    :language: r
    :name: new_params_script
    :caption: script.R from new_params.

To use the module, you need to add the following piece of `JSON <https://www.json.org/json-en.html>`_ to the ``parameters`` section of the `JSON <https://www.json.org/json-en.html>`_ file.


.. code-block:: json

    "new_params": [
        {
            "id": "gwish",
            "thresh": 1e-8,
            "b": 3
        }
    ]


.. role:: r(code)
   :language: r

Data 
########################


.. While the data sampling procedure depends on the model to sample from, in most cases we are interested in drawing IID samples.
.. The :ref:`iid` module is a generic module to sample data from many different models.
.. So for sampling IID data, the preferred way is to alter the :ref:`iid` module.
.. However, for implementational reasons, as some sampling functions also takes additional arguments it is sometimes easier to create a new module (as in the case of sampling from data from a SEM using `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`_, see :ref:`gcastle_iidsim` ).

The best way to get started is to copy the template module `new_data <https://github.com/felixleopoldo/benchpress/tree/master/resources/module_templates/new_data>`__ as

.. prompt:: bash

    cp -r resources/module_templates/new_data workflow/rules/data/new_data

:numref:`new_data_script` shows `script.R <https://github.com/felixleopoldo/benchpress/tree/master/resources/module_templates/new_data/script.R>`__, which generates i.i.d multivariate Gaussian data and saves it properly in the CSV format specified in :ref:`file_formats`.

.. literalinclude:: ../../resources/module_templates/new_data/script.R
    :language: r
    :name: new_data_script
    :caption: script.R from new_data.


In order to use the module, you need to add the following piece of `JSON <https://www.json.org/json-en.html>`_ to the ``data`` subsection of the ``resources`` section in the config file.

.. Here making the variable ``p``  accessible in the script.

.. code-block:: json

    "new_data": [
        {
            "id": "testdata",
            "n": 100,
            "standardized": false
        }
    ]


Algorithm 
########################

In order to create a new algorithm module, you may copy the template module `new_alg <https://github.com/felixleopoldo/benchpress/tree/master/resources/module_templates/new_alg>`__ as

.. prompt:: bash

    cp -r resources/module_templates/new_alg workflow/rules/structure_learning_algorithms/new_alg

Below are two examples of how to implement an algorithm module, one in R and one in `Python <https://www.python.org/>`_.
Which one to use is set in `rule.smk <https://github.com/felixleopoldo/benchpress/tree/master/resources/module_templates/new_alg/rula.smk>`__

R
------

:numref:`new_alg_script` shows `script.R <https://github.com/felixleopoldo/benchpress/tree/master/resources/module_templates/new_alg/script.R>`__ , which generates a random binary symmetric matrix (undirected data).
Note that the actual algorithm is wrapped into the function *wrapper* which is passed to the function *add_timeout*. 
This is to enable the timeout functionality, which saves an empty data if the algorithm has finished before ``timeout`` seconds, specified in the config file.
However, *add_timeout* is not needed if your algorithm is able to produce results after a specified amount of time.


.. literalinclude:: ../../resources/module_templates/new_alg/script.R
    :language: r
    :name: new_alg_script
    :caption: script.R from new_alg.



Python
-------

:numref:`new_alg_pyscript` shows `script.py <https://github.com/felixleopoldo/benchpress/tree/master/resources/module_templates/new_alg/script.py>`__, which is the `Python <https://www.python.org/>`_ analog of the `R <https://www.r-project.org/>`_-script above.
As in the `R <https://www.r-project.org/>`_-script, to enable the timeout functionality, the actual algorithm is wrapped into the function *myalg* which is then used from Line 39 and below.


.. literalinclude:: ../../resources/module_templates/new_alg/script.py
   :language: python
   :name: asd    
   :caption: script.py from new_alg.
   :linenos:
    
    

-------------

In order to use the module, you need to add the following piece of `JSON <https://www.json.org/json-en.html>`_ to the list of structure learning modules in the ``structure_learning_algorithms`` section of the `JSON <https://www.json.org/json-en.html>`_ file, making the parameters ``cutoff`` and ``timeout`` accessible in the script. 

.. code-block:: json

    "new_alg": [
        {
            "id": "testalg",
            "cutoff": 0.8,
            "timeout": null
        }
    ]


Algorithm (MCMC)
##################

In order to create a new MCMC algorithm module, you may copy the template module `new_mcmcalg <https://github.com/felixleopoldo/benchpress/tree/master/resources/module_templates/new_mcmcalg>`__ as

.. prompt:: bash

    cp -r resources/module_templates/new_mcmcalg workflow/rules/structure_learning_algorithms/new_mcmcalg


This template runs `script.R <https://github.com/felixleopoldo/benchpress/tree/master/resources/module_templates/new_mcmcalg/script.R>`__ (shown below) but you may change either the entire file or the content of it. 


.. literalinclude:: ../../resources/module_templates/new_mcmcalg/script.R
    :language: r
    :name: new_mcmcalg_script
    :caption: script.R from new_mcmcalg.

MCMC algorithms have, apart from the algorithm parameters, four additional required fields, ``mcmc_seed``, ``mcmc_estimator``, ``threshold``, and ``burnin_frac``.
``mcmc_seed`` is the random seed for the algorithm. ``mcmc_estimator`` specifies which estimator to use (*threshold* or *map*), and ``threshold`` specifies the threshold for the estimator if ``mcmc_estimator`` is set to *threshold*.
``burnin_frac`` specifies the fraction of the samples to be discarded as burn-in.
In order to use the module, you can add the following piece of `JSON <https://www.json.org/json-en.html>`_ to the list of structure learning modules in the ``structure_learning_algorithms`` section of the `JSON <https://www.json.org/json-en.html>`_ file.

.. code-block:: json

    "new_mcmcalg": [
        {
            "id": "mcmctest",
            "cutoff": 0.8,
            "burnin_frac": 0.5,
            "mcmc_estimator": "threshold",
            "threshold": 0.5,
            "mcmc_seed": [1, 2, 3],
            "timeout": null
        }
    ]


Evaluation 
########################

There is not yeat a general way of creating evaluation modules as their functionality and output may differ. 
However, you may either extend or copy one of the existing ones.

.. _update_docs:


Updating the documentation
******************************************

When a new module is installed you may also update the documentation.
First install some requirements 

.. prompt:: bash


    pip install -r docs/_source/requirements.txt

Then make *render_docs.sh* executable then render and build the documentation

.. prompt:: bash
    
    cd docs
    chmod +x render_docs.sh

.. prompt:: bash

    ./render_docs.sh
    make html

Open *build/html/index.html* in a web browser to see the result.


.. _ BDgraph: https://cran.r-project.org/web/packages/BDgraph/index.html
