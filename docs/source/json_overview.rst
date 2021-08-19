
JSON config file
##################

.. This overview is based on the sample config file :download:`config/sec6.1.json <../../config/sec6.1.json>`. 
.. The configuration file consists of two main sections ``benchmark_setup`` and ``resources``.
An overview of how the config file is structured can be read about in the paper [3]_ .
For specific information about each element in the JSON files see the documentation generated from the `JSON schema <https://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema>`_.



..  , see :numref:`maincats`.



.. .. _maincats:
.. .. figure:: _static/maincats_exp.png
..     :width: 400

..     Main sections in :download:`config/sec6.1.json <../../config/sec6.1.json>`.

.. * ``resources`` contains the available resources in terms of graphs, parameters, data and structure learning algorithms.
.. * ``benchmark_setup`` defines the actual benchmarking setup, where the resourses are references by their corresponding ``id``.

    
``benchmark_setup``
********************

This section contains two main sections ``data`` and ``evaluation`` described below.

.. _benchmark_setup:
.. .. figure:: _static/benchmark_setup.png
..     :width: 400

..     Expanded ``benchmark_setup`` in :download:`config/sec6.1.json <../../config/sec6.1.json>`. 



``data``
========
A list where each item defines a certain data setup with the following fields.

* ``graph_id`` an id from a :ref:`graph` module.
* ``parameters_id`` an id from a :ref:`parameters` module.
* ``data_id`` an id from the :ref:`data` module.
* ``seed_range`` a range of seeds used for random number generation.  


.. rubric:: Example

.. code-block:: json

    [{
        "graph_id": "avneigs4",
        "parameters_id": "binbn",
        "data_id": "example1",
        "seed_range": [
            1,
            50
        ]
    }]


``evaluation``
===============

The available evaluation methods.

.. _rocdef:

``roc``
-------
This module defines a metric for comparing graphs which may also be applied to *mixed graphs*, having a combination of edges oriented in different ways (directed or undirected), thus we distinguish between the orientations.


We assign to every edge :math:`e \in E'` the true positive score :math:`TP(e)=1` if :math:`e` is contained in :math:`E` with the same orientation (:math:`e` being undirected in both :math:`E` and :math:`E'` or :math:`e` having the same direction in both :math:`E` and :math:`E'`), :math:`TP(e)=1/2` if :math:`e` is contained in :math:`E` with a different orientation, otherwise :math:`TP(e)=0`.
The false positive score :math:`FP(e)` is defined analogously.
First let :math:` \bar E` denote the complementary set of :math:`E` in the sense that directed edges are reversed and undirected edges (non-edge) are removed (added).
For every edge :math:`e \in \bar E'`, :math:`FP(e)=1` if :math:`e` is contained in :math:` \bar E` with the same orientation 
and :math:`FP(e)=1/2` if :math:`e` is contained in :math:` \bar E`  with a different orientation, otherwise :math:`FP(e)=0`.

The total true and false positive edges (TP and FP) are obtained  as the sum of the individual edge scores, *i.e.*

.. math::

    TP := \sum_{e\in E} TP(e), \quad FP := \sum_{e\in E} FP(e).

We define the true and false positive rates (FPRp and TPR) as

.. math::
    FPRp := \frac{FP}{P},\quad TPR := \frac{TP}{P},

where :math:`P:=|E|` denotes the total number of edges in :math:`G`.
Note that TP and FP reduces to the ordinary counting true and false positives when all edges are undirected in both :math:`G` and :math:`G'`.

.. The ``roc`` module evaluates the TPR and FPRp for each seed in ``seed_range`` and the median (mean) FPRp is plotted against the median (mean) TPR in ROC type sub figures using *ggplot2*  based on the graph, parameters and data modules used.
.. The top three title rows of each sub figure describe, from top to bottom, the objects from the graph, parameters and data modules.
.. The varying parameter forming the curve should be given as a list of values in the corresponding algorithm object.
.. A parameter could for example be the significance level in a test procedure of a constraint-based algorithm, or a parameter of the score function in a score-based method.

.. The ``id``'s for the objects that should be part of the evaluation should be placed in a list called ``ids``.
.. The ``filename_prefix`` field specifies a prefix of the produced files.
.. The user can choose to show points (``points``), parameter values (``text``), lines between the points or values (``path``), and error bars showing the 5% and 95% quantiles of the TPR (``errorbar``).

.. The ROC evaluation metric plots the number of false postive (FPRp) and true postive (TPR) edge rates, in the so called *pattern graph* of a DAG :math:`G=(V,E)`, where :math:`V` is the node set and :math:`E` is the edge set.

.. If :math:`G'=(V',E')` regarded as an estimate of :math:`G=(V,E)`, these metrics are defined as

.. .. math::
    
..     FPRp := \frac{FP}{P},\quad TPR := \frac{TP}{P},
    
.. where

.. .. math::

..     P:=|E|, \quad TP := |E \cap E'|, \quad FP:=|\bar E \cap E'|.

.. ``algorithm_id`` is the current algorithm and ``curve_variable`` is the varying parameter in the plot.
.. In order to get the curve like form in the plot, you need to make sure that ``curve_variable`` is given as a list in the corresponding algorithm's section.

.. See `JSON schema <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-roc-item.md>`_



.. rubric:: Example


.. code-block:: json

    {   
        "filename_prefix": "example/",
        "point": true,
        "errorbar": true,
        "path": true,
        "text": false,
        "ids": [
            "fges-sem-bic",
            "mmhc-bge-zf",
            "omcmc_itsample-bge",
            "pc-gaussCItest"
        ]
    }
    

``adjmat_true_plots``
-------------------------

This module plots the adjacency matrices of the true graphs. 
The plots are saved in sub directories of *results/adjmat/* and copied to *results/output/adjmat_true_plots/* for easy reference.

``adjmat_plots``
-------------------------

This module plots the adjacency matrices of the estimated graphs. 
The figures are saved in *results/adjmat* and copied to *results/output/adjmat_plots/*.

``graph_true_plots``
-------------------------

This module plots the true underlying graphs. 
The figures are saved in *results/adjmat* and copied to *results/output/graph_true_plots/*.


``graph_plots``
-------------------------

This module plots and saves the estimated graphs in dot-format. 
The figures are saved in *results/adjmat* and copied to *results/output/graph_plots/*.

``mcmc_heatmaps``
-------------------------

For Bayesian inference it is custom to use MCMC methods to simulate a Markov chain of graphs :math:`\{G^l\}_{l=0}^\infty` having the graph posterior as stationary distribution.
Suppose we have a realisation of length :math:`M + 1` of such chain, then the posterior edge probability of an edge e is estimated by :math:`\frac{1}{M+1-b} \sum_{l=b}^{M} \mathbf{1}_{e}(e^l)`, where the first :math:`b` samples are disregarded as a burn-in period.

This module has a list of objects, where each object has an id field for the algorithm object id and a field (``burn_in``) for specifying the burn-in period. 
The estimated probabilities are plotted in heatmaps using seaborn which are saved in *results/mcmc_heatmaps/* and copied to *results/output/mcmc_heatmaps/* for easy reference.

.. rubric:: Example

.. code-block:: json

    [
        {
            "id": "omcmc_itsample-bge",
            "burn_in": 0,
            "active": true
        }
    ]

``mcmc_autocorr``
-------------------------

The ``mcmc_autocorr`` module plots the auto-correlation of a functional of the graphs in a MCMC trajectory. 
Similar to the ``mcmc_traj_plots`` module, the ``mcmc_autocorr`` module has a list of objects, where each object has an id, ``burn_in``, ``thinning``, and a ``functional`` field. 
The maximum number of lags after thinning, is specified by the lags field. 
The plots are saved in *results/mcmc_autocorr/* and copied to *results/output/mcmc_autocorr/*.

.. rubric:: Example

.. code-block:: json
    
    [
        {
            "id": "omcmc_itsample-bge",
            "burn_in": 0,
            "thinning": 1,
            "lags": 50,
            "functional": [
                "score",
                "size"
            ],
            "active": true
        }
    ]

``mcmc_traj_plots``
-------------------------

This module plots the so called score values in the trajectory or the value of a given functional. 
The currently supported functionals are the number of edges for the graphs (``size``) and the graph score. 
The ``mcmc_traj_plots`` module has a list of objects, where each object has an id field for the algorithm object id, a burn-in field (``burn_in``) and a field specifying the functional to be considered (``functional``). 
Since the trajectories tend to be very long, the user may choose to thin out the trajectory by only considering every graph at a given interval length specified by the thinning field. 
The plots are saved in *results/mcmc_traj_plots/* and copied to *results/output/mcmc_traj_plots/*.

.. rubric:: Example

.. code-block:: json
        
    [
        {
            "id": "omcmc_itsample-bge",
            "burn_in": 0,
            "thinning": 1,
            "functional": [
                "score",
                "size"
            ],
            "active": true
        }
    ]


``resources``
*************


The  catergories ``graph``, ``parameters``, ``data``, and ``structure_learning_algorithms``
contain the available models, data, and structure learning algorithms, see :numref:`resources`.
Each algorithm has a unique id in its own section which may be referenced from the ``benchmark_setup->data`` and ``benchmark_setup->evaluation``  sections, see :numref:`setup`.


.. _resources:
.. .. figure:: _static/resources.png
..     :width: 400

..     Expanded ``resources`` in :download:`config/sec6.1.json <../../config/sec6.1.json>`. 




.. .. _setup:
.. .. figure:: _static/setup.png
..     :width: 400

..     Expanded ``resources`` and ``benchmark_setup`` in :download:`config/sec6.1.json <../../config/sec6.1.json>`. 


.. include:: available_graphs.rst
.. include:: available_parameters.rst
.. include:: available_data.rst
.. include:: available_structure_learning_algorithms.rst


.. [3] Felix L. Rios and Giusi Moffa and Jack Kuipers Benchpress: a scalable and platform-independent workflow for benchmarking structure learning algorithms for graphical models. ArXiv eprints., 2107.03863, 2021.

