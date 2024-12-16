


:og:description: From the Tetrad manual: FASK learns a linear model in which all of the variables are skewed.  The idea is as follows. First, FAS-stable is run on the data, producing an undirected graph. We use the BIC score as a conditional independence test with a specified penalty discount c.  This yields undirected graph G0 . The reason FAS-stable works for sparse cyclic models where the linear coefficients are all less than 1 is that correlations induced by long cyclic paths are statistically judged as zero, since they are products of multiple coefficients less than 1. Then, each of the X − Y adjacencies in G0 is oriented as a 2-cycle X += Y , or X → Y , or X ← Y . Taking up each adjacency in turn, one tests to see whether the adjacency is a 2-cycle by testing if the difference between corr(X, Y ) and corr(X, Y |X > 0), and corr(X, Y ) and corr(X, Y |Y > 0), are both significantly not zero. If so, the edges X → Y and X ← Y are added to the output graph G1 . If not, the Left-Right orientation is rule is applied: Orient X → Y in G1, if (E(X Y |X > 0)/ E(X 2|X > 0)E(Y 2 |X > 0) − E(X Y |Y > 0)/ E(X 2 |Y > 0)E(Y 2|Y > 0)) > 0; otherwise orient X ← Y . G1 will be a fully oriented graph. For some models, where the true coefficients of a 2-cycle between X and Y are more or less equal in magnitude but opposite in sign, FAS-stable may fail to detect an edge between X and Y when in fact a 2-cycle exists. In this case, we check explicitly whether corr(X, Y |X > 0) and corr(X, Y |Y > 0) differ by more than a set amount of 0.3. If so, the adjacency is added to the graph and oriented using the aforementioned rules.  We include pairwise orientation rule RSkew, Skew, and Tanh from :footcite:t:`hyvarinen2013pairwise`, so in some configurations FASK can be made to implement an algorithm that has been called in the literature 'Pairwise LiNGAM'--this is intentional; we do this for ease of comparison. You'll get this configuration if you choose one of these pairwise orientation rules, together with the FAS with orientation alpha and two-cycle threshold set to zero and skewness threshold set to 1, for instance.  See  :footcite:t:`sanchez2018causal`. 
:og:image:alt: Benchpress logo
:og:sitename: Benchpress causal discovery platform
 
.. meta::
    :title: FASK 
    :description: From the Tetrad manual: FASK learns a linear model in which all of the variables are skewed.  The idea is as follows. First, FAS-stable is run on the data, producing an undirected graph. We use the BIC score as a conditional independence test with a specified penalty discount c.  This yields undirected graph G0 . The reason FAS-stable works for sparse cyclic models where the linear coefficients are all less than 1 is that correlations induced by long cyclic paths are statistically judged as zero, since they are products of multiple coefficients less than 1. Then, each of the X − Y adjacencies in G0 is oriented as a 2-cycle X += Y , or X → Y , or X ← Y . Taking up each adjacency in turn, one tests to see whether the adjacency is a 2-cycle by testing if the difference between corr(X, Y ) and corr(X, Y |X > 0), and corr(X, Y ) and corr(X, Y |Y > 0), are both significantly not zero. If so, the edges X → Y and X ← Y are added to the output graph G1 . If not, the Left-Right orientation is rule is applied: Orient X → Y in G1, if (E(X Y |X > 0)/ E(X 2|X > 0)E(Y 2 |X > 0) − E(X Y |Y > 0)/ E(X 2 |Y > 0)E(Y 2|Y > 0)) > 0; otherwise orient X ← Y . G1 will be a fully oriented graph. For some models, where the true coefficients of a 2-cycle between X and Y are more or less equal in magnitude but opposite in sign, FAS-stable may fail to detect an edge between X and Y when in fact a 2-cycle exists. In this case, we check explicitly whether corr(X, Y |X > 0) and corr(X, Y |Y > 0) differ by more than a set amount of 0.3. If so, the adjacency is added to the graph and oriented using the aforementioned rules.  We include pairwise orientation rule RSkew, Skew, and Tanh from :footcite:t:`hyvarinen2013pairwise`, so in some configurations FASK can be made to implement an algorithm that has been called in the literature 'Pairwise LiNGAM'--this is intentional; we do this for ease of comparison. You'll get this configuration if you choose one of these pairwise orientation rules, together with the FAS with orientation alpha and two-cycle threshold set to zero and skewness threshold set to 1, for instance.  See  :footcite:t:`sanchez2018causal`. 


.. _tetrad_fask: 

tetrad_fask 
***************



.. list-table:: 

   * - Package
     - `causal-cmd <https://github.com/bd2kccd/causal-cmd>`__
   * - Version
     - 1.10.0
   * - Language
     - `Java <https://www.java.com/en/>`__
   * - Docs
     - `here <https://cmu-phil.github.io/tetrad/manual/#search_box>`__
   * - Paper
     - :footcite:t:`sanchez2018causal`, :footcite:t:`hyvarinen2013pairwise`
   * - Graph type
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
   * - Docker 
     - `bpimages/causal-cmd:1.10.0 <https://hub.docker.com/r/bpimages/causal-cmd/tags>`__

   * - Module folder
     - `tetrad_fask <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/tetrad_fask>`__



FASK 
--------


From the Tetrad manual: FASK learns a linear model in which all of the variables are skewed.

The idea is as follows. First, FAS-stable is run on the data, producing an undirected graph. We use the BIC score as a conditional independence test with a specified penalty discount c. 
This yields undirected graph G0 . The reason FAS-stable works for sparse cyclic models where the linear coefficients are all less than 1 is that correlations induced by long cyclic paths are statistically judged as zero, since they are products of multiple coefficients less than 1. Then, each of the X − Y adjacencies in G0 is oriented as a 2-cycle X += Y , or X → Y , or X ← Y . Taking up each adjacency in turn, one tests to see whether the adjacency is a 2-cycle by testing if the difference between corr(X, Y ) and corr(X, Y |X > 0), and corr(X, Y ) and corr(X, Y |Y > 0), are both significantly not zero. If so, the edges X → Y and X ← Y are added to the output graph G1 . If not, the Left-Right orientation is rule is applied: Orient X → Y in G1, if (E(X Y |X > 0)/ E(X 2|X > 0)E(Y 2 |X > 0) − E(X Y |Y > 0)/ E(X 2 |Y > 0)E(Y 2|Y > 0)) > 0; otherwise orient X ← Y . G1 will be a fully oriented graph. For some models, where the true coefficients of a 2-cycle between X and Y are more or less equal in magnitude but opposite in sign, FAS-stable may fail to detect an edge between X and Y when in fact a 2-cycle exists. In this case, we check explicitly whether corr(X, Y |X > 0) and corr(X, Y |Y > 0) differ by more than a set amount of 0.3. If so, the adjacency is added to the graph and oriented using the aforementioned rules.

We include pairwise orientation rule RSkew, Skew, and Tanh from :footcite:t:`hyvarinen2013pairwise`, so in some configurations FASK can be made to implement an algorithm that has been called in the literature "Pairwise LiNGAM"--this is intentional; we do this for ease of comparison. You'll get this configuration if you choose one of these pairwise orientation rules, together with the FAS with orientation alpha and two-cycle threshold set to zero and skewness threshold set to 1, for instance.

See  :footcite:t:`sanchez2018causal`.


.. rubric:: Some fields described 
* ``edgeConstraints`` Name of the JSON file containing background knowledge 


.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "fask-fisher-z",
        "test": "fisher-z-test",
        "score": "sem-bic-score",
        "semBicStructurePrior": 1,
        "datatype": "continuous",
        "timeout": null,
        "edgeConstraints": "edgeConstraints.json"
      }
    ]

.. footbibliography::

