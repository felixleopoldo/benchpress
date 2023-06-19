* Bnlearn objects `bn.fit` objects should be stored in `RDS` format in the directory *resources/myparams/bn.fit_networks*.
* Weight matrices for SEM models should be stored in CSV format in *resources/myparams/sem_params*.


.. rubric:: Example

Example standard networks mostly from the `bnlearn repository <https://www.bnlearn.com/bnrepository/>`_ are found `here <https://github.com/felixleopoldo/benchpress/tree/master/resources/parameters/myparams/bn.fit_networks>`_.


.. important::

    This must be combined with the correct graph of the network. For example, ``asia.rds`` should be used with the graph ``asia.csv``, which is the corresponding adjacency matrix.
