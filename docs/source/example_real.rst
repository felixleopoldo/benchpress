
.. _sachsstudy:

Sachs et al. 2005 data
******************************

Config file: `config/realistic_study.json <https://github.com/felixleopoldo/benchpress/blob/master/config/realistic_study.json>`__.

Command:

.. prompt:: bash

    snakemake --cores all --use-singularity --configfile config/realistic_study.json



We show estimation results for the logged and standardized version (:ref:`2005_sachs_2_cd3cd28icam2_log_std.csv`) of the second dataset *anti-CD3/CD28 + ICAM-2*  from :footcite:t:`doi:10.1126/science.1105809` with 902 observations. 
The data is visualised in :numref:`sachs/pairs_1.png_real` with independent and pairwise scatter plots using the :ref:`ggally_ggpairs` module.


.. _sachs/pairs_1.png_real:

.. figure:: _static/sachs/pairs_1.png
    :width: 500 
    :alt: Scatter plots for logged and standardized anti-CD3/CD28 + ICAM-2 Sachs et al. 2005 data.
    :align: center


    Scatter plots for the logged and standardized Sachs et al. 2005 second dataset (*anti-CD3/CD28 + ICAM-2*).

:numref:`sachs_real` shows the ``benchmark_setup`` section of the config file. 

.. code-block:: json
    :linenos:
    :name: sachs_real
    :caption: The `benchmark_setup` section of Sachs realistic data study.


    "benchmark_setup": [{
        "title": "real_data",
        "data": [
            {
                "graph_id": null,
                "parameters_id": null,
                "data_id": "2005_sachs_2_cd3cd28icam2_log_std.csv",
                "seed_range": null
            }
        ],
        "evaluation": {
            "ggally_ggpairs": true,
            "graph_estimation": {
                "ids": [
                    "fges-sem-bic",
                    "tabu-bge",
                    "itsearch-bge",
                    "pc-gaussCItest"
                ],
                "convert_to": ["cpdag"],
                "graphs": true,
                "adjmats": true,
                "diffplots": false,
                "csvs": true,
                "graphvizcompare": false
            },
            "mcmc_traj_plots": [],
            "mcmc_heatmaps": [],
            "mcmc_autocorr_plots": []
        }
    }]



:numref:`sachs/adjmat_plot_18.png_real` shows the adjacency matrix produced by the :ref:`graph_estimation`  module of the `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__ estimated by the  :ref:`bnlearn_tabu` module.

.. Note that, as the graph that is regarded as the true underlying graph is a perfect DAG, it can be equivalently be represented as an undirected decomposable graph.

.. _sachs/adjmat_plot_18.png_real:

.. figure:: _static/sachs/adjmat_plot_18.png
    :width: 450 
    :alt: Estimated adjmat
    :align: center

    Estimated adjmat.

.. _sachs/graph_29.png_real:

.. figure:: _static/sachs/graph_29.png
    :width: 300     
    :alt: Estimated graph
    :align: center
    
    Estimated graph.




.. rubric:: References


.. footbibliography::