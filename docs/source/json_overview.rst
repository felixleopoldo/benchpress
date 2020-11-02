
JSON file overview
#############################

In this overview, the file :download:`config.sample.json <../../config.sample.json>` is used.

The figures are generated using `JSON Editor Online <https://jsoneditoronline.org>`_.

Overview
""""""""
The configuration file is required to consist of two main categories.

.. image:: _static/maincats.png
   :width: 400

*   The first catrgories 

    *   ``graph_sampling_algorithms``
    *   ``parameters_sampling_algorithms``
    *   ``data_sampling_algorithms``
    *   ``structure_learning_algorithms``.   

    contains the available algorithms for 
    models, data, and structure learning 
    
    Each algorithm has a unique id in its own category.

*   The second category 

    *   ``benchmark_setup``
    
benchmark_setup
"""""""""""""""

This defines the benchmark setup in three main categories: 

*   ``structure_learning_algorithms``: id´s of structure_learning_algorithms to be considered
*   ``data``: A list of the data simulation setups.
*   ``evaluation``: A list of 

.. figure:: _static/confsetup.png
    :width: 400

    An example of the key ``benchmark_setup`` in :download:`config.sample.json <../../config.sample.json>`. 