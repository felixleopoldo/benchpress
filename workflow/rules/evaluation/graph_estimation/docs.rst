This module estimates, conversions, and plots,

* Fields
    * **ids**: List of algorithm module id's
    * **convert_to**: This option enables conversions to other graph types:        
        
        * "cpdag": conversion to CPDAG (requires DAG or CPDAG)
        * "pattern": pattern of the CPDAG (requires DAG CPDAG)
        * "skeleton": all edges undirected
    * **graph**: Graphs estimated by the algorithm plotted using graphviz
    * **adjmat**: Adjacency matrix of the graph plotted
    * **graphvizcompare**: Graph comparison using *graphviz.compare* from `bnlearn <https://www.bnlearn.com/>`_ (requires the true graph to be provided)
    * **diffplots**: Plots the difference between the estimated graph and the true graph in an adjacency matrix
    * **csv**: Saves the adjacency matrix to a csv file

.. note::

    This module replaces the :ref:`graph_plots` module.