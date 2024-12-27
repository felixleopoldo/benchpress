


:og:description: Independent component analysis for linear non-Gaussian acyclic models
:og:image:alt: Benchpress logo
:og:sitename: Benchpress causal discovery platform
:og:title: ICA-LiNGAM (gCastle)
 
.. meta::
    :title: ICA-LiNGAM (gCastle)
    :description: Independent component analysis for linear non-Gaussian acyclic models


.. _gcastle_ica_lingam: 

ICA-LiNGAM (gCastle) 
*********************



.. list-table:: 

   * - Module name
     - `gcastle_ica_lingam <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/gcastle_ica_lingam>`__
   * - Package
     - `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`__
   * - Version
     - 1.0.3
   * - Language
     - `Python <https://www.python.org/>`__
   * - Docs
     - 
   * - Paper
     - :footcite:t:`10.5555/1248547.1248619`
   * - Graph type
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
   * - MCMC
     - No
   * - Edge constraints
     - :ref:`Yes <edge_constraints>`
   * - Data type
     - C
   * - Data missingness
     - 
   * - Intervention type
     - 
   * - Docker 
     - `bpimages/gcastle:1.0.3 <https://hub.docker.com/r/bpimages/gcastle/tags>`__




Independent component analysis for linear non-Gaussian acyclic models 
-------------------------------------------------------------------------


Abstract: In recent years, several methods have been proposed for the discovery of causal structure from non-experimental data. Such methods make various assumptions on the data generating process to facilitate its identification from purely observational data. Continuing this line of research, we show how to discover the complete causal structure of continuous-valued data, under the assumptions that (a) the data generating process is linear, (b) there are no unobserved confounders, and (c) disturbance variables have non-Gaussian distributions of non-zero variances. The solution relies on the use of the statistical method known as independent component analysis, and does not require any pre-specified time-ordering of the variables.



.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "gcastle_ica_lingam",
        "thresh": 0.3,
        "random_state": null,
        "max_iter": 1000,
        "timeout": null
      }
    ]

.. footbibliography::

