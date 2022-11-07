
``pcalg_randdag``
-------------------------


+----------------+-------------------+
| Module name    | pcalg_randdag     |
+----------------+-------------------+
| Package        | pcalg             |
+----------------+-------------------+
| Version        | 2.7-3             |
+----------------+-------------------+
| JSON object    | See JSON schema   |
+----------------+-------------------+
| Documentation  | pcalg docs        |
+----------------+-------------------+
| Paper          | -                 |
+----------------+-------------------+
| Snakemake rule | pcalg_randdag.smk |
+----------------+-------------------+
| Script         | pcalg_randdag.R   |
+----------------+-------------------+

This is the *randDAG* from the R package `pcalg <https://cran.r-project.org/web/packages/pcalg/pcalg.pdf>`_  with the extra feature that the maximum average number of parents can be set by ``max_parents``.

An object of the pcalg_randdag module specifies a graph generated using the randDAG
function from the pcalg package (Kalisch et al. 2012), with the extra functionality of restricting
the maximal number of parents per node (max_parents). It samples a random graph with n
nodes and d neighbours per node on average, using the algorithm specified by method with
parameters par1 and par2, for further details see Kalisch et al.

.. Source `resources/binarydatagen/generate_DAG.R <https://github.com/felixleopoldo/benchpress/blob/master/resources/binarydatagen/generate_DAG.R>`_

.. See `JSON schema <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-generatedagmaxparents.md>`_ 




.. rubric:: Example


.. code-block:: json

    {
        "id": "avneigs4",
        "max_parents": 5,
        "n": 80,
        "d": 4,
        "par1": null,
        "par2": null,
        "method": "er",
        "DAG": true
    }
