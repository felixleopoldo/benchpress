

.. _benchmarks: 

benchmarks 
--------------

.. rubric:: Benchmarks

.. list-table:: 

   * - Module
     - `benchmarks <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/evaluation/benchmarks>`__



.. rubric:: Description


Fields of this module

+---------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-----+
| Field               | Description                                                                                                                                                                                                          |     |
+---------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-----+
| ``filename_prefix`` | the prefix for the produced files.                                                                                                                                                                                   |     |
+---------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-----+
| ``show_seed``       | shows the seed numbers in the ROC type plots and for the outliers in the box-plots.                                                                                                                                  |     |
+---------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-----+
| ``errorbar``        | shows vertical estimated 5% and 95% quantiles in the ROC type plots.                                                                                                                                                 |     |
+---------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-----+
| ``errorbarh``       | shows horisontal estimated 5% and 95% quantiles in the ROC type plots.                                                                                                                                               |     |
+---------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-----+
| ``scatter``         | shows scatterplots in the ROC type plots.                                                                                                                                                                            |     |
+---------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-----+
| ``path``            | joins the median values of each parameter setting for a specific with a line. So for this to become a path, you need to specify range of values for some of the fields in the corresponding algorithm module object. |     |
+---------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-----+
| ``text``            | shows the parameter value in the ROC type plots. If this is set to false, a dot will be plotted instead.                                                                                                             |     |
+---------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-----+


This module produces the following CSV files and directories with files

+------------------------+------------------------------------------------------------------------------------------------------------+
| *elapsed_time_join*    | Box-plots for the total times over all seeds.                                                              |
+------------------------+------------------------------------------------------------------------------------------------------------+
| *f1_skel_joint*        | F1 score box-plots.                                                                                        |
+------------------------+------------------------------------------------------------------------------------------------------------+
| *FNR_FPR_skel*         | Median false negative rate (FNR) / false positive rate (FPRp) for the skeleton graph (undirected version). |
+------------------------+------------------------------------------------------------------------------------------------------------+
| *FPR_TPR_skel*         | Median FPRp / TPR for the skeleton graph (undirected version).                                             |
+------------------------+------------------------------------------------------------------------------------------------------------+
| *FPR_TPR_pattern*      | Median FPRp / TPR for the pattern graph (same as skeleton for undirected graphs).                          |
+------------------------+------------------------------------------------------------------------------------------------------------+
| *FPRp_FNR_skel*        | Median FPRp / FNR for the skeleton graph.                                                                  |
+------------------------+------------------------------------------------------------------------------------------------------------+
| *graph_type*           | Plots the type of graph for each graph estimate.                                                           |
+------------------------+------------------------------------------------------------------------------------------------------------+
| *joint_benchmarks.csv* | Benchmarks joined in a CSV file (this ay be analyzed using any preferred software).                        |
+------------------------+------------------------------------------------------------------------------------------------------------+
| *ntests_joint*         | Box-plots for number of statistical tests (this is only applicable for some algorithms).                   |
+------------------------+------------------------------------------------------------------------------------------------------------+
| *ROC_data.csv*         | Summarized benchmarks joined in a CSV file.                                                                |
+------------------------+------------------------------------------------------------------------------------------------------------+
| *SHD_cpdag_joint*      | Structural Hamming distance (SHD) box-plots.                                                               |
+------------------------+------------------------------------------------------------------------------------------------------------+

    
..  figure:: ../_static/alarm/FPR_TPR_skel.png
    :alt: FPR_TPR_skel.png 
    :width: 500

    *FPR_TPR_skel.png* 

The following plots are also produced

..  figure:: ../_static/alarm/elapsed_time_joint.png
    :alt: Timing 
    :width: 500

    *elapsed_time_joint.png*

..  figure:: ../_static/alarm/f1_skel_joint.png
    :alt: F1 
    :width: 500

    *f1_skel_joint.png*

..  figure:: ../_static/alarm/graph_type.png
    :alt: Graph type 
    :width: 500

    *graph_type.png* 


.. rubric:: Example


.. code-block:: json


    [
      {
        "filename_prefix": "example/",
        "show_seed": true,
        "errorbar": true,
        "errorbarh": false,
        "scatter": true,
        "xlim": [
          0,
          0.3
        ],
        "ylim": [
          0,
          1
        ],
        "path": true,
        "text": false,
        "ids": [
          "fges-sem-bic",
          "pc-gaussCItest",
          "mmhc-bge-zf",
          "omcmc_itsample-bge"
        ]
      }
    ]
