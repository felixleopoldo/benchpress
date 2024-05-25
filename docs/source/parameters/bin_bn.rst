

.. _bin_bn: 

bin_bn 
----------

.. rubric:: Binary BN

.. list-table:: 

   * - Package
     - Benchpress
   * - Version
     - 
   * - Language
     - `R <https://www.r-project.org/>`__
   * - Docs
     - 
   * - Paper
     - :footcite:t:`rios2021benchpress`
   * - Graph type
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
   * - Docker 
     - `bpimages/benchpress:2.1.0 <https://hub.docker.com/r/bpimages/benchpress/tags>`__
   * - Module
     - `bin_bn <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/parameters/bin_bn>`__



.. rubric:: Description


An object of this module defines a binary Bayesian network (where the nodes are binary variables) by sampling its conditional probability tables.
More specifically, the conditional probability tables for each variable :math:`Y_i` and parent configuration :math:`pa(Y_i)` are distributed as

.. math::

    P(Y_i=0 | pa(y_i) ) \sim \mathrm{Unif}([a, b]),

where  :math:`(a,b) \in [0,1]^2, a<b` and :math:`\mathrm{Unif}(c)` denotes the uniform distribution on the set :math:`c`.


.. Source: `resources/binarydatagen/generatebinaryBNf.r <https://github.com/felixleopoldo/benchpress/blob/master/resources/binarydatagen/generatebinaryBNf.r>`_

.. See `JSON schema <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-generatebinarybn.md>`_


.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "binbn",
        "min": 0.1,
        "max": 0.9
      }
    ]

.. footbibliography::

