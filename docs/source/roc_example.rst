Examples of data models
########################

.. This example plots ROC curves (see :ref:`benchmarksdef`) for some of the available structure learning algorithms.

.. The plot is stored in ``results/ROC.eps``. 
.. The data for the plot is stored in ``results/output/benchmarks/ROC_data.csv``. 

Example JSON file are found under *config/*.


Examples of different setups of the ``benchmark_setup->data`` section.

Fully sampled model
*************************************
.. This example is based on the config file :download:`config/sec6.1.json <../../config/sec6.1.json>`.

The model is fully random Bayesian network model in the sense that both the DAG and the parameters are random.



.. code-block:: json
    
    {
        "graph_id": "DAGavpar2p80",
        "parameters_id": "binary_bn",
        "data_id": "iid160",
        "seed_range": [
            1,
            5
        ]
    }

.. .. image:: _static/ROC_fullysampled.png
..    :width: 400


Fixed graph
****************************************


I this model, the DAG is specified as a ``.csv`` and parameters for a binary Bayesian network is random.

.. code-block:: json

    {
        "graph_id": "hepar2.csv",
        "parameters_id": "binary_bn",
        "data_id": "iid160",
        "seed_range": [
            1,
            5
        ]
    }



Fixed graph and parameters
***************************************

This is a fixed *bnlearn* Bayesian network specified as a ``.rds`` file.

.. code-block:: json

    {
        "graph_id": "hepar2.csv",
        "parameters_id": "hepar2.rds",
        "data_id": "iid2000",
        "seed_range": [
            1,
            5
        ]
    }

    
.. .. figure:: _static/ROC_fixedgraphparams.png
..     :width: 400


Fixed graph and data
************************************


In this example, the data is fixed and specified as a ``.csv`` file and the underlying graph (DAG) is specified as a ``.csv`` file.

.. code-block:: json

    {
        "graph_id": "hepar2.csv",
        "parameters_id": null,
        "data_id": "myhepar2data2000.csv",
        "seed_range": null
    }

.. .. figure:: _static/ROC_fixeddata.png
..     :width: 400