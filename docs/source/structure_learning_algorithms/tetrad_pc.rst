


:og:description: From TETRAD docs: PC algorithm :footcite:t:`doi:10.1177/089443939100900106` is a CPDAG search which assumes that the underlying causal structure of the input data is acyclic, and that no two variables are caused by the same latent (unmeasured) variable. In addition, it is assumed that the input data set is either entirely continuous or entirely discrete; if the data set is continuous, it is assumed that the causal relation between any two variables is linear, and that the distribution of each variable is Normal. Finally, the sample should ideally be i.i.d.. Simulations show that PC and several of the other algorithms described here often succeed when these assumptions, needed to prove their correctness, do not strictly hold. The PC algorithm will sometimes output double headed edges. In the large sample limit, double headed edges in the output indicate that the adjacent variables have an unrecorded common cause, but PC tends to produce false positive double headed edges on small samples.  The PC algorithm is correct whenever decision procedures for independence and conditional independence are available. The procedure conducts a sequence of independence and conditional independence tests, and efficiently builds a CPDAG from the results of those tests. As implemented in TETRAD, PC is intended for multinomial and approximately Normal distributions with i.i.d. data. The tests have an alpha value for rejecting the null hypothesis, which is always a hypothesis of independence or conditional independence. For continuous variables, PC uses tests of zero correlation or zero partial correlation for independence or conditional independence respectively. For discrete or categorical variables, PC uses either a chi square or a g square test of independence or conditional independence (see Causation, Prediction, and Search for details on tests). In either case, the tests require an alpha value for rejecting the null hypothesis, which can be adjusted by the user. The procedures make no adjustment for multiple testing. (For PC, CPC, JPC, JCPC, FCI, all testing searches.)  The PC algorithm as given in Causation, Prediction and Search :footcite:t:`spirtes2000causation` comes with three heuristics designed to reduce dependence on the order of the variables. The heuristic PC-1 simple sorts the variables in alphabetical order. The heuristic PC-2 and PC-3 sort edges by their p-values in the search. PP-3 further sorts parents of nodes in reverse order by the p-values of the conditional independence facts used to removed edges in the search. Please see Causation, Prediction, and Search for more details for these heuristics.
:og:image:alt: Benchpress logo
:og:sitename: Benchpress causal discovery platform
 
.. meta::
    :title: PC 
    :description: From TETRAD docs: PC algorithm :footcite:t:`doi:10.1177/089443939100900106` is a CPDAG search which assumes that the underlying causal structure of the input data is acyclic, and that no two variables are caused by the same latent (unmeasured) variable. In addition, it is assumed that the input data set is either entirely continuous or entirely discrete; if the data set is continuous, it is assumed that the causal relation between any two variables is linear, and that the distribution of each variable is Normal. Finally, the sample should ideally be i.i.d.. Simulations show that PC and several of the other algorithms described here often succeed when these assumptions, needed to prove their correctness, do not strictly hold. The PC algorithm will sometimes output double headed edges. In the large sample limit, double headed edges in the output indicate that the adjacent variables have an unrecorded common cause, but PC tends to produce false positive double headed edges on small samples.  The PC algorithm is correct whenever decision procedures for independence and conditional independence are available. The procedure conducts a sequence of independence and conditional independence tests, and efficiently builds a CPDAG from the results of those tests. As implemented in TETRAD, PC is intended for multinomial and approximately Normal distributions with i.i.d. data. The tests have an alpha value for rejecting the null hypothesis, which is always a hypothesis of independence or conditional independence. For continuous variables, PC uses tests of zero correlation or zero partial correlation for independence or conditional independence respectively. For discrete or categorical variables, PC uses either a chi square or a g square test of independence or conditional independence (see Causation, Prediction, and Search for details on tests). In either case, the tests require an alpha value for rejecting the null hypothesis, which can be adjusted by the user. The procedures make no adjustment for multiple testing. (For PC, CPC, JPC, JCPC, FCI, all testing searches.)  The PC algorithm as given in Causation, Prediction and Search :footcite:t:`spirtes2000causation` comes with three heuristics designed to reduce dependence on the order of the variables. The heuristic PC-1 simple sorts the variables in alphabetical order. The heuristic PC-2 and PC-3 sort edges by their p-values in the search. PP-3 further sorts parents of nodes in reverse order by the p-values of the conditional independence facts used to removed edges in the search. Please see Causation, Prediction, and Search for more details for these heuristics.


.. _tetrad_pc: 

tetrad_pc 
*************



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
     - :footcite:t:`doi:10.1177/089443939100900106`, :footcite:t:`spirtes2000causation`
   * - Graph type
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
   * - Docker 
     - `bpimages/causal-cmd:1.10.0 <https://hub.docker.com/r/bpimages/causal-cmd/tags>`__

   * - Module folder
     - `tetrad_pc <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/tetrad_pc>`__



PC 
------


From TETRAD docs: PC algorithm :footcite:t:`doi:10.1177/089443939100900106` is a CPDAG search which assumes that the underlying causal structure of the input data is acyclic, and that no two variables are caused by the same latent (unmeasured) variable. In addition, it is assumed that the input data set is either entirely continuous or entirely discrete; if the data set is continuous, it is assumed that the causal relation between any two variables is linear, and that the distribution of each variable is Normal. Finally, the sample should ideally be i.i.d.. Simulations show that PC and several of the other algorithms described here often succeed when these assumptions, needed to prove their correctness, do not strictly hold. The PC algorithm will sometimes output double headed edges. In the large sample limit, double headed edges in the output indicate that the adjacent variables have an unrecorded common cause, but PC tends to produce false positive double headed edges on small samples.

The PC algorithm is correct whenever decision procedures for independence and conditional independence are available. The procedure conducts a sequence of independence and conditional independence tests, and efficiently builds a CPDAG from the results of those tests. As implemented in TETRAD, PC is intended for multinomial and approximately Normal distributions with i.i.d. data. The tests have an alpha value for rejecting the null hypothesis, which is always a hypothesis of independence or conditional independence. For continuous variables, PC uses tests of zero correlation or zero partial correlation for independence or conditional independence respectively. For discrete or categorical variables, PC uses either a chi square or a g square test of independence or conditional independence (see Causation, Prediction, and Search for details on tests). In either case, the tests require an alpha value for rejecting the null hypothesis, which can be adjusted by the user. The procedures make no adjustment for multiple testing. (For PC, CPC, JPC, JCPC, FCI, all testing searches.)

The PC algorithm as given in Causation, Prediction and Search :footcite:t:`spirtes2000causation` comes with three heuristics designed to reduce dependence on the order of the variables. The heuristic PC-1 simple sorts the variables in alphabetical order. The heuristic PC-2 and PC-3 sort edges by their p-values in the search. PP-3 further sorts parents of nodes in reverse order by the p-values of the conditional independence facts used to removed edges in the search. Please see Causation, Prediction, and Search for more details for these heuristics.

.. rubric:: Some fields described 
* ``edgeConstraints`` Name of the JSON file containing background knowledge 


.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "pc-fisher-z",
        "test": "fisher-z-test",
        "alpha": 0.01,
        "datatype": "continuous",
        "timeout": null,
        "edgeConstraints": "edgeConstraints.json"
      }
    ]

.. footbibliography::

